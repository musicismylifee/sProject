package com.spring.service;

import java.util.ArrayList;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;

import com.myshop.dao.MyshopMemberDAO;
import com.myshop.dao.Naver_Sens_V2;
import com.myshop.vo.MyshopMemberVO;
import com.myshop.vo.SessionVO;


public class MemberServiceImpl implements MemberService{
	@Autowired
	private MyshopMemberDAO memberDao;
	
	/**
	 * 아이디 찾기
	 */
	@Override
	public MyshopMemberVO findId(MyshopMemberVO vo) {
		return memberDao.findId(vo);
	}
	
	/**
	 * 비밀번호 찾기
	 */
	@Override
	public MyshopMemberVO findPass(MyshopMemberVO vo) {
		return memberDao.findPass(vo);
	}
	
	
	/** 
	 * 회원가입 처리
	 */
	public int getJoinResult(MyshopMemberVO vo) {
			
		return 	memberDao.insert(vo);
	}
	
	/** 
	 * 아이디 중복 확인 처리(ajax)
	 */
	public int getIdCheck(String id) {
		return memberDao.idCheck(id);
	}
	
	/** 
	 * 로그인 처리
	 */
	public SessionVO getLoginResult(MyshopMemberVO vo) {
		return memberDao.select(vo);
	}
	
	/** 
	 * 본인인증 처리 난수 발송
	 */
	public String sendRandomMessage(String pnumber){
	    Naver_Sens_V2 message = new Naver_Sens_V2();
	    Random rand = new Random();
	    String numStr = "";
	    for (int i = 0; i < 6; i++) {
	        String ran = Integer.toString(rand.nextInt(10));
	        numStr += ran;
	    }
	    System.out.println("회원가입 문자 인증 => " + numStr);

	    message.send_msg(pnumber, numStr);

	    return numStr;
	}
	
	/** 
	 * 관리자 회원 리스트
	 */
	public ArrayList<MyshopMemberVO> getList(){
		return memberDao.selectAll();
	}
	
	/** 
	 * 관리자 전체 회원 리스트 수
	 */
	public int getTotalCount() {
		return memberDao.totalCount();
	}
	
	/** 
	 * 최근 방문일 최신화
	 */
	public void updateVisit(String id) {
		memberDao.updateVisit(id);
	}
	/** 
	 * 검색리스트 도출
	 */
	public ArrayList<MyshopMemberVO> getSearchList(String searchtext, String sorttype){
		return memberDao.selectSearch(searchtext,sorttype);
	}
	
	/** 
	 * 회원 탈퇴
	 */
	public int getDelete(String id) {
		return memberDao.delete(id);
	}
	
	/** 
	 * 회원 상태보기
	 */
	public MyshopMemberVO getContent(String id) {
		return memberDao.select(id);
	}
	
	public int getUpdate(MyshopMemberVO vo) {
		return memberDao.update(vo);
	}
}
