package jdbc;

import java.sql.Date;

public class Sign {
	
	private int idx;
	private String mId;
	private String mPx;
	private String mName;
	private String mPhoto;
	private Date regDate;
	
	public Sign() {

	}

	public Sign(int idx, String mId, String mPx, String mName, String mPhoto, Date regDate) {
		this.idx = idx;
		this.mId = mId;
		this.mPx = mPx;
		this.mName = mName;
		this.mPhoto = mPhoto;
		this.regDate = regDate;
	}

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

	public String getmPx() {
		return mPx;
	}

	public void setmPx(String mPx) {
		this.mPx = mPx;
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

	
	
	

}
