package com.guafindel.demo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@NamedQuery(name="findWithParam", query="from MemberEntity where idx=:fidx or mname like :fname or mid like:fid")
@Table(name = "member")
public class MemberEntity {

	@Id
	@Column
	private long idx;
	@Column(length = 45, nullable = false)
	private String mid;
	@Column(length = 45, nullable = false)
	private String mpw;
	@Column(length = 45, nullable = false)
	private String mname;
	@Column(length = 45, nullable = false)
	private String mphoto;
	
	public long getIdx() {
		return idx;
	}
	public void setIdx(long idx) {
		this.idx = idx;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMphoto() {
		return mphoto;
	}
	public void setMphoto(String mphoto) {
		this.mphoto = mphoto;
	}
	
	@Override
	public String toString() {
		return "MemberEntity [idx=" + idx + ", mid=" + mid + ", mpw=" + mpw + ", mname=" + mname + ", mphoto=" + mphoto
				+ "]";
	}
	
	
	
	
	
	
}
