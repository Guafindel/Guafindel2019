package com.guafindel.mm.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.guafindel.mm.member.domain.MemberInfo;
import com.guafindel.mm.member.domain.SearchParam;

public interface MemberSessionDao {
	
	public int insert(MemberInfo memberinfo);
	
	public MemberInfo selectMemberById(String mId);
	
	public MemberInfo select2(String mId);
	
	public int selectTotalCount(SearchParam searchParam);
	
	public List<MemberInfo> selectList(Map<String, Object> params);
	
	public MemberInfo selectMemberByIdx(int id);
	
	public int memberUpdate(MemberInfo memberinfo);
	
	public int memberDelete(int id);
	
	//회원의 전체 리스트
	public List<MemberInfo> selectAllList();
	
	//회원 이메일 인증 처리
	public int verify(String id, String code);
	
	//임시 비밀번호 발송
	public int findPw(String id);
	
	
}
