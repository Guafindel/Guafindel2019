package com.guafindel.mm.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.guafindel.mm.jdbc.jdbcUtil;
import com.guafindel.mm.member.domain.MemberInfo;
import com.guafindel.mm.member.domain.SearchParam;

@Repository(value = "templateDao")
public class MemberJdbcTemplateDao {

	@Autowired
	private JdbcTemplate template;

	public int insert(MemberInfo memberinfo) {

		String sql = "insert into guafindel_db.member (mid, mpw, mname, mphoto)" + " values (?, ?, ?, ?)";

		return template.update(sql, memberinfo.getmId(), memberinfo.getmPw(), memberinfo.getmName(),
				memberinfo.getmPhoto());
	}

	public MemberInfo select(String mId) {

		String sql = "select * from guafindel_db.member where mid=?";

		List<MemberInfo> list = template.query(sql, new Object[] { mId }, new MemberInfoRowMapper());

		return list.isEmpty() ? null : list.get(0);
	}

	public MemberInfo select2(String mId) {

		String sql = "select * from guafindel_db.member where mid=?";

		MemberInfo memberinfo = null;

		try {
			memberinfo = template.queryForObject(sql, new Object[] { mId }, new MemberInfoRowMapper());
		} catch (Exception e) {
			e.printStackTrace();
		}

		return memberinfo;
	}

	public int selectTotalCount(SearchParam searchParam) {

		String sql = "select count(*) from guafindel_db.member";

		if (searchParam != null) {

			sql = "select count(*) from guafindel_db.member where ";

			if (searchParam.getStype().equals("both")) {
				sql += " mId like'%" + searchParam.getKeyword() + "%' or mName like'%" + searchParam.getKeyword()
						+ "%' ";
			}
			if (searchParam.getStype().equals("id")) {
				sql += " mId like'%" + searchParam.getKeyword() + "%' ";
			}
			if (searchParam.getStype().equals("name")) {
				sql += " mName like'%" + searchParam.getKeyword() + "%' ";
			}
		}

		return template.queryForObject(sql, Integer.class);

	}

	public List<MemberInfo> selectList(int index, int count) {

		String sql = "select * from guafindel_db.member limit ?,?";

		return template.query(sql, new MemberInfoRowMapper(), index, count);
	}

	public List<MemberInfo> selectListById(int index, int count, SearchParam searchParam) {

		String sql = "select * from guafindel_db.member where mid like ? limit ?, ?";

		return template.query(sql, new MemberInfoRowMapper(), "%" + searchParam.getKeyword() + "%", index, count);
	}

	public List<MemberInfo> selectListByName(int index, int count, SearchParam searchParam) {

		String sql = "SELECT * FROM guafindel_db.member where mname like ?  limit ?, ?";

		return template.query(sql, new MemberInfoRowMapper(), "%" + searchParam.getKeyword() + "%", index, count);

	}

	public List<MemberInfo> selectListByBoth(int index, int count, SearchParam searchParam) {

		String sql = "select * from guafindel_db.member where mid like ? or mname like ? limit ?, ?";

		return template.query(sql, new MemberInfoRowMapper(), "%" + searchParam.getKeyword() + "%",
				"%" + searchParam.getKeyword() + "%", index, count);
	}

	public MemberInfo selectMemberByIdx(int id) {

		String sql = "select * from guafindel_db.member where idx=?";

		MemberInfo memberinfo = null;

		try {
			memberinfo = template.queryForObject(sql, new MemberInfoRowMapper(), id);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}

		return memberinfo;
	}

	public int memberUpdate(MemberInfo memberinfo) {

		String sql = "update guafindel_db.member set mName=?, mPw=?, mPhoto=? where idx=?";

		return template.update(sql, memberinfo.getmName(), memberinfo.getmPw(), memberinfo.getmPhoto(),
				memberinfo.getIdx());
	}

	public int memberDelete(int id) {

		String sql = "delete from guafindel_db.member where idx=?";

		return template.update(sql, id);
	}

/////////////////////////////////////JdbcTemplate를 쓰지 않았던 코드들/////////////////////////////////////////////////

	public int insert(Connection conn, MemberInfo memberinfo) {

		int rCnt = 0;

		PreparedStatement pstmt = null;

		// oracle
		// String sql = "insert into memberinfo (idx, mid,mpw,mname,mphoto)
		// values(memberinfo_idx_seq, ?, ?, ?, ?)";

		// Mysql
		String sql = "insert into guafindel_db.member (mid, mpw, mname, mphoto)" + " values (?, ?, ?, ?)";

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

		// oracle
		// String sql = "SELECT * FROM MEMBERINFO WHERE mId=?";

		// mysql
		String sql = "select * from guafindel_db.member where mid=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);

			rs = pstmt.executeQuery();

			if (rs != null && rs.next()) {
				System.out.println("check ::::::::::::");

				memberinfo = new MemberInfo(rs.getInt("idx"), rs.getString("mId"), rs.getString("mPW"),
						rs.getString("mName"), rs.getString("mPhoto"), new Date(rs.getTimestamp("regdate").getTime()));

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

	public List<MemberInfo> selectList(Connection conn, int index, int count) {

		List<MemberInfo> memberList = new ArrayList<MemberInfo>();

		PreparedStatement pstmt = null;

		ResultSet rs = null;

		String sql = "select * from guafindel_db.member limit ?,?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, index);
			pstmt.setInt(2, count);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				memberList.add(new MemberInfo(rs.getInt("idx"), rs.getString("mId"), rs.getString("mPw"),
						rs.getString("mName"), rs.getString("mPhoto"), new Date(rs.getDate("regdate").getTime())));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return memberList;
	}

	public int selectTotalCount(Connection conn, SearchParam searchParam) {

		int totalCnt = 0;

		Statement stmt = null;

		ResultSet rs = null;

		String sql = "select count(*) from guafindel_db.member";

		if (searchParam != null) {

			sql = "select count(*) from guafindel_db.member where ";

			if (searchParam.getStype().equals("both")) {
				sql += " mId like'%" + searchParam.getKeyword() + "%' or mName like'%" + searchParam.getKeyword()
						+ "%' ";
			}
			if (searchParam.getStype().equals("id")) {
				sql += " mId like'%" + searchParam.getKeyword() + "%' ";
			}
			if (searchParam.getStype().equals("name")) {
				sql += " mName like'%" + searchParam.getKeyword() + "%' ";
			}
		}

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				totalCnt = rs.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return totalCnt;
	}

	public List<MemberInfo> selectListById(Connection conn, int index, int count, SearchParam searchParam) {

		List<MemberInfo> memberList = new ArrayList<MemberInfo>();

		PreparedStatement pstmt = null;

		ResultSet rs = null;

		String sql = "select * from guafindel_db.member where mid like ? limit ?, ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + searchParam.getKeyword() + "%");
			pstmt.setInt(2, index);
			pstmt.setInt(3, count);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				memberList.add(new MemberInfo(rs.getInt("idx"), rs.getString("mId"), rs.getString("mPw"),
						rs.getString("mName"), rs.getString("mPhoto"), new Date(rs.getDate("regdate").getTime())));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return memberList;
	}

	public List<MemberInfo> selectListByName(Connection conn, int index, int count, SearchParam searchParam) {

		List<MemberInfo> memberList = new ArrayList<MemberInfo>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM guafindel_db.member where mname like ?  limit ?, ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + searchParam.getKeyword() + "%");
			pstmt.setInt(2, index);
			pstmt.setInt(3, count);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				memberList.add(new MemberInfo(rs.getInt("idx"), rs.getString("mid"), rs.getString("mpw"),
						rs.getString("mname"), rs.getString("mphoto"), new Date(rs.getDate("regdate").getTime())));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return memberList;
	}

	public List<MemberInfo> selectListByBoth(Connection conn, int index, int count, SearchParam searchParam) {
		List<MemberInfo> memberList = new ArrayList<MemberInfo>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from guafindel_db.member where mid like ? or mname like ? limit ?, ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + searchParam.getKeyword() + "%");
			pstmt.setString(2, "%" + searchParam.getKeyword() + "%");
			pstmt.setInt(3, index);
			pstmt.setInt(4, count);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				memberList.add(new MemberInfo(rs.getInt("idx"), rs.getString("mId"), rs.getString("mPw"),
						rs.getString("mName"), rs.getString("mPhoto"), new Date(rs.getDate("regdate").getTime())));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return memberList;
	}

	public MemberInfo selectMemberByIdx(Connection conn, int id) {

		MemberInfo memberinfo = null;

		PreparedStatement pstmt = null;

		ResultSet rs = null;

		System.out.println("dao : memberId -> " + id);

		String sql = "select * from guafindel_db.member where idx=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();

			if (rs != null && rs.next()) {
				System.out.println("check :::::::::::::::");
				memberinfo = new MemberInfo(rs.getInt("idx"), rs.getString("mId"), rs.getString("mPw"),
						rs.getString("mName"), rs.getString("mPhoto"), new Date(rs.getTimestamp("regdate").getTime()));
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

	public int memberUpdate(Connection conn, MemberInfo memberinfo) {

		System.out.println(">>>>>>>>>>" + memberinfo);

		int rCnt = 0;
		PreparedStatement pstmt = null;
		String sql = "update guafindel_db.member set mName=?, mPw=?, mPhoto=? where idx=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberinfo.getmName());
			pstmt.setString(2, memberinfo.getmPw());
			pstmt.setString(3, memberinfo.getmPhoto());
			pstmt.setInt(4, memberinfo.getIdx());

			rCnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return rCnt;
	}

	public int memberDelete(Connection conn, int id) {

		int rCnt = 0;

		PreparedStatement pstmt = null;

		String sql = "delete from guafindel_db.member where idx=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);

			rCnt = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return rCnt;
	}

}
