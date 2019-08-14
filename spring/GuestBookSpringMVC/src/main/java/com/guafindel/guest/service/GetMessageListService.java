package com.guafindel.guest.service;


import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guafindel.guest.dao.MessageJdbcTemplateDao;
import com.guafindel.guest.dao.MessageSessionDao;
import com.guafindel.guest.dao.MessageSessionTemplateDao;
import com.guafindel.guest.domain.Message;
import com.guafindel.guest.domain.MessageListView;


@Service(value = "listService")
public class GetMessageListService implements GuestBookService {

	// @Autowired
	// private MessageDao dao;
	
	//@Autowired
	//private MessageJdbcTemplateDao dao;

	//@Autowired
	//private MessageSessionTemplateDao templateDao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	private MessageSessionDao dao;

	// 1. 한 페이지에 보여줄 게시글의 개수
	private static final int MESSAGE_COUNT_PER_PAGE = 3;

	public MessageListView getMessageListView(int pageNumber) {
		
		dao = template.getMapper(MessageSessionDao.class);

		// 2. 현재 페이지 번호
		int currentPageNumber = pageNumber;

		// Connection conn;

		MessageListView view = null;

		// try {
		// Connection
		// conn = ConnectionProvider.getConnection();

		// DAO
		// MessageDao dao = MessageDao.getInstance();

		// 전체 게시물의 개수
		//int messageTotalCount = dao.selectCount(conn);
		//int messageTotalCount = templateDao.selectCount();
		int messageTotalCount = dao.selectCount();

		// 게시물 내용 리스트, DB 검색에 사용할 start_row, end_row
		List<Message> messageList = null;
		int firstRow = 0;
		int endRow = 0;

		if (messageTotalCount > 0) {

			firstRow = (pageNumber - 1) * MESSAGE_COUNT_PER_PAGE + 1;
			endRow = firstRow + MESSAGE_COUNT_PER_PAGE - 1;
			

			// messageList = dao.selectList(conn, firstRow, endRow);
			Map<String, Object> params = new HashMap<String, Object>();
			
			System.out.println(firstRow+":"+ endRow);
			
			
			params.put("firstRow", firstRow);
			params.put("endRow", endRow);
			
			//messageList = templateDao.selectList(params);
			//messageList = dao.selectList(firstRow, endRow);
			messageList = dao.selectList(params);

		} else {
			currentPageNumber = 0;
			messageList = Collections.emptyList();
		}

		view = new MessageListView(
				messageTotalCount,
				currentPageNumber,
				messageList,
				MESSAGE_COUNT_PER_PAGE,
				firstRow,
				endRow);

		/*
		 * } catch (SQLException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); }
		 */

		return view;

	}
}