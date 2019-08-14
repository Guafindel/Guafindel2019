package com.guafindel.gb.gbook.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guafindel.gb.gbook.dao.GbookSessionDao;
import com.guafindel.gb.gbook.domain.Gbook;
import com.guafindel.gb.gbook.domain.RequestGbookRegist;

@Service("registService")
public class GbookRegistService implements GbookService {

	@Autowired
	private SqlSessionTemplate template;
	
	private GbookSessionDao dao;
	
	public int insert(HttpServletRequest request, RequestGbookRegist regist) {
		
		dao = template.getMapper(GbookSessionDao.class);
		
		//서버 경로
		String path ="/uploadfile/userphoto"; 
		
		//절대 경로
		String dir = request.getSession().getServletContext().getRealPath(path);
		
		System.out.println(dir);
		
		System.out.println(regist+"= 넘어온 객체 regist");
		
		Gbook gbook = regist.toGbook();
		
		
		System.out.println(gbook+"= gbook로 넘긴 객체");
		
		//새로운 파일 이름 생성
		//String newFileName = gbook.getgId()+"_"+regist.getgPhoto().getOriginalFilename();
		String newFileName = gbook.getgId() + "_" + regist.getgPhoto().getOriginalFilename();
		
		System.out.println(newFileName + "= newFileName");
		
		int rCnt = 0;
		
		try {
			//파일을 서버의 지정 경로에 저장
			regist.getgPhoto().transferTo(new File(dir, newFileName));
			//데이터베이스 저장을 하기 위한 파일 이름 set(toGbook 메소드에서는 gPhoto를 따로 지정하지 않았다. 여기서 처리해줄 것이기 때문
			gbook.setgPhoto(newFileName);
			//dao로 데이터 삽입
			rCnt = dao.insert(gbook);
			
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			//회원가입 실패시 폴더에 저장되는 파일을 삭제하기 위한 코드
			new File(dir, newFileName).delete();
		}
		
		return rCnt;
	}
	
	public char idCheck(String gId) {
		
		dao = template.getMapper(GbookSessionDao.class);
		
		char chk = dao.select(gId) == null ? 'Y' : 'N';
		
		return chk;
	}

}
