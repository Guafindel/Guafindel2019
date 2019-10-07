package com.guafindel.demo.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.guafindel.demo.entity.MemberEntity;

public interface MemberDao<T> extends Serializable {

	public List<T> getAll();
	public T findByIdx(long idx);
	public List<T> findByMname(String name);
	public List<T> find(String fstr);
	
	@Query("select from MemberEntity d order by d.idx desc")
	public List<MemberEntity> findall(); 
	
}
