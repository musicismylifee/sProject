package com.myshop.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class MyshopNoticeVO {
	int rno;
	String nid, ntitle, ncontent, nfile, nsfile, ncrucial, nsdate, nedate,ncode;
	CommonsMultipartFile file1;
	public String getNcode() {
		return ncode;
	}
	public void setNcode(String ncode) {
		this.ncode = ncode;
	}
	
	public CommonsMultipartFile getFile1() {
		return file1;
	}
	public void setFile1(CommonsMultipartFile file1) {
		this.file1 = file1;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getNid() {
		return nid;
	}
	public void setNid(String nid) {
		this.nid = nid;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public String getNcontent() {
		return ncontent;
	}
	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}
	public String getNfile() {
		return nfile;
	}
	public void setNfile(String nfile) {
		this.nfile = nfile;
	}
	public String getNsfile() {
		return nsfile;
	}
	public void setNsfile(String nsfile) {
		this.nsfile = nsfile;
	}
	public String getNcrucial() {
		return ncrucial;
	}
	public void setNcrucial(String ncrucial) {
		this.ncrucial = ncrucial;
	}
	public String getNsdate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(nsdate==null) {
			Date now = new Date();
			nsdate = sdf.format(now);
			return nsdate;
		}else {
			return nsdate;
		}
		
	}
	public void setNsdate(String nsdate) {
		this.nsdate = nsdate;
	}
	public String getNedate() {
		if(nedate==null) {
			nedate="9999-12-31";
			return nedate;
		}else {
			return nedate;	
		}
	}
	public void setNedate(String nedate) {
		
		this.nedate = nedate;
	}
	
}
