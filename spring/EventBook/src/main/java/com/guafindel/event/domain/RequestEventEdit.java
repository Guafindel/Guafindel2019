package com.guafindel.event.domain;

public class RequestEventEdit {

	private int e_num;
	private String e_id;
	private String e_content;
	private String e_info;
	
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
	
	public EventInfo toEventInfo() {
		
		EventInfo eventInfo = new EventInfo();
		
		eventInfo.setE_num(e_num);
		eventInfo.setE_id(e_id);
		eventInfo.setE_content(e_content);
		eventInfo.setE_info(e_info);
		
		return eventInfo;
	}
	
	
}
