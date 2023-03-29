package com.myshop.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myshop.vo.MyshopMemberVO;
import com.myshop.vo.SessionVO;
@Repository
public class MyshopMemberDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 아이디 찾기
	 */
	public MyshopMemberVO findId(MyshopMemberVO vo) {
		System.out.print("dao == >  findId()기능처리");
		return sqlSession.selectOne("mapper.member.findId", vo);
	}
	/**
	 * 비밀번호 찾기
	 */
	public MyshopMemberVO findPass(MyshopMemberVO vo) {
		System.out.print("dao == >  findPass()기능처리");
		return sqlSession.selectOne("mapper.member.findPass", vo);
	}
	
	
	
	
	/**
	 * insert : 회원가입 
	 */
	public int insert(MyshopMemberVO vo) {
		//sqlSession 객체의 메소드를 호출하여 실행결과를 가져옴
		
		return sqlSession.insert("mapper.member.join", vo);
	}
	
	/**
	 * idCheck : 아이디 중복체크
	 */
	public int idCheck(String id) {
		return sqlSession.selectOne("mapper.member.idcheck",id);
	}
	
	/**
	 * select : 로그인 처리
	 */
	public SessionVO select(MyshopMemberVO vo) {
		return sqlSession.selectOne("mapper.member.login", vo);
	}
	
	/**
	 * select : 로그인 처리
	 */
	public ArrayList<MyshopMemberVO> selectAll(){
		List<MyshopMemberVO> list = sqlSession.selectList("mapper.member.select_all");
		return (ArrayList<MyshopMemberVO>)list;
	}
	
	/**
	 * totalCount : 전체 회원 리스트 수 
	 */
	public int totalCount(){
		return sqlSession.selectOne("mapper.member.total_count");
	}
	
	/**
	 * updateVisit : 방문일 업데이트 
	 */
	public int updateVisit(String id) {
		return sqlSession.update("mapper.member.update_visit",id);
	}
	
	/**
	 *  selectSearch : 검색 리스트
	 */
	public ArrayList<MyshopMemberVO> selectSearch(String searchtext, String sorttype){
		System.out.println("searchtext"+searchtext); 
		System.out.println("sorttype"+sorttype); 
		Map<String,String> param = new HashMap<String,String>();
		param.put("searchtext",searchtext);
		param.put("sorttype",sorttype);
		List<MyshopMemberVO> search_list =sqlSession.selectList("mapper.member.select_search", param);
		return (ArrayList<MyshopMemberVO>)search_list;
	}
	
	/**
	 *  delete : 회원탈퇴
	 */
	public int delete(String id) {
		System.out.println(id);
		return sqlSession.delete("mapper.member.delete",id);
	}
	
	
	/** 
	 * select : 회원상세보기
	 */
	public MyshopMemberVO select(String id) {
		return sqlSession.selectOne("mapper.member.select",id);
	}
	
	public int update(MyshopMemberVO vo) {
		return sqlSession.update("mapper.member.admin_update",vo);
	}
}
