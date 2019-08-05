package com.guafindel.guest.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.guafindel.guest.domain.Message;


@Repository("dao") //따로 이름을 지정하지 않으면 클래스 이름의 첫 문자 소문자 형식으로 들어간다 messageDao
public class MessageDao { 

	public int insert(Connection conn, Message message) {
		int rCnt = 0;
		PreparedStatement pstmt = null;

		String sql = "INSERT INTO GUESTBOOK_MESSAGE (MESSAGE_ID, GUEST_NAME, PASSWORD, MESSAGE)\r\n" + 
				"VALUES (GM_MID_SEQ.nextval, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, message.getGuestName());
			pstmt.setString(2, message.getPassword());
			pstmt.setString(3, message.getMessage());
			
			rCnt = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		return rCnt;
	}

	
	public Message select(Connection conn, int messageId) {
		
		Message message = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from guestbook_message where message_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, messageId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				message = new Message();
				message.setId(rs.getInt(1));
				message.setGuestName(rs.getString(2));
				message.setPassword(rs.getString(3));
				message.setMessage(rs.getString(4));
				
			}
			

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return message;
	}

	public int selectCount(Connection conn) {
		
		Statement stmt = null;
		ResultSet rs = null;
		
		int totalCnt = 0;
		
		String sql = "SELECT COUNT(*) FROM GUESTBOOK_MESSAGE";
		
		try {
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			if( rs.next() ) {
				totalCnt = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return totalCnt;
	}

	public List<Message> selectList(Connection conn, int firstRow, int endRow) {
		
		List<Message> list = new ArrayList<Message>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select message_id, guest_name, password, message from ( "
				+ " select rownum rnum, message_id, guest_name, password, message from ( "
				+ " select * from guestbook_message m order by m.message_id desc "
				+ " ) where rownum <= ? " + ") where rnum >= ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, firstRow);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				Message msg = new Message();
				msg.setId(rs.getInt(1));
				msg.setGuestName(rs.getString(2));
				msg.setPassword(rs.getString(3));
				msg.setMessage(rs.getString(4));
				
				list.add(msg);
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}

	public int deleteMessage(Connection conn, int messageId) throws SQLException {
		//PreparedStatement 객체 생성
		
		int resultCnt = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "DELETE FROM GUESTBOOK_MESSAGE WHERE MESSAGE_ID=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, messageId);
			
			resultCnt = pstmt.executeUpdate();
			
		} finally {
			com.guafindel.guest.jdbc.jdbcUtil.close(pstmt);
		}
		
		return resultCnt;
	}
	
}








