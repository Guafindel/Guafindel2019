package com.guafindel.guest.service;

import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.guafindel.guest.dao.MessageJdbcTemplateDao;
import com.guafindel.guest.dao.MessageSessionDao;
import com.guafindel.guest.dao.MessageSessionTemplateDao;
import com.guafindel.guest.domain.Message;

@Service(value = "deleteService")
public class DeleteMessageService implements GuestBookService {

	// @Autowired
	// private MessageDao dao;
	
	//@Autowired
	//private MessageJdbcTemplateDao2 dao;

	//@Autowired
	//private MessageSessionTemplateDao templateDao;
	
	@Autowired
	private SqlSessionTemplate template;

	private MessageSessionDao dao;
	
	@Transactional
	public int deleteMessage(int messageId, String password)
			throws SQLException, MessageNotFoundException, InvalidMessagePasswordException {
		
		dao = template.getMapper(MessageSessionDao.class);

		int resultCnt = 0;

		// Connection conn = null;

		//try {
		// conn = ConnectionProvider.getConnection();

		// 트랜잭션 처리
		// conn.setAutoCommit(false); //commit가 자동으로 되는것을 막아둔다 default는 true

		// Message Dao 필요
		// MessageDao dao = MessageDao.getInstance();

		// 1. 전달받은 게시물 아이디로 게시물 확인
		// Message message = dao.select(conn, messageId);
		//Message message = templateDao.select(messageId);
		Message message = dao.select(messageId);
		
		// 2. 게시물이 존재 하지 않으면 예외 처리
		if (message == null) {
			throw new MessageNotFoundException("메세지가 존재하지 않습니다. : " + messageId);
		}

		// 3. 게시물이 존재 하면 비밀번호 확인(존재여부) -> 사용자가 입력한 비밀번호와 비교
		// 4. 비밀번호가 존재하지 않거나 사용자 비밀번호가 틀린 경우 예외처리 -> rollback
		if (!message.hasPassword()) {
			throw new InvalidMessagePasswordException("비밀번호가 일치하지 않습니다.");
		}

		// 비밀번호 비교
		if (!message.matchPassword(password)) {
			throw new InvalidMessagePasswordException("비밀번호가 일치하지 않습니다.");
		}

		// 5. 비밀번호가 일치하면 정상 처리(삭제 처리) -> commit
		//resultCnt = templateDao.deleteMessage(messageId);
		resultCnt = dao.deleteMessage(messageId);

		// 정상 처리
		// conn.commit(); //모든 처리를 마치고 commit을 한다. 물리적으로 저장하라는 의미.

		

		return resultCnt;
	
	}

}
