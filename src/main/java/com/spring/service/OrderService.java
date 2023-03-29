package com.spring.service;

import java.util.ArrayList;

import com.myshop.vo.MyshopOrderVO;
import com.myshop.vo.MyshopSearchVO;

public interface OrderService {
	MyshopOrderVO getInfo(String oid);
	ArrayList<MyshopOrderVO> getList(String id);
	int updateStatus(int oid);
	ArrayList<MyshopOrderVO> getCount(String id);
	ArrayList<MyshopOrderVO> getSearchList(MyshopSearchVO vo);
}
