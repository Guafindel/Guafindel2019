package com.guafindel.mm.member.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import org.springframework.jdbc.core.RowMapper;

import com.guafindel.mm.member.domain.MemberInfo;

public class MemberInfoRowMapper implements RowMapper<MemberInfo> {

	@Override
	public MemberInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
		
				MemberInfo memberinfo = new MemberInfo(
						
				rs.getInt("idx"),
				rs.getString("mid"),
				rs.getString("mpw"),
				rs.getString("mname"),
				rs.getString("mphoto"),
				new Date(rs.getDate("regdate").getTime()));
				
		return memberinfo;
	}

}
