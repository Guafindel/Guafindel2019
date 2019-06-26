package member;

public class WonLogin {
	
	private String uId;
	private String uName;
	
	
	@Override
	public String toString() {
		return "WonLogin [uId=" + uId + ", uName=" + uName + "]";
	}


	public WonLogin(String uId, String uName) {
		super();
		this.uId = uId;
		this.uName = uName;
	}


	public String getuId() {
		return uId;
	}


	public String getuName() {
		return uName;
	}
	
	
	
}
