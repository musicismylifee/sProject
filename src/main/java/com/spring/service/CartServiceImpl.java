package com.spring.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myshop.dao.MyshopCartDAO;
import com.myshop.vo.MyshopCartVO;
import com.myshop.vo.MyshopProductVO;

@Service
public class CartServiceImpl implements CartService{
   
   @Autowired
   private MyshopCartDAO cartDao;
   
   public int cartAddAjax(MyshopCartVO vo) {
	   System.out.println("Service");
      return cartDao.insert(vo);
   }

   @Override
   public ArrayList<MyshopCartVO> getCartList(String id) {
      ArrayList<MyshopCartVO> list = cartDao.select(id);
      return list;
   }
   
   
}
   