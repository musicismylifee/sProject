package com.spring.service;

import java.util.ArrayList;

import com.myshop.vo.MyshopMemberVO;
import com.myshop.vo.SessionVO;

public interface MemberService {
	int getJoinResult(MyshopMemberVO vo);
	int getIdCheck(String id);
	SessionVO getLoginResult(MyshopMemberVO vo);
	ArrayList<MyshopMemberVO> getList();
	int getTotalCount();
	void updateVisit(String id);
	ArrayList<MyshopMemberVO> getSearchList(String searchtext, String sorttype);
	int getDelete(String id);
	MyshopMemberVO getContent(String id);
	int getUpdate(MyshopMemberVO vo);
	MyshopMemberVO findId(MyshopMemberVO vo);
	MyshopMemberVO findPass(MyshopMemberVO vo);
}
