package member;

public class WonLogin {
	
	private String uId;
	private String uName;
	private String pNum;
	
	@Override
	public String toString() {
		return "WonLogin [uId=" + uId + ", uName=" + uName + "]";
	}


	public WonLogin(String uId, String uName) {
		this.uId = uId;
		this.uName = uName;
	}
	
	
	public WonLogin(String uId, String uName, String pNum) {
		this.uId = uId;
		this.uName = uName;
		this.pNum = pNum;
	}


	public int getNum() {
		return  6974;
	}

	public String getpNum() {
		return pNum;
	}


	public String getuId() {
		return uId;
	}


	public String getuName() {
		return uName;
	}
	
	
	
}
