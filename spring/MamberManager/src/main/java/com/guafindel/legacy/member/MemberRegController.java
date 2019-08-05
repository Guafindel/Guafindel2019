package com.guafindel.legacy.member;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.guafindel.legacy.domain.MemberInfo;

@Controller
public class MemberRegController {

	String path = "/uploadfile";

	@RequestMapping(value = "index")
	public String mainPage() {
		return "index";
	}

	@RequestMapping(value = "member/memberRegForm")
	public String memberRegForm() {

		return "member/memberRegForm";
	}

	@RequestMapping(value = "/legacy/member/memberReg", method = RequestMethod.POST)
	public String memberReg(@RequestParam(value = "mId") String mId, @RequestParam(value = "mPw") String mPw,
			@RequestParam(value = "mName") String mName, @RequestParam(value = "mPhoto") MultipartFile file,
			Model model, HttpServletRequest request) {

		model.addAttribute("mId", mId);
		model.addAttribute("mPw", mPw);
		model.addAttribute("mName", mName);
		model.addAttribute("fileName", file.getOriginalFilename());
		model.addAttribute("fileSize", file.getSize());
		try {
			model.addAttribute("file", file.getInputStream());
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		// 파일 저장
		String dir = request.getSession().getServletContext().getRealPath(path);
		System.out.println(dir);

		try {
			if (!file.isEmpty() && file.getSize() > 0) {
				file.transferTo(new File(dir, file.getOriginalFilename()));
			}
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "member/memberReg";
	}

}
