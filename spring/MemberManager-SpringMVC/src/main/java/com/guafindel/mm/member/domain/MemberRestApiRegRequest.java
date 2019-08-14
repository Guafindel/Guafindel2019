package com.guafindel.mm.member.domain;

public class MemberRestApiRegRequest {
	
	private String mId;
	private String mPw;
	private String mName;
	
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

	@Override
	public String toString() {
		return "MemberRestApiRegRequest [mId=" + mId + ", mPw=" + mPw + ", mName=" + mName + "]";
	}
	
	public MemberInfo toMemberInfo() {
		
		MemberInfo member = new MemberInfo();
		
		member.setmId(mId);
		member.setmPw(mPw);
		member.setmName(mName);
		
		return member;
	}

}
