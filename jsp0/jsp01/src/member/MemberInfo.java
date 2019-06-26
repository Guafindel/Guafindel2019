package member;

import java.util.Date;

public class MemberInfo {

	private String uId;
	private String uPw;
	private String uName;
	private String uPhoto;
	private Date regDate;

	public MemberInfo() {
		this.regDate = new Date();
	}

	public void setuId(String uId) {
		this.uId = uId;
	}

	public void setuPw(String uPw) {
		this.uPw = uPw;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public void setuPhoto(String uPhoto) {
		this.uPhoto = uPhoto;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getuId() {
		return uId;
	}

	public String getuPw() {
		return uPw;
	}

	public String getuName() {
		return uName;
	}

	public String getuPhoto() {
		return uPhoto;
	}

	public Date getRegDate() {
		return regDate;
	}

	@Override
	public String toString() {
		return "MemberInfo [uId=" + uId + ", uPw=" + uPw + ", uName=" + uName + ", uPhoto=" + uPhoto + ", regDate="
				+ regDate + "]";
	}

	// 화면 결과 출력을 위한 HTML 코드 반환
	public String makeHtmlDiv() {
		String str = "";

		str += "<div class=\"mInfor\"> \n";
		str += "	<h3> \n";
		str += "		" + uId + "(" + uName + ")\n";
		str += "	</h3> \n";
		str += "	<p> \n";
		str += "		" + uPw;
		str += "	</p> \n";
		str += "</div> \n";

		return str;
	}

	// MemberInfo 객체에서 -> LoginInfo로 객체 반환
	public LoginInfo toLoginInfo() {

		return new LoginInfo(uId, uName, uPhoto);
		
	}

}
