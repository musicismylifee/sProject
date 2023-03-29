package com.spring.service;

import java.util.ArrayList;
import java.util.List;

import com.myshop.vo.MyshopCategoryVO;
import com.myshop.vo.MyshopNoticeVO;
import com.myshop.vo.MyshopProductVO;

public interface ProductService {
	/**
	 * 페이징처리
	 */
	int getTotalCount();
	/** 
	 * 관리자 상품리스트
	 */
	ArrayList<MyshopProductVO> getList(int startCount, int endCount);
	/**
	 * 관리자 상품 수정 
	 */
	int updateProduct(MyshopProductVO vo);
	/**
	 * 관리자 상품수정 정보가져오기
	 */
	MyshopProductVO getContent(String pid);	
	/**
	 * 관리자 상품목록 리스트 삭제
	 */
	int deleteProduct(String pid);
	/** 카테고리별 상품목록 **/
	ArrayList<MyshopProductVO> category_select( int category_parent,int category_id , int startCount, int endCount);
	/** 상품검색 **/
	List<MyshopProductVO> getProductList(String keyword, int startCount, int endCount);
	/** 관리자 상품추가 **/
	int getWriteResult(MyshopProductVO vo);
	/** 상품 상세보기 **/
	MyshopProductVO getDetail(int pid);
	//카테고리 리스트
	List<MyshopCategoryVO> cateList(String dept_level);
	List<MyshopCategoryVO> cateListAjax(String cateCode);
	//여성 카테고리 리스트 드롭다운
	List<MyshopCategoryVO> getWcateCode();
	//남성 카테고리 리스트 드롭다운
	List<MyshopCategoryVO> getMcateCode();
	//키즈 카테고리 리스트 드롭다운
	List<MyshopCategoryVO> getKcateCode();
	//라이프 카테고리 리스트 드롭다운
	List<MyshopCategoryVO> getLcateCode();
}
