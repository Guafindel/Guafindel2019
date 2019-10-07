package com.ngh.donate.domain;

import java.util.Date;

public class SearchParam {
	private String account;
	private String day;
	
	
	public SearchParam(String account, String day) {
		this.account = account;
		this.day = day;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
}
