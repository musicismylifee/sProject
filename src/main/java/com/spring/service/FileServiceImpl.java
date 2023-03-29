package com.spring.service;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import com.myshop.vo.MyshopNoticeVO;
import com.myshop.vo.MyshopProductVO;
import com.myshop.vo.MyshopReviewVO;

public class FileServiceImpl {
	
	public void fileSave(MyshopProductVO vo, HttpServletRequest request) throws Exception {
		//파일이름
	if(!vo.getFile1().getOriginalFilename().equals("")) {
		String path = request.getSession().getServletContext().getRealPath("/");
		path += "\\resources\\upload\\";
		//파일위치, 파일이름을 합친 객체 
		File file = new File(path+vo.getPsfile());
		//파일저장
		vo.getFile1().transferTo(file);
		}
	}
	
	/**
	 * 공지사항 : 파일 upload 폴더에 저장
	 */
	public void fileSave(MyshopNoticeVO vo, HttpServletRequest request) throws Exception {
		//2. upload 폴더에 nsfile 명으로 실제 파일 업로드 처리
		if(!vo.getFile1().getOriginalFilename().equals("")) {
			String path = request.getSession().getServletContext().getRealPath("/");
			path += "\\resources\\upload\\";
			
			File file = new File(path+vo.getNsfile());
			vo.getFile1().transferTo(file);
		}
	}
	
	/**
	 * 공지사항 : 파일 체크 후 nfile, nsfile 생성
	 */
	public MyshopNoticeVO fileCheck(MyshopNoticeVO vo) {
		//1. vo객체의 파일체크 후 nfile, nsfile에 저장되는 이름 생성
		if(vo.getFile1().getOriginalFilename().equals("")) {
			vo.setNfile("");
			vo.setNsfile("");
		}else {
			UUID uuid = UUID.randomUUID();
			vo.setNfile(vo.getFile1().getOriginalFilename());
			vo.setNsfile(uuid + "_" + vo.getFile1().getOriginalFilename());
		}
		
		return  vo;
	}//fileCheck
	
	
	/**
	 * 공지사항 : 새로운 파일이 있는 경우 update시 파일체크
	 */
	public MyshopNoticeVO update_fileCheck(MyshopNoticeVO vo) {
		if(vo.getFile1() != null) {	//새로운 파일객체가 있는지 여부체크 하는 경우에는 null을 사용
			if(!vo.getFile1().getOriginalFilename().equals("")) { //새로운 파일선택 O
				
				UUID uuid = UUID.randomUUID();
				
				vo.setNfile(vo.getFile1().getOriginalFilename());
				vo.setNsfile(uuid+"_"+vo.getFile1().getOriginalFilename());
			}
		}
		return vo;
	}
	
	/**
	 * 게시판 : 파일이 있는 경우 update시 파일저장
	 */
	public void update_filesave(MyshopNoticeVO vo, HttpServletRequest request, String old_filename) 
														throws Exception {
		//새로운 파일을 upload 폴더에 저장
		if(!vo.getFile1().getOriginalFilename().equals("")) { //새로운 파일선택 O
			String path = request.getSession().getServletContext().getRealPath("/");
			path += "\\resources\\upload\\";
			System.out.println(path);
			
			File file = new File(path+vo.getNsfile());
			vo.getFile1().transferTo(file);
		
			//기존파일이 있는 경우에는 파일 삭제
			File ofile = new File(path+old_filename);
			if(ofile.exists()) {
				ofile.delete();
			}
		}
	}
	
	
	/**
	 * 리뷰 : 파일 체크 후 rfile, rsfile 생성
	 */
	public MyshopReviewVO fileCheck(MyshopReviewVO vo) {
		//1. vo객체의 파일체크 후 nfile, nsfile에 저장되는 이름 생성
		if(vo.getFile1().getOriginalFilename().equals("")) {
			vo.setRfile("");
			vo.setRsfile("");
		}else {
			UUID uuid = UUID.randomUUID();
			vo.setRfile(vo.getFile1().getOriginalFilename());
			vo.setRsfile(uuid + "_" + vo.getFile1().getOriginalFilename());
		}
		
		return  vo;
	}//fileCheck
	
	
	/**
	 * 리뷰 : 파일 upload 폴더에 저장
	 */
	public void fileSave(MyshopReviewVO vo, HttpServletRequest request) throws Exception {
		//2. upload 폴더에 nsfile 명으로 실제 파일 업로드 처리
		if(!vo.getFile1().getOriginalFilename().equals("")) {
			String path = request.getSession().getServletContext().getRealPath("/");
			path += "\\resources\\upload\\";
			
			File file = new File(path+vo.getRsfile());
			vo.getFile1().transferTo(file);
		}
	}
	
	/**
	 * 상품 : 새로운 파일이 있는 경우 update시 파일체크
	 */
	public MyshopProductVO update_fileCheck(MyshopProductVO vo) {
		if(vo.getFile1() != null) {	//새로운 파일객체가 있는지 여부체크 하는 경우에는 null을 사용
			if(!vo.getFile1().getOriginalFilename().equals("")) { //새로운 파일선택 O
				
				UUID uuid = UUID.randomUUID();
				
				vo.setPfile(vo.getFile1().getOriginalFilename());
				vo.setPsfile(uuid+"_"+vo.getFile1().getOriginalFilename());
			}
		}
		return vo;
	}
	
	
	/**
	 * 상품 : 파일이 있는 경우 update시 파일저장
	 */
	public void update_filesave(MyshopProductVO vo, HttpServletRequest request, String old_filename) 
														throws Exception {
		//새로운 파일을 upload 폴더에 저장
		if(!vo.getFile1().getOriginalFilename().equals("")) { //새로운 파일선택 O
			String path = request.getSession().getServletContext().getRealPath("/");
			path += "\\resources\\upload\\";
			System.out.println(path);
			
			File file = new File(path+vo.getPsfile());
			vo.getFile1().transferTo(file);
		
			//기존파일이 있는 경우에는 파일 삭제
			File ofile = new File(path+old_filename);
			if(ofile.exists()) {
				ofile.delete();
			}
		}
	}
}
