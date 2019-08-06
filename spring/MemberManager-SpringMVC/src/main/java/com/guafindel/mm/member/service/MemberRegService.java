package com.guafindel.mm.member.service;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guafindel.mm.jdbc.ConnectionProvider;
import com.guafindel.mm.member.dao.MemberInfoDao;
import com.guafindel.mm.member.domain.MemberInfo;
import com.guafindel.mm.member.domain.RequestMemberRegist;

@Service(value = "registService") //memberRegService
public class MemberRegService implements MemberManagerService {

	@Autowired
	private MemberInfoDao dao;

	public int memberInsert(HttpServletRequest request, RequestMemberRegist regist) {

		// 서버 경로
		String path = "/uploadfile/userphoto"; // 리소스 맵핑 필요
		// 절대 경로
		String dir = request.getSession().getServletContext().getRealPath(path); // 실제 저장 경로

		System.out.println(dir);
		
		MemberInfo memberinfo = regist.toMemberInfo();

		// 새로운 파일 이름 생성
		// String newFileName = memberInfo.getmId() + System.nanoTime();
		String newFileName = memberinfo.getmId() + "_" + regist.getmPhoto().getOriginalFilename();

		int resultCnt = 0;
		Connection conn = null;

		try {

			conn = ConnectionProvider.getConnection();
			// 파일을 서버의 지정 경로에 저장
			regist.getmPhoto().transferTo(new File(dir, newFileName));

			// 데이터베이스 저장을 하기위한 파일 이름 set(toMemberInfo 메소드에서는 mPhoto를 따로 지정하지 않았다.
			memberinfo.setmPhoto(newFileName);

			resultCnt = dao.insert(conn, memberinfo);

		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return resultCnt;
	}

}
