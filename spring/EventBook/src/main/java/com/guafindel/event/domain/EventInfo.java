package com.guafindel.event.domain;

import java.util.Date;

public class EventInfo {
	
	private int e_num;
	private String e_id;
	private String e_content;
	private String e_info;
	private Date regdate;
	
	//default 생성자 작성
	public EventInfo() {
		this.regdate = new Date();
	}
	
	//생성자 작성
	public EventInfo(int e_num, String e_id, String e_content, String e_info, Date regdate) {
		this.e_num = e_num;
		this.e_id = e_id;
		this.e_content = e_content;
		this.e_info = e_info;
		this.regdate = regdate;
	}

	//getter와 setter 작성
	public int getE_num() {
		return e_num;
	}
	public void setE_num(int e_num) {
		this.e_num = e_num;
	}
	public String getE_id() {
		return e_id;
	}
	public void setE_id(String e_id) {
		this.e_id = e_id;
	}
	public String getE_content() {
		return e_content;
	}
	public void setE_content(String e_content) {
		this.e_content = e_content;
	}
	public String getE_info() {
		return e_info;
	}
	public void setE_info(String e_info) {
		this.e_info = e_info;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	//확인용 toString 작성
	@Override
	public String toString() {
		return "EventInfo [e_num=" + e_num + ", e_id=" + e_id + ", e_content=" + e_content + ", e_info=" + e_info
				+ ", regdate=" + regdate + "]";
	}
	
	
	
	
	
	
	
	
	

}
