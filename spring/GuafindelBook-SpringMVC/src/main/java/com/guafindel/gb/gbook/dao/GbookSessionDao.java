package com.guafindel.gb.gbook.dao;

import java.util.List;

import com.guafindel.gb.gbook.domain.Gbook;

public interface GbookSessionDao {

	//회원가입
	public int insert(Gbook gbook);
	
	//전체 회원 리스트
	public List<Gbook> selectAllList();
	
	//회원정보 수정을 위한 idx로 회원 타겟 설정 하기 
	public Gbook selectByIdx(int id);
	
	//타겟 설정한 회원의 정보 수정하기
	public int update(Gbook gbook);
	
	//회원정보 삭제하기
	public int delete(int id);
	
	public Gbook select(String gId);
	
}
