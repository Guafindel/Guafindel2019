package com.guafindel.gb.gbook.domain;

import java.util.List;

public class ListViewData {
	
	private List<Gbook> gbookList;
	private int totalCount;
	private int no;
	private int currentPageNumber;
	private int pageTotalCount;
	
	public List<Gbook> getGbookList() {
		return gbookList;
	}
	public void setGbookList(List<Gbook> gbookList) {
		this.gbookList = gbookList;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getCurrentPageNumber() {
		return currentPageNumber;
	}
	public void setCurrentPageNumber(int currentPageNumber) {
		this.currentPageNumber = currentPageNumber;
	}
	public int getPageTotalCount() {
		return pageTotalCount;
	}
	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}
	
	

}
