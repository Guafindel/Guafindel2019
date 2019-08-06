package com.guafindel.mm.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.guafindel.mm.jdbc.jdbcUtil;
import com.guafindel.mm.member.domain.MemberInfo;

@Repository(value = "dao")  //따로 빈 이름을 지정하지 않으면 첫글자 소문자로 들어감 memberInfoDao
public class MemberInfoDao {

	
	public int insert(Connection conn, MemberInfo memberinfo) {
		
		int rCnt = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO MemberInfo (IDX, mId, mPw, mName, mPhoto)"
				+ "VALUES(MEMBERINFO_IDX_SEQ.NEXTVAL, ?, ?, ?, ?)";
		
		System.out.println(sql);
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberinfo.getmId());
			pstmt.setString(2, memberinfo.getmPw());
			pstmt.setString(3, memberinfo.getmName());
			pstmt.setString(4, memberinfo.getmPhoto());
			
			rCnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		return rCnt;
	}
	
	public MemberInfo select(Connection conn, String mId) {
		
		MemberInfo memberinfo = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		
		System.out.println("dao : memberId -> " + mId);
		
		String sql = "SELECT * FROM MEMBERINFO WHERE mId=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			
			rs = pstmt.executeQuery();
			
			if (rs!=null && rs.next()) {
				System.out.println("check ::::::::::::");
				
				memberinfo = new MemberInfo(
						rs.getInt("idx"),
						rs.getString("mId"),
						rs.getString("mPW"),
						rs.getString("mName"),
						rs.getString("mPhoto"),
						new Date(rs.getTimestamp("regdate").getTime()));
						
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			jdbcUtil.close(rs);
			jdbcUtil.close(pstmt);
		}
		
		return memberinfo;
	}
	
	
	
	
}













