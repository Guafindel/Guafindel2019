package com.guafindel.event.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guafindel.event.dao.EventSessionDao;
import com.guafindel.event.domain.EventInfo;
import com.guafindel.event.domain.ListViewData;
import com.guafindel.event.domain.SearchParam;

@Service("listService")
public class ListEventService {

	@Autowired
	private SqlSessionTemplate template;
	
	private EventSessionDao dao;
	
	final int EVENT_CNT_LIST = 30;
	
	public EventInfo selectById(String e_id) {
		
		dao = template.getMapper(EventSessionDao.class);
		
		EventInfo list = dao.selectById(e_id);
		
		return list;
		
	}
	
	public List<EventInfo> getAllList() {
		
		dao = template.getMapper(EventSessionDao.class);
		
		List<EventInfo> list = dao.selectAllList();
		
		return list;
	}
	
	public ListViewData getListData(
			int currentPageNumber,
			SearchParam searchParam
			) {
		
		dao = template.getMapper(EventSessionDao.class);
		
		ListViewData listData = new ListViewData();
		
		//현재 페이지 번호
		listData.setCurrentPageNumber(currentPageNumber);
		
		//전체 게시물의 개수
		int totalCnt = dao.selectTotalCount(searchParam);
		
		int totalPageCnt = 0;
		
		if(totalCnt>0) {
			totalPageCnt = totalCnt/EVENT_CNT_LIST;
			if(totalCnt%EVENT_CNT_LIST>0) {
				totalPageCnt++;
			}
		}
		listData.setPageTotalCount(totalPageCnt);
		
		//구간 검색을 위한 index
		// 1-> 0, 2-> 10, 3-> 20, 4-> 30
		int index = (currentPageNumber-1) * EVENT_CNT_LIST;
		
		//회원 정보 리스트
		List<EventInfo> eventList = null;
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("search", searchParam);
		params.put("index", index);
		params.put("count", EVENT_CNT_LIST);
		
		eventList = dao.selectList(params);
		System.out.println("사이즈 :::: " + totalCnt);
		System.out.println("리스트 사이즈 :::: " + eventList.size());
		
		listData.setEventList(eventList);
		for(EventInfo e : eventList) {
			System.out.println(e);
		}
		
		int no = totalCnt - index;
		
		listData.setNo(no);
		
		listData.setTotalCount(totalCnt);
		
		return listData;
	}
	
}
