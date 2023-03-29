package com.spring.service;

import java.util.ArrayList;

import com.myshop.vo.MyshopNoticeVO;
import com.myshop.vo.MyshopSearchVO;

public interface NoticeService {
	int getWriteResult(MyshopNoticeVO vo);
	ArrayList<MyshopNoticeVO> getList();
	int getTotalCount();
	int getDelete(String nid);
	MyshopNoticeVO getContent(String nid);
	int getUpdate(MyshopNoticeVO vo);
	ArrayList<MyshopNoticeVO> getList(int startCount, int endCount);
	ArrayList<MyshopNoticeVO> getSearchList(String text, String searchtype, int startCount, int endCount);
	ArrayList<MyshopNoticeVO> getAdminSearchList(MyshopSearchVO vo);
}
