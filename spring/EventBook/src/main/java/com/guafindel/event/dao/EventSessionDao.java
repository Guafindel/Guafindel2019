package com.guafindel.event.dao;

import java.util.List;

import com.guafindel.event.domain.EventInfo;

public interface EventSessionDao {

	//게시글 작성
	public int eventInsert(EventInfo eventInfo);
	
	//전체 리스트 확인하기
	public List<EventInfo> selectAllList();
	
	//아이디로 찾기 특정글을 확인할 때
	public EventInfo selectById(String e_id);
	
	//e_num으로 찾기 
	public EventInfo selectByNum(String e_num);
	
	//게시글 수정
	public int eventUpdate(EventInfo eventInfo);
	
	//게시글 삭제
	public int eventDelete(EventInfo eventInfo);
	
	
}
