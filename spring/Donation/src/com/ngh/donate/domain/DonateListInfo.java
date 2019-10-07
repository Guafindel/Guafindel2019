package com.ngh.donate.domain;

public class DonateListInfo {
	
	private int d_index;
	private int d_money;
	private String d_type;
	private String id;
	private String d_account;
	private String d_date;
	

	public DonateListInfo() {
		
	}

	public String getD_date() {
		return d_date;
	}


	public void setD_date(String d_date) {
		this.d_date = d_date;
	}


	public int getD_index() {
		return d_index;
	}


	public void setD_index(int d_index) {
		this.d_index = d_index;
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


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getD_account() {
		return d_account;
	}


	public void setD_account(String d_account) {
		this.d_account = d_account;
	}
	
	
}
