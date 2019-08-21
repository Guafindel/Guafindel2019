package com.guafindel.gb.gbook.domain;

import org.springframework.web.multipart.MultipartFile;

public class RequestMemberEdit {

	private int idx;
	private String gId;
	private String gPw;
	private String gName;
	private MultipartFile gPhoto;
	private String oldFile;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
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
	public String getOldFile() {
		return oldFile;
	}
	public void setOldFile(String oldFile) {
		this.oldFile = oldFile;
	}
	
	public Gbook toGbook() {
		
		Gbook gbook = new Gbook();
		
		gbook.setIdx(idx);
		gbook.setgId(gId);
		gbook.setgName(gName);
		gbook.setgPw(gPw);
		
		return gbook;
	}
	
	
}
