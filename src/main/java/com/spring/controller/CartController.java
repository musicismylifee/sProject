package com.spring.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myshop.vo.MyshopCartVO;
import com.myshop.vo.MyshopProductVO;
import com.myshop.vo.SessionVO;
import com.spring.service.CartServiceImpl;

@Controller
public class CartController {

   
   @Autowired
   private CartServiceImpl cartService;
   
     @ResponseBody
     @RequestMapping(value="/cartAddAjax.do", method= RequestMethod.GET, produces="text/plain; charset=UTF-8") 
     public String cartAddAjax(String pid, String amt, HttpSession session) {
    	System.out.println("ccccccccccccccccc");
        SessionVO svo = (SessionVO)session.getAttribute("svo");

        MyshopCartVO vo = new MyshopCartVO();
        vo.setId(svo.getId());
        vo.setPid(Integer.parseInt(pid));
        vo.setAmt(Integer.parseInt(amt));
        
        int result = cartService.cartAddAjax(vo);
        return String.valueOf(result);
     }
     
     
     
      /** product_list 상품 목록 조회 **/
      @RequestMapping(value = "/cart.do", method = RequestMethod.GET)
      public ModelAndView cart_list(String id) {
         ModelAndView mv = new ModelAndView();

         
         ArrayList<MyshopCartVO> list = cartService.getCartList(id);

         mv.addObject("list", list);
   
         mv.setViewName("/cart");
         return mv;
      }

     
}