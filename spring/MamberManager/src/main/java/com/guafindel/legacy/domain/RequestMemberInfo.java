package com.guafindel.legacy.domain;

import org.springframework.web.multipart.MultipartFile;

public class RequestMemberInfo {

	private String mId;
	private String mPw;
	private String mName;
	private MultipartFile mPhoto;

	public RequestMemberInfo() {
	}

	public RequestMemberInfo(String mId, String mPw, String mName, MultipartFile mPhoto) {

		this.mId = mId;
		this.mPw = mPw;
		this.mName = mName;
		this.mPhoto = mPhoto;
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

	@Override
	public String toString() {
		return "RequestMemberInfo [mId=" + mId + ", mPw=" + mPw + ", mName=" + mName + ", mPhoto=" + mPhoto + "]";
	}

	public MemberInfo toMemberInfo() {
		return new MemberInfo(mId, mPw, mName, mPhoto);
	}

}
