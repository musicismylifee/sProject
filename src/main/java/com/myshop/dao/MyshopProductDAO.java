package com.myshop.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myshop.vo.MyshopCategoryVO;
import com.myshop.vo.MyshopProductVO;

@Repository
public class MyshopProductDAO {
	//sqlSession
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	
	//상품수정
		public int update(MyshopProductVO vo) {
			return sqlSession.update("mapper.product.update",vo);
		}
		
		//상품수정 정보가져오기

		/**
		 * select : 상품 정보 조회
		 */
		public MyshopProductVO select(String pid) {
			return sqlSession.selectOne("mapper.product.select",pid);
		}
	
	

	//totalCount 
	public int totalCount() {
		return sqlSession.selectOne("mapper.product.totalcount");
	}
	
	public ArrayList<MyshopProductVO> select(int startCount,int endCount) {
		Map<String, Integer> param = new HashMap<String, Integer>();
		param.put("start", startCount);
		param.put("end", endCount);
		
		List<MyshopProductVO> list = sqlSession.selectList("mapper.product.list", param);
		
		return (ArrayList<MyshopProductVO>)list;
	}
	//상품목록 카테고리별 리스트
		public ArrayList<MyshopProductVO> category_select(int category_parent, int category_id ,int startCount,int endCount) {
			Map<String, String> param = new HashMap<String, String>();
			
			param.put("category_parent", String.valueOf(category_parent));
			param.put("category_id", String.valueOf(category_id));
			param.put("start", String.valueOf(startCount));
			param.put("end", String.valueOf(endCount));
			
			List<MyshopProductVO> list = sqlSession.selectList("mapper.product.category_select", param);
			
			return (ArrayList<MyshopProductVO>)list;
		}
		
		//상품 검색
		public ArrayList<MyshopProductVO> getProductList( String keyword, int startCount, int endCount) {
			Map<String, String> param = new HashMap<String, String>();
			System.out.println(keyword);
			param.put("keyword", keyword);
			param.put("start", String.valueOf(startCount));
			param.put("end", String.valueOf(endCount));
			
			List<MyshopProductVO> list = sqlSession.selectList("mapper.product.getProductList", param);
			
			return (ArrayList<MyshopProductVO>) list;
		}
		
		//관리자 상품목록 삭제리스트 삭제
		public int delectProduct(String pid) {
			System.out.println("삭제 ---> dao");
			return sqlSession.delete("mapper.product.deleteProduct", pid);
		}	
	
	// 관리자 상품등록  처리
	public int insert(MyshopProductVO vo) {
		return sqlSession.insert("mapper.product.insert", vo);
	}
	
	//상품상세목록 조회
	public MyshopProductVO select(int pid) {
		return sqlSession.selectOne("mapper.product.productDetail",pid);
	}
	
	//관리자 상품설정 카테고리리스트
	public List<MyshopCategoryVO> cateList(String dept_level) {
		return sqlSession.selectList("mapper.product.cateList", dept_level);
	}
	
	
	//관리자 상품설정 카테고리리스트
	public List<MyshopCategoryVO> cateListAjax(String cateCode) {
		return sqlSession.selectList("mapper.product.cateListAjax", Integer.parseInt(cateCode));
	}
	
	public List<MyshopCategoryVO> getWcateCode() {
		return sqlSession.selectList("mapper.product.getWcateCode");
	}
	
	public List<MyshopCategoryVO> getMcateCode() {
		return sqlSession.selectList("mapper.product.getMcateCode");
	}
	public List<MyshopCategoryVO> getKcateCode() {
		return sqlSession.selectList("mapper.product.getKcateCode");
	}
	public List<MyshopCategoryVO> getLcateCode() {
		return sqlSession.selectList("mapper.product.getLcateCode");
	}
	
	
}
