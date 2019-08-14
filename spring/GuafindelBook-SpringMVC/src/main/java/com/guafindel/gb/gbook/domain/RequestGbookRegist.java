package com.guafindel.gb.gbook.domain;


import org.springframework.web.multipart.MultipartFile;

public class RequestGbookRegist {

	private String gId;
	private String gPw;
	private String gName;
	private MultipartFile gPhoto;
	
	public String getgId() {
		return gId;
	}
	public void setgId(String gId) {
		this.gId = gId;
	}
	public String getgPw() {
		return gPw;
	}
	public void setgPw(String gPw) {
		this.gPw = gPw;
	}
	public String getgName() {
		return gName;
	}
	public void setgName(String gName) {
		this.gName = gName;
	}
	public MultipartFile getgPhoto() {
		return gPhoto;
	}
	public void setgPhoto(MultipartFile gPhoto) {
		this.gPhoto = gPhoto;
	}
	
	//가입받을 때 받았던 빈에서 Gbook빈으로 넘기는 메소드
	public Gbook toGbook() {
		
		Gbook gbook = new Gbook();
		
		gbook.setgId(gId);
		gbook.setgPw(gPw);
		gbook.setgName(gName);
		
		return gbook;
	}
	
}
