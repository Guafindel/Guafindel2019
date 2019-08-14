package com.guafindel.mm.member.service;

import java.io.File;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.guafindel.mm.member.dao.MemberJdbcTemplateDao;
import com.guafindel.mm.member.dao.MemberSessionDao;
import com.guafindel.mm.member.domain.MemberInfo;
import com.guafindel.mm.member.domain.RequestMemberEdit;

@Service("editService")
public class MemberEditService implements MemberManagerService {

	//@Autowired
	//private MemberJdbcTemplateDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	private MemberSessionDao dao;

	public MemberInfo getEditForm(int id) {
		
		dao = template.getMapper(MemberSessionDao.class);

		MemberInfo memberinfo = dao.selectMemberByIdx(id);

		return memberinfo;
	}

	public int edit(RequestMemberEdit edit, String oldFileName, HttpServletRequest request) {
		
		dao = template.getMapper(MemberSessionDao.class);

		int rCnt = 0;

		MemberInfo memberinfo = edit.toMemberInfo();

		String path = "/uploadfile/userphoto";
		String dir = request.getSession().getServletContext().getRealPath(path);

		// 신규 파일 체크
		if (edit.getmPhoto() != null && !edit.getmPhoto().isEmpty() && edit.getmPhoto().getSize() > 0) {

			String newFileName = edit.getmId() + "_" + edit.getmPhoto().getOriginalFilename();

			try {
				// 신규파일 저장
				edit.getmPhoto().transferTo(new File(dir, newFileName));
				// 데이터 베이스 저장을 위한 새로운 파일 이름
				memberinfo.setmPhoto(newFileName);
				// 이전 파일 삭제
				new File(dir, oldFileName).delete();

			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			// 신규 파일이 없으면 이전 파일 이름을 그대로 수정 업데이트
			memberinfo.setmPhoto(oldFileName);
		}

		rCnt = dao.memberUpdate(memberinfo);

		return rCnt;
	}

}
