package com.myshop.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myshop.vo.MyshopCartVO;
import com.myshop.vo.MyshopProductVO;

@Repository
public class MyshopCartDAO {

   @Autowired
   private SqlSessionTemplate sqlSession;
   
   
   /**
    * insert : 장바구니 추가
    */
   public int insert(MyshopCartVO vo) {
      //sqlSession 객체의 메소드를 호출하여 실행결과를 가져옴
      System.out.println("..vo");
      return sqlSession.insert("mapper.cart.add", vo);
   }


   public ArrayList<MyshopCartVO> select(String id) {
   
      
      List<MyshopCartVO> list = sqlSession.selectList("mapper.cart.list", id);
      
      return (ArrayList<MyshopCartVO>)list;
   }
}