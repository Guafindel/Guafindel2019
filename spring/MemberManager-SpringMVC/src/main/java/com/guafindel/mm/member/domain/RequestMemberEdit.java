package com.guafindel.mm.member.domain;

import org.springframework.web.multipart.MultipartFile;

public class RequestMemberEdit {

	private int idx;
	private String mId;
	private String mPw;
	private String mName;
	private MultipartFile mPhoto;
	private String oldFile;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmPw() {
		return mPw;
	}
	public void setmPw(String mPw) {
		this.mPw = mPw;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public MultipartFile getmPhoto() {
		return mPhoto;
	}
	public void setmPhoto(MultipartFile mPhoto) {
		this.mPhoto = mPhoto;
	}
	public String getOldFile() {
		return oldFile;
	}
	public void setOldFile(String oldFile) {
		this.oldFile = oldFile;
	}
	
	public MemberInfo toMemberInfo() {
		
		MemberInfo memberinfo = new MemberInfo();
		
		memberinfo.setIdx(idx);
		memberinfo.setmId(mId);
		memberinfo.setmName(mName);
		memberinfo.setmPw(mPw);
		
		return memberinfo;
	}

}