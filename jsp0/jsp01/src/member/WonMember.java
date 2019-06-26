package member;

public class WonMember {

	private String uId;
	private String uPw;
	private String uName;
	private String uBirth;
	private int uGender;
	private int uAge;
	private String uEmail;
	private String uPnum;
	
	public WonMember() {

	}

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}

	public String getuPw() {
		return uPw;
	}

	public void setuPw(String uPw) {
		this.uPw = uPw;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public String getuBirth() {
		return uBirth;
	}

	public void setuBirth(String uBirth) {
		this.uBirth = uBirth;
	}

	public int getuGender() {
		return uGender;
	}

	public void setuGender(int uGender) {
		this.uGender = uGender;
	}

	public int getuAge() {
		return uAge;
	}

	public void setuAge(int uAge) {
		this.uAge = uAge;
	}

	public String getuEmail() {
		return uEmail;
	}

	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}

	public String getuPnum() {
		return uPnum;
	}

	public void setuPnum(String uPnum) {
		this.uPnum = uPnum;
	}

	public WonMember(String uId, String uPw, String uName, String uBirth, int uGender, int uAge, String uEmail,
			String uPnum) {
		super();
		this.uId = uId;
		this.uPw = uPw;
		this.uName = uName;
		this.uBirth = uBirth;
		this.uGender = uGender;
		this.uAge = uAge;
		this.uEmail = uEmail;
		this.uPnum = uPnum;
	}

	@Override
	public String toString() {
		return "WonMember [uId=" + uId + ", uPw=" + uPw + ", uName=" + uName + ", uBirth=" + uBirth + ", uGender="
				+ uGender + ", uAge=" + uAge + ", uEmail=" + uEmail + ", uPnum=" + uPnum + "]";
	}
	
	


}
