package guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guestbook.dao.MessageDao;
import guestbook.model.Message;
import jdbc.ConnectionProvider;
import jdbc.jdbcUtil;

public class DeleteMessageService implements GuestBookService {
	
	/*
	 * private DeleteMessageService() {}
	 * 
	 * private static DeleteMessageService service = new DeleteMessageService();
	 * 
	 * public static DeleteMessageService getInstance() { return service; }
	 */
	
	public int deleteMessage(int messageId, String password) throws SQLException, MessageNotFoundException, InvalidMessagePasswordException {
		
		int resultCnt = 0;
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			//트랜잭션 처리
			conn.setAutoCommit(false); //commit가 자동으로 되는것을 막아둔다 default는 true
		
			 
			//Message Dao 필요
			MessageDao dao = MessageDao.getInstance();
			
			//1. 전달받은 게시물 아이디로 게시물 확인
			Message message = dao.select(conn, messageId);
			
			//2. 게시물이 존재 하지 않으면 예외 처리
			if (message == null) {
				throw new MessageNotFoundException("메세지가 존재하지 않습니다. : " + messageId);
			}
			
			//3. 게시물이 존재 하면 비밀번호 확인(존재여부) -> 사용자가 입력한 비밀번호와 비교
			//4. 비밀번호가 존재하지 않거나 사용자 비밀번호가 틀린 경우 예외처리 -> rollback
			if(!message.hasPassword()) {
				throw new InvalidMessagePasswordException("비밀번호가 일치하지 않습니다.");
			}
			
			//비밀번호 비교 
			if(!message.matchPassword(password)) {
				throw new InvalidMessagePasswordException("비밀번호가 일치하지 않습니다.");
			}
			
			//5. 비밀번호가 일치하면 정상 처리(삭제 처리) -> commit
			resultCnt = dao.deleteMessage(conn, messageId);
			
		
			//정상 처리
			conn.commit(); //모든 처리를 마치고 commit을 한다. 물리적으로 저장하라는 의미.
			

			
		} catch (SQLException e) {
			//트랜잭션의 롤백(마지막 commit 위치로 돌아가는 명령어).
			jdbcUtil.rollback(conn); //트랜잭션 처리 과정에서 예외상황(오류)이 발생했을 때 롤백을 시킨다.
			e.printStackTrace();
			throw e;
			
		} catch (MessageNotFoundException e) {
			//트랜잭션의 롤백(마지막 commit 위치로 돌아가는 명령어).
			jdbcUtil.rollback(conn); //트랜잭션 처리 과정에서 예외상황(오류)이 발생했을 때 롤백을 시킨다.
			e.printStackTrace();
			throw e;
			
		} catch (InvalidMessagePasswordException e) {
			//트랜잭션의 롤백(마지막 commit 위치로 돌아가는 명령어).
			jdbcUtil.rollback(conn); //트랜잭션 처리 과정에서 예외상황(오류)이 발생했을 때 롤백을 시킨다.
			e.printStackTrace();
			throw e;
		}
		
		return resultCnt;
	}

	
	
	
	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {
		
		String viewPage = "/WEB-INF/view/delete.jsp";
		
		int messageId = Integer.parseInt(request.getParameter("messageId"));
		
		String password = request.getParameter("password");
		
		//결과 : true/false
		//처리개수 : resultCnt
		//메세지 : msg
		
		boolean chk = false;
		int resultCnt = 0;
		String msg = "";
		
		try {
			resultCnt = deleteMessage(messageId, password);
			chk = true;
			
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			msg = e.getMessage();
			
		} catch (MessageNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			msg = e.getMessage();
			
		} catch (InvalidMessagePasswordException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			msg = e.getMessage();
			
		}
	
		//뷰 페이지와 결과 데이터를 공유(전달)
		request.setAttribute("chk", chk);
		request.setAttribute("resultCnt", resultCnt)
		;
		request.setAttribute("msg", msg);
		
		return viewPage;
	}
}
