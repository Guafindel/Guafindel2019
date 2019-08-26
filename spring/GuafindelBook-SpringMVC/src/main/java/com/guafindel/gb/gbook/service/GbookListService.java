package com.guafindel.gb.gbook.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guafindel.gb.gbook.dao.GbookSessionDao;
import com.guafindel.gb.gbook.domain.Gbook;
import com.guafindel.gb.gbook.domain.ListViewData;
import com.guafindel.gb.gbook.domain.SearchParam;

@Service("gbookListService")
public class GbookListService implements GbookService {
	
	final int GBOOK_COUNT_LIST = 10;

	@Autowired
	private SqlSessionTemplate template;

	private GbookSessionDao dao;
	
	public List<Gbook> getAllList() {
		
		dao = template.getMapper(GbookSessionDao.class);
		
		List<Gbook> list = dao.selectAllList();
		
		return list;
	}
	
	public ListViewData getListData(int currentPageNumber, SearchParam searchParam) {
		
		dao = template.getMapper(GbookSessionDao.class);
		
		ListViewData listData = new ListViewData();
		
		//현재 페이지 번호
		listData.setCurrentPageNumber(currentPageNumber);
		//전체 게시물의 개수
		int totalCnt = dao.selectTotalCount(searchParam);
		
		int totalPageCnt = 0;
		//전체 페이지 개수
		if (totalCnt > 0) {
			totalPageCnt = totalCnt / GBOOK_COUNT_LIST;
			if (totalCnt % GBOOK_COUNT_LIST > 0) {
				totalPageCnt++;
			}
		}
		listData.setPageTotalCount(totalPageCnt);
		
		//구간 검색을 위한 index
		// 1->0 / 2->10 / 3->20 / 4->30
		int index = (currentPageNumber - 1) * GBOOK_COUNT_LIST;
		
		
		//회원 정보 리스트
		List<Gbook> gbookList = null;
		//1. 검색 조건이 없는 경우 -> 전체 회원의 리스트
		//2. id로 검색 : where like gId '%?%'
		//3. name으로 검색: where like gName '%?%'
		//4. id 또는 name으로 검색 : where like gId '%?%' or like gName '%?%'
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("search", searchParam);
		params.put("index", index);
		params.put("count", GBOOK_COUNT_LIST);
		
		gbookList = dao.selectList(params);
		System.out.println("사이즈 = " + totalCnt);
		System.out.println("리스트 사이즈 = " + gbookList.size());
		
		listData.setGbookList(gbookList);
		
		for(Gbook g : gbookList) {
			System.out.println(g);
		}
		
		int no = totalCnt - index;
		           
		listData.setNo(no);
		
		listData.setTotalCount(totalCnt);
		
		return listData;
		
	}
}
