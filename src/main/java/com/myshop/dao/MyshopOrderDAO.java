package com.myshop.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myshop.vo.MyshopOrderVO;
import com.myshop.vo.MyshopSearchVO;

@Repository
public class MyshopOrderDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace = "mapper.order";
	
	/**
	 * select_info : (test) 리뷰작성에 필요한 정보
	 */
	public MyshopOrderVO select_info(String oid) {
		return sqlSession.selectOne(namespace+".info",oid);
	}
	/**
	 * select: 사용자 주문리스트
	 */
	public ArrayList<MyshopOrderVO> select(String id) {
		Map<String,String> param = new HashMap<String,String>();
		param.put("id",id);
		
		List<MyshopOrderVO> list = sqlSession.selectList(namespace+".select",param);
		return (ArrayList<MyshopOrderVO>)list;
	}
	/**
	 * select_status_count: 주문취소 임시상태변경
	 */
	public ArrayList<MyshopOrderVO> select_status_count(String id) {
		List<MyshopOrderVO> list = sqlSession.selectList(namespace+".status_count",id);
		
		return (ArrayList<MyshopOrderVO>)list;
	}
	
	/**
	 * update_status: 주문 취소 요청시 주문 상태변경
	 */
	public int update_status(int oid) {
		int result =sqlSession.update(namespace+".update_status",oid);
		return result;
	}
	
	public ArrayList<MyshopOrderVO> search_select(MyshopSearchVO vo){
		Map<String,String> param = new HashMap<String,String>();
		/* System.out.println(vo.getSorttype()); */
		param.put("searchtext",vo.getSearchtext());
		param.put("searchtype",vo.getSearchtype());
		param.put("sorttype",vo.getSorttype());
		param.put("id",vo.getId());
		
		List<MyshopOrderVO> list = sqlSession.selectList(namespace+".select",param);
		return (ArrayList<MyshopOrderVO>)list;
	}
	
	

}
