package com.guafindel.gb.gbook.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guafindel.gb.gbook.dao.GbookSessionDao;
import com.guafindel.gb.gbook.domain.Gbook;
import com.guafindel.gb.gbook.domain.RequestMemberEdit;

@Service("gbookEditService")
public class GbookEditService implements GbookService {

	@Autowired
	private SqlSessionTemplate template;
	
	private GbookSessionDao dao;
	
	public Gbook editForm(int id) {
		
		dao = template.getMapper(GbookSessionDao.class);
		
		Gbook gbook = dao.selectByIdx(id);
		
		return gbook;
	}
	
	public int edit(RequestMemberEdit edit, String oldFileName, HttpServletRequest request) {
	
		dao = template.getMapper(GbookSessionDao.class);
		
		int rCnt = 0;
		
		Gbook gbook = edit.toGbook();
		
		String path = "/uploadfile/userphoto";
		
		String dir = request.getSession().getServletContext().getRealPath(path);
		
		//신규 파일 체크
		if (edit.getgPhoto() != null && !edit.getgPhoto().isEmpty() && edit.getgPhoto().getSize()>0) {
			
			String newFileName = edit.getgId() + "_" + edit.getgPhoto().getOriginalFilename();
			
			try {
				//신규파일 저장
				edit.getgPhoto().transferTo(new File(dir, newFileName));
				//데이터 베이스 저장을 위한 새로운 파일 이름
				gbook.setgPhoto(newFileName);
				//이전 파일 삭제
				new File(dir, oldFileName).delete();
				
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			gbook.setgPhoto(oldFileName);
		}
		
		rCnt = dao.update(gbook);
		
		return rCnt;
	}
}
