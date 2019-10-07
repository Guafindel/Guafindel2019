package com.guafindel.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.guafindel.demo.entity.MemberEntity;

public interface MemberRepository extends JpaRepository<MemberEntity, Long> {

	public MemberEntity findByIdx(long idx);
	public List<MemberEntity> findByMnameLike(String name);
	public List<MemberEntity> findByIdxBetween(Long arg1, Long arg2);
	
	@Query("select d from MemberEntity d order by d.idx desc")
	public List<MemberEntity> findall(); 
	
}
