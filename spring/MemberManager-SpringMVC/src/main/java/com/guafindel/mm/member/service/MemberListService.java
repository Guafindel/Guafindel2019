package com.guafindel.mm.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.guafindel.mm.member.dao.MemberJdbcTemplateDao;
import com.guafindel.mm.member.dao.MemberSessionDao;
import com.guafindel.mm.member.domain.ListViewData;
import com.guafindel.mm.member.domain.MemberInfo;
import com.guafindel.mm.member.domain.SearchParam;

@Service(value = "listService")
public class MemberListService implements MemberManagerService {

	//@Autowired
	//private MemberJdbcTemplateDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	private MemberSessionDao dao;

	final int MEMBER_COUNT_LIST = 3;

	public ListViewData getListData(int currentPageNumber, SearchParam searchParam) {

		
		dao = template.getMapper(MemberSessionDao.class);

		ListViewData listData = new ListViewData();

		// 현재 페이지 번호
		listData.setCurrentPageNumber(currentPageNumber);

		// 전체 게시물의 개수
		int totalCnt = dao.selectTotalCount(searchParam);

		int totalPageCnt = 0;
		// 전체 페이지 개수
		if (totalCnt > 0) {
			totalPageCnt = totalCnt / MEMBER_COUNT_LIST;
			if (totalCnt % MEMBER_COUNT_LIST > 0) {
				totalPageCnt++;
			}

		}
		listData.setPageTotalCount(totalPageCnt);

		// 구간 검색을 위한 index
		// /1 -> 0/, /2 -> 3/, /3 -> 6/, /4 -> 9/
		int index = (currentPageNumber - 1) * MEMBER_COUNT_LIST;

		// 회원 정보 리스트
		List<MemberInfo> memberList = null;
		// 1. 검색 조건이 없는 겨우 selectList -> 전체 회원의 리스트
		// 2. id로 검색 : where like mId '%?%'
		// 3. name으로 검색 : where like mName '%?%'
		// 4. id 또는 name : where like mid '%?%' or like mName '%?%'

		/*
		 * if (searchParam == null) {
		 * 
		 * System.out.println(index);
		 * 
		 * memberList = dao.selectList(index, MEMBER_COUNT_LIST);
		 * 
		 * System.out.println("guafindel" + searchParam);
		 * 
		 * } else if (searchParam.getStype().equals("both")) {
		 * 
		 * memberList = dao.selectListByBoth(index, MEMBER_COUNT_LIST, searchParam);
		 * 
		 * } else if (searchParam.getStype().equals("id")) {
		 * 
		 * memberList = dao.selectListById(index, MEMBER_COUNT_LIST, searchParam);
		 * 
		 * } else if (searchParam.getStype().equals("name")) {
		 * 
		 * memberList = dao.selectListByName(index, MEMBER_COUNT_LIST, searchParam);
		 * 
		 * }
		 */
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("search", searchParam);
		params.put("index", index);
		params.put("count", MEMBER_COUNT_LIST);
		
		memberList = dao.selectList(params);
		System.out.println("사이즈 : : : : " + totalCnt);
		System.out.println("리스트 사이즈 : : : : : " + memberList.size());

		listData.setMemberList(memberList);
		
		for(MemberInfo m : memberList) {
			System.out.println(m);
		}

		// /1->9-0 = 9/ /2 -> 9-3=6/
		int no = totalCnt - index;
		listData.setNo(no);

		// listData.setTotalCount(dao.selectTotalCount(conn, searchParam));
		listData.setTotalCount(totalCnt);

		return listData;
	}

	public List<MemberInfo> getAllList() {
		
		dao = template.getMapper(MemberSessionDao.class);
		
		List<MemberInfo> list = dao.selectAllList();
		
		return list;
	}
}