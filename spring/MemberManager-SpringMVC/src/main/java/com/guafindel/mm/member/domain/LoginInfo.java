package com.guafindel.mm.member.domain;

import java.util.Date;

public class LoginInfo {

	private String mId;
	private String mName;
	private String mPhoto;
	private Date regDate;
	
	public LoginInfo(String mId, String mName, String mPhoto, Date regDate) {
		
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

	public String getmPhoto() {
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