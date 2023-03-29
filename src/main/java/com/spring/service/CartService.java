package com.spring.service;

import java.util.ArrayList;

import com.myshop.vo.MyshopCartVO;

public interface CartService {

   int cartAddAjax(MyshopCartVO vo);
   
   ArrayList<MyshopCartVO> getCartList(String id);
   
}