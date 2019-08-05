package com.guafindel.legacy.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class LoginInfo {

	private String mId;
	private String mName;
	private MultipartFile mPhoto;
	private Date regDate;
	
	public LoginInfo(String mId, String mName, MultipartFile mPhoto, Date regDate) {
		
		this.mId = mId;
		this.mName = mName;
		this.mPhoto = mPhoto;
		this.regDate = regDate;
	}

	public String getmId() {
		return mId;
	}

	public String getmName() {
		return mName;
	}

	public MultipartFile getmPhoto() {
		return mPhoto;
	}

	public Date getRegDate() {
		return regDate;
	}

	@Override
	public String toString() {
		return "LoginInfo [mId=" + mId + ", mName=" + mName + ", mPhoto=" + mPhoto + ", regDate=" + regDate + "]";
	}
}
