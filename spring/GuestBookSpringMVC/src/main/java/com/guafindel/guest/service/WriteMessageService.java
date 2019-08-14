package com.guafindel.guest.service;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guafindel.guest.dao.MessageDao;
import com.guafindel.guest.dao.MessageSessionDao;
import com.guafindel.guest.dao.MessageSessionTemplateDao;
import com.guafindel.guest.domain.Message;
import com.guafindel.guest.jdbc.ConnectionProvider;

@Service("writeService")
public class WriteMessageService implements GuestBookService {
	
	//@Autowired
	//private MessageDao dao;
	
	//@Autowired
	//private MessageSessionTemplateDao templateDao;
	
	//@Autowired
	//private MessageSessionTemplateDao templateDao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	private MessageSessionDao dao;

	public int write(Message message) {
		
		dao = template.getMapper(MessageSessionDao.class);

		int rCnt = 0;
		
		//rCnt = templateDao.insert(message);
		rCnt = dao.insert(message);
		

		// 1. Connection 생성
		// 2. dao 생성
		// 3. insert 메소드 실행

		/* Connection conn = null; */

		/* try { */
			/*
			 * conn = ConnectionProvider.getConnection();
			 * 
			 * rCnt = dao.insert(conn, message);
			 * 
			 */
			
		/*} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/

		return rCnt;

	}

}
