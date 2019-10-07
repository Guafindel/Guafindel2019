package com.ngh.donate.domain;

public class DonateInfo {
	private int d_money;
	private String d_type;
	private String d_account;
	private String id;
	public DonateInfo() {
		
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	
	public int getD_money() {
		return d_money;
	}
	public void setD_money(int d_money) {
		this.d_money = d_money;
	}
	public String getD_type() {
		return d_type;
	}
	public void setD_type(String d_type) {
		this.d_type = d_type;
	}
	public String getD_account() {
		return d_account;
	}
	public void setD_account(String d_account) {
		this.d_account = d_account;
	}
	
	
}
