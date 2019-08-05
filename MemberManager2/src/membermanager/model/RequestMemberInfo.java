package membermanager.model;

public class RequestMemberInfo {
	
	private String mId;
	private String mPw;
	private String mName;
	private String mPhoto;
	
	public RequestMemberInfo() {}

	public RequestMemberInfo(String mId, String mPw, String mName, String mPhoto) {
		
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

	public String getmPhoto() {
		return mPhoto;
	}

	public void setmPhoto(String mPhoto) {
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
