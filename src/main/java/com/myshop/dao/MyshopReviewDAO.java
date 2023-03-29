package com.myshop.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myshop.vo.MyshopNoticeVO;
import com.myshop.vo.MyshopReviewVO;
import com.myshop.vo.MyshopSearchVO;

@Repository
public class MyshopReviewDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace = "mapper.review";
	
	//리뷰글 쓰기 처리
	public int insert(MyshopReviewVO vo) {
		return sqlSession.insert(namespace+".insert", vo);
	}
	
	//관리자 - 리뷰 리스트
	public ArrayList<MyshopReviewVO> adminselectAll() {
		List<MyshopReviewVO> list = sqlSession.selectList(namespace+".admin_selectAll");
		return (ArrayList<MyshopReviewVO>) list;
	}
	
	//리뷰 개수
	public int totalCount() {
		return sqlSession.selectOne(namespace+".totalcount");
	}
	
	//관리자-상세보기
	public MyshopReviewVO select(String rid) {
		return sqlSession.selectOne(namespace+".content",rid);
	}
	
	//상세보기
	public MyshopReviewVO userSelect(String rid) {
		return sqlSession.selectOne(namespace+".user_content",rid);
	}
	
	
	//사용자 -리뷰 리스트
	public ArrayList<MyshopReviewVO> selectAll(int startCount, int endCount) {
		Map<String,Integer> param = new HashMap<String,Integer>();
		param.put("start", startCount);
		param.put("end", endCount);
		
		List<MyshopReviewVO> list = sqlSession.selectList(namespace+".selectAll",param);
		return (ArrayList<MyshopReviewVO>) list;
	}
	
	//리뷰 수정 처리
	public int update(MyshopReviewVO vo) {
		return sqlSession.update(namespace+".update",vo);
	}
	
	//리뷰 삭제
	public int delete(String rid) {
		return sqlSession.delete(namespace+".delete",rid);
	}
	
	//리뷰 조건 검색
	public ArrayList<MyshopReviewVO> searchreview(MyshopSearchVO vo) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("searchtype", vo.getSearchtype());
		param.put("searchtext", vo.getSearchtext());
		param.put("searchscore", vo.getSearchscore());
		param.put("searchdate", vo.getSearchdate());
		
		List<MyshopReviewVO> list = sqlSession.selectList(namespace+".search_select",param);
		
		System.out.println("list:"+list.size());
		
		for(MyshopReviewVO rvo : list) {
			System.out.print(rvo.getPid()+"\t");
			System.out.print(rvo.getPname()+"\t");
			System.out.print(rvo.getOid()+"\n");
			System.out.println("--------------");
		}
		
		return (ArrayList<MyshopReviewVO>) list;
	}
}
