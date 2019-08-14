package com.guafindel.gb.gbook.domain;

import java.sql.Date;

public class Gbook {

	private int idx;
	private String gId;
	private String gPw;
	private String gName;
	private String gPhoto;
	private Date regdate;
	
	//디폴트 생성자
	public Gbook() {
	
	}
	
	//생성자 작성
	public Gbook(int idx, String gId, String gPw, String gName, String gPhoto, Date regdate) {
		super();
		this.idx = idx;
		this.gId = gId;
		this.gPw = gPw;
		this.gName = gName;
		this.gPhoto = gPhoto;
		this.regdate = regdate;
	}

	//게터, 세터 작성
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

	public String getgPhoto() {
		return gPhoto;
	}

	public void setgPhoto(String gPhoto) {
		this.gPhoto = gPhoto;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	//확인을 위한 toString
	@Override
	public String toString() {
		return "Gbook [idx=" + idx + ", gId=" + gId + ", gPw=" + gPw + ", gName=" + gName + ", gPhoto=" + gPhoto
				+ ", regdate=" + regdate + "]";
	}
	
	
	
	
	
}
