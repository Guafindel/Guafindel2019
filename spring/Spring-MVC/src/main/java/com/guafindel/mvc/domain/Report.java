package com.guafindel.mvc.domain;

import org.springframework.web.multipart.MultipartFile;

public class Report {

	private String sno;
	private MultipartFile report;
	
	
	public String getSno() {
		return sno;
	}


	public void setSno(String sno) {
		this.sno = sno;
	}


	public MultipartFile getReport() {
		return report;
	}


	public void setReport(MultipartFile report) {
		this.report = report;
	}
	
	
	//el에서 부르는 것은 메소드이므로 fileSize이다.
	public long getFileSize() {
		return report.getSize();
	}
	
	public String getFileName() {
		return report.getOriginalFilename();
	}
	
	
	
}
