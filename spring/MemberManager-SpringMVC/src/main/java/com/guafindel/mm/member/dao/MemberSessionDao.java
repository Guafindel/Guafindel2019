package com.guafindel.mm.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.guafindel.mm.member.domain.MemberInfo;
import com.guafindel.mm.member.domain.SearchParam;

public interface MemberSessionDao {

	public int insert(MemberInfo memberinfo);
	
	public MemberInfo select(String mId);
	
	public MemberInfo select2(String mId);
	
	public int selectTotalCount(SearchParam searchParam);
	
	public List<MemberInfo> selectList(Map<String, Object> params);
	
	public MemberInfo selectMemberByIdx(int id);
	
	public int memberUpdate(MemberInfo memberinfo);
	
	public int memberDelete(int id);
	
	//회원의 전체 리스트
	public List<MemberInfo> selectAllList();
	
	
}
