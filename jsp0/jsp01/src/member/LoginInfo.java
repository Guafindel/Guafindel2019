package member;

import java.util.Date;

public class LoginInfo {
	
	private String uId;
	private String uName;
	private String uPhoto;
	private String uPnum;
	private Date regDate;
	
	public LoginInfo(String uId, String uName, String uPhoto, String uPnum, Date regDate) {
		super();
		this.uId = uId;
		this.uName = uName;
		this.uPhoto = uPhoto;
		this.uPnum = uPnum;
		this.regDate = regDate;
	}
	
	public LoginInfo(String uId, String uName, String uPhoto, Date regDate) {
		super();
		this.uId = uId;
		this.uName = uName;
		this.uPhoto = uPhoto;
		this.regDate = regDate;
	}



	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}


	public void setuId(String uId) {
		this.uId = uId;
	}


	public void setuName(String uName) {
		this.uName = uName;
	}


	public void setuPhoto(String uPhoto) {
		this.uPhoto = uPhoto;
	}


	public void setuPnum(String uPnum) {
		this.uPnum = uPnum;
	}





	public String getuPnum() {
		return uPnum;
	}

	
	
	
	public LoginInfo(String uId) {
		this.uId = uId;
	}


	public String getuId() {
		return uId;
	}
	public String getuName() {
		return uName;
	}
	public String getuPhoto() {
		return uPhoto;
	}

	@Override
	public String toString() {
		return "LoginInfo [uId=" + uId + ", uName=" + uName + ", uPhoto=" + uPhoto + ", uPnum=" + uPnum + ", regDate="
				+ regDate + "]";
	}


	
	
	
	
	
	
}