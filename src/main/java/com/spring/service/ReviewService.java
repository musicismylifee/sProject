package com.spring.service;

import java.util.ArrayList;

import com.myshop.vo.MyshopOrderVO;
import com.myshop.vo.MyshopReviewVO;
import com.myshop.vo.MyshopSearchVO;

public interface ReviewService {
	int getWriteResult(MyshopReviewVO vo);
	ArrayList<MyshopReviewVO> getList();
	int getTotalCount();
	int getDelete(String rid);
	MyshopReviewVO getContent(String rid);
	ArrayList<MyshopReviewVO> getList(int startCount, int endCount);
	MyshopReviewVO getReviewContent(String rid);
	int getUpdateReview(MyshopReviewVO vo);
	int delete(String rid);
	ArrayList<MyshopReviewVO> getAdminSearchList(MyshopSearchVO vo);
}
