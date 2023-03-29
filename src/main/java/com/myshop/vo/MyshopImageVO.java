package com.myshop.vo;

import java.util.ArrayList;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class MyshopImageVO {
	int rno;
	String mcategory, mname, mdesc, file1, file2, msfile2, mdate, mid;
	CommonsMultipartFile[] files;
	ArrayList<String> mfiles = new ArrayList<String>();
	ArrayList<String> msfiles = new ArrayList<String>();
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getMcategory() {
		return mcategory;
	}
	public void setMcategory(String mcategory) {
		this.mcategory = mcategory;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMdesc() {
		return mdesc;
	}
	public void setMdesc(String mdesc) {
		this.mdesc = mdesc;
	}
	public String getFile1() {
		return file1;
	}
	public void setFile1(String file1) {
		this.file1 = file1;
	}
	public String getFile2() {
		return file2;
	}
	public void setFile2(String file2) {
		this.file2 = file2;
	}
	public String getMsfile2() {
		return msfile2;
	}
	public void setMsfile2(String msfile2) {
		this.msfile2 = msfile2;
	}
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public CommonsMultipartFile[] getFiles() {
		return files;
	}
	public void setFiles(CommonsMultipartFile[] files) {
		this.files = files;
	}
	public ArrayList<String> getMfiles() {
		return mfiles;
	}
	public void setMfiles(ArrayList<String> mfiles) {
		this.mfiles = mfiles;
	}
	public ArrayList<String> getMsfiles() {
		return msfiles;
	}
	public void setMsfiles(ArrayList<String> msfiles) {
		this.msfiles = msfiles;
	}
	
	
}
