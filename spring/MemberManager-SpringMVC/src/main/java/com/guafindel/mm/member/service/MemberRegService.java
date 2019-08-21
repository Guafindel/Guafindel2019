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
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guafindel.mm.jdbc.ConnectionProvider;
import com.guafindel.mm.member.dao.MemberInfoDao;
import com.guafindel.mm.member.dao.MemberJdbcTemplateDao;
import com.guafindel.mm.member.dao.MemberSessionDao;
import com.guafindel.mm.member.domain.MemberInfo;
import com.guafindel.mm.member.domain.RequestMemberRegist;

@Service(value = "registService") // memberRegService
public class MemberRegService implements MemberManagerService {

	// @Autowired
	// private MemberInfoDao dao;

	// @Autowired
	// private MemberJdbcTemplateDao dao;

	@Autowired
	private SqlSessionTemplate template;

	private MemberSessionDao dao;
	
	@Autowired
	private MailSenderService mailService;

	public int memberInsert(HttpServletRequest request, RequestMemberRegist regist) {

		dao = template.getMapper(MemberSessionDao.class);

		// 서버 경로
		String path = "/uploadfile/userphoto"; // 리소스 맵핑 필요
		// 절대 경로
		String dir = request.getSession().getServletContext().getRealPath(path); // 실제 저장 경로

		MemberInfo memberinfo = regist.toMemberInfo();


		int resultCnt = 0;
		
		String newFileName = "";

		try {
			if (regist.getmPhoto() != null) {
				// 새로운 파일 이름 생성
				// String newFileName = memberInfo.getmId() + System.nanoTime();
				newFileName = memberinfo.getmId() + "_" + regist.getmPhoto().getOriginalFilename();
				// 파일을 서버의 지정 경로에 저장
				regist.getmPhoto().transferTo(new File(dir, newFileName));
				// 데이터베이스 저장을 하기위한 파일 이름 set(toMemberInfo 메소드에서는 mPhoto를 따로 지정하지 않았다.
				memberinfo.setmPhoto(newFileName);
			}
			
			resultCnt = dao.insert(memberinfo);
			
			mailService.send(memberinfo.getmId(), memberinfo.getCode());

		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("오류");
			if (regist.getmPhoto() != null) {
				new File(dir, newFileName).delete();
			}
		}

		System.out.println(resultCnt);

		return resultCnt;
	}

	public char idCheck(String id) {

		dao = template.getMapper(MemberSessionDao.class);

		char chk = dao.selectMemberById(id)== null ? 'Y' : 'N';

		return chk;

	}

	public String idCheck1(String id) {

		dao = template.getMapper(MemberSessionDao.class);

		String chk = dao.selectMemberById(id) == null ? "Y" : "N";

		return chk;

	}

}
