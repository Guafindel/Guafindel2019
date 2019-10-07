package com.guafindel.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.guafindel.demo.domain.MemberInfo;
import com.guafindel.demo.entity.MemberEntity;

public interface MemberMapper {

	@Select("select * from guafindel_db.member order by idx desc")
	public List<MemberInfo> selectAll();
	public MemberInfo selectMemberById(String mid);
	
}
