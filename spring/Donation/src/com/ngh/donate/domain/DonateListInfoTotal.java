package com.ngh.donate.domain;

import java.util.List;

public class DonateListInfoTotal {
	
	List<DonateListInfo> list;
	int totalPageNumber;
	
	
	
	public DonateListInfoTotal(List<DonateListInfo> list, int totalPageNumber) {
		this.list = list;
		this.totalPageNumber = totalPageNumber;
	}
	public List<DonateListInfo> getList() {
		return list;
	}
	public void setList(List<DonateListInfo> list) {
		this.list = list;
	}
	public int getTotalPageNumber() {
		return totalPageNumber;
	}
	public void setTotalPageNumber(int totalPageNumber) {
		this.totalPageNumber = totalPageNumber;
	}
	
	
	
}
