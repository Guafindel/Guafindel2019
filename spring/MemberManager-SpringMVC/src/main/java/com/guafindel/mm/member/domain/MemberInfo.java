package com.guafindel.mm.member.domain;

import java.util.Date;
import java.util.Random;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class MemberInfo {

	// 접근제어 지시자 private
	private int idx;
	private String mId;
	// @JsonIgnore
	private String mPw;
	private String mName;
	private String mPhoto;
	private Date regDate;

	// 가입시 메일 인증 코드 추가 변수
	private char verify;
	// @JsonIgnore
	private String code;

	// default 생성자는 필수
	public MemberInfo() {
		this.regDate = new Date();
		getRandomString();
	}

	public MemberInfo(String mId, String mPw, String mName, String mPhoto) {
		super();
		this.mId = mId;
		this.mPw = mPw;
		this.mName = mName;
		this.mPhoto = mPhoto;
		this.regDate = new Date();
		getRandomString();
	}

	public MemberInfo(int idx, String mId, String mPw, String mName, String mPhoto, Date regDate) {
		super();
		this.idx = idx;
		this.mId = mId;
		this.mPw = mPw;
		this.mName = mName;
		this.mPhoto = mPhoto;
		this.regDate = regDate;
		getRandomString();
	}

	// Getter/Setter 형성
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

	public String getmPhoto() {
		return mPhoto;
	}

	public void setmPhoto(String mPhoto) {
		this.mPhoto = mPhoto;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public char getVerify() {
		return verify;
	}

	public void setVerify(char verify) {
		this.verify = verify;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	// 확인을 위한 toString 오버라이딩
	@Override
	public String toString() {
		return "MemberInfo [idx=" + idx + ", mId=" + mId + ", mPw=" + mPw + ", mName=" + mName + ", mPhoto=" + mPhoto
				+ ", regDate=" + regDate + ", verify=" + verify + ", code=" + code + "]";
	}

	// 화면 결과 출력을 위한 HTML 코드 반환
	public String makeHtmlDiv() {
		String str = "";

		str += "<div class=\"mInfor\"> \n";
		str += "	<h3> \n";
		str += "		" + mId + "(" + mName + ")\n";
		str += "	</h3> \n";
		str += "	<p> \n";
		str += "		" + mPw;
		str += "	</p> \n";
		str += "</div> \n";

		return str;
	}

	// MemberInfo 객체에서 -> LoginInfo로 객체 반환
	public LoginInfo toLoginInfo() {

		return new LoginInfo(mId, mName, mPhoto, regDate);

	}

	// 비밀번호 체크 확인
	// 2019.07.25 메소드 추가
	public boolean pwChk(String pw) {

		return mPw != null && mPw.trim().length() > 0 && mPw.equals(pw);

	}

	private void getRandomString() {

		Random r = new Random(System.nanoTime());
		StringBuffer sb = new StringBuffer();
		
		for (int i=0; i<20; i++) {
			if(r.nextBoolean()) {
				sb.append(r.nextInt(10));
			} else {
				sb.append((char)(r.nextInt(26)+97));
			}
		}

		System.out.println("난수 코드 생성 : " + sb);
		
		setCode(sb.toString());
	}
}