package com.guafindel.mm.member.domain;

import org.springframework.web.multipart.MultipartFile;

public class RequestMemberRegist {

	private String mId;
	private String mPw;
	private String mName;
	private MultipartFile mPhoto;
	
	
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
	
	@Override
	public String toString() {
		return "RequestMemberInfo [mId=" + mId + ", mPw=" + mPw + ", mName=" + mName + ", mPhoto=" + mPhoto + "]";
	}
	
	public MemberInfo toMemberInfo() {
		
		MemberInfo memberinfo = new MemberInfo();
		
		memberinfo.setmId(mId);
		memberinfo.setmName(mName);
		memberinfo.setmPw(mPw);
		
		return memberinfo;
	}
	
	
	

}
