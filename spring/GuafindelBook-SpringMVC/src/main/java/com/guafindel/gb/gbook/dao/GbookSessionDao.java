package com.guafindel.gb.gbook.dao;

import java.util.List;
import java.util.Map;

import com.guafindel.gb.gbook.domain.Gbook;
import com.guafindel.gb.gbook.domain.SearchParam;

public interface GbookSessionDao {

	//회원가입
	public int insert(Gbook gbook);
	
	//전체 회원 리스트
	public List<Gbook> selectAllList();
	
	//회원정보 수정을 위한 idx로 회원 타겟 설정 하기 
	public Gbook selectByIdx(int id);
	
	//회원 로그인을 위한 id로 회원 찾기
	public Gbook selectById(String gId);
	
	//타겟 설정한 회원의 정보 수정하기
	public int update(Gbook gbook);
	
	//회원정보 삭제하기
	public int delete(int id);
	
	//회원 리스트의 개수 구하기
	public int selectTotalCount(SearchParam searchParam);
	
	//정해진 개수만큼 회원 리스트 구하기
	public List<Gbook> selectList(Map<String, Object> params);
	
	//회원 이메일 인증 처리
	public int verify(String id, String code);
	
}
