package com.ngh.donate.dao;

import java.util.List;
import java.util.Map;

import com.ngh.donate.domain.DonateInfo;
import com.ngh.donate.domain.DonateListInfo;
import com.ngh.donate.domain.DonationEditInfo;

public interface DonateDaoInterface {
	
	//후원정보 삽입
	public int insert(DonateInfo donateInfo);
	
	//리스트 검색
	public List<DonateListInfo> getList(Map<String, Object> param);
	
	//리스트 번호 검색
	public int getListCount(Map<String, Object> param2);
		
	//결제 취소
	public int delete(int index);
	
	//결제 정보 수정
	public int edit(DonationEditInfo donateEditInfo);
}
