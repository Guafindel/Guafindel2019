package com.guafindel.gb.gbook.dao;

import com.guafindel.gb.gbook.domain.Gbook;

public interface GbookSessionDao {

	public int insert(Gbook gbook);
	
	public Gbook select(String gId);
	
	
}
