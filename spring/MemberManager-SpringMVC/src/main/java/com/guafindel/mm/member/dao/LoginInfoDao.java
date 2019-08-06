package com.guafindel.mm.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginInfoDao {
	
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement pstmt;
	
	//싱글톤 시작
	private static LoginInfoDao dao = new LoginInfoDao();
	
	public static LoginInfoDao getInstance() {
		
		return dao;
	}
	private LoginInfoDao() {}
	//싱글톤 끝
	
	public int login(String mId, String mPw) {
		
		PreparedStatement pstmt = null;
		
		String sql = "select mPw from LoginInfo where mId = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				if(rs.getString(1).equals(mPw)) {
					return 1;
				} else {
					
					return 0;
				}
			}
			return -1;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -2;
	}
	
	
}
