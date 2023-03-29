package com.spring.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.myshop.dao.MyshopNoticeDAO;
import com.myshop.vo.MyshopNoticeVO;
import com.myshop.vo.MyshopSearchVO;

public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private MyshopNoticeDAO noticeDao;
	
	//공지사항 쓰기
	public int getWriteResult(MyshopNoticeVO vo) {
		return noticeDao.insert(vo);
	}
	
	//admin - 전체 공지사항 리스트
	public ArrayList<MyshopNoticeVO> getList(){
		return noticeDao.selectAll();
	}
	
	//admin - 조건 검색 리스트
	public ArrayList<MyshopNoticeVO>getAdminSearchList(MyshopSearchVO vo){
		return noticeDao.search_select(vo);
	}
	
	//전체 공지사항 개수
	public int getTotalCount() {
		return noticeDao.totalCount();
	}
	
	//공지사항 삭제
	public int getDelete(String nid) {
		return noticeDao.delete(nid);
	}
	
	//공지사항 정보 가져오기
	public MyshopNoticeVO getContent(String nid) {
		return noticeDao.select(nid);
	}
	
	//공지사항 정보 가져오기
	public int getUpdate(MyshopNoticeVO vo) {
		return noticeDao.update(vo);
	}
	
	//사용자 - 전체 공지사항 리스트
	public ArrayList<MyshopNoticeVO> getList(int startCount, int endCount){
		return noticeDao.user_selectAll(startCount,endCount);
	}
	
	//사용자 - 검색 공지사항 리스트
	public ArrayList<MyshopNoticeVO> getSearchList(String text, String searchtype, int startCount, int endCount){
		return noticeDao.search_select(text, searchtype, startCount,endCount);
	}
	
	
}
