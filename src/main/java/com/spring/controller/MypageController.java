package com.spring.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.myshop.vo.MyshopNoticeVO;
import com.myshop.vo.MyshopOrderVO;
import com.myshop.vo.MyshopSearchVO;
import com.spring.service.OrderServiceImpl;

@Controller
public class MypageController {
	@Autowired
	private OrderServiceImpl orderService;
	
		//마이페이지 - 주문관리
		@RequestMapping(value="/mypage_order.do", method=RequestMethod.GET)
		public ModelAndView mypage_order(String id) {
			ModelAndView mv = new ModelAndView();
			/* String id = "admin"; */
			System.out.println(id);
			ArrayList<MyshopOrderVO> list = orderService.getList(id);	
			ArrayList<MyshopOrderVO> count = orderService.getCount(id);			
			for(MyshopOrderVO vo: count) {
				mv.addObject("status"+vo.getStatus(),vo.getStatuscount());
				System.out.println(vo.getStatus()+":"+ vo.getStatuscount());
			}
			

			mv.addObject("count",count);
			mv.addObject("list",list);
			mv.setViewName("/mypage_order");
			
			return mv;
		}
		
		//마이페이지 - 주문관리 - 주문 취소요청 시 주문 상태변경
		@ResponseBody
		@RequestMapping(value="/order_cancel_update.do", method=RequestMethod.GET)
		public String order_cancel_update(int oid) {
			int result = orderService.updateStatus(oid);
			
			System.out.println(result);
			return String.valueOf(result);
		}
		
		//마이페이지 - 주문검색 조회
		@ResponseBody
		@RequestMapping(value="/order_search.do", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
		public String order_search(@RequestBody MyshopSearchVO vo) {
			/* System.out.println(vo.getSorttype()); */
			ArrayList<MyshopOrderVO> list = orderService.getSearchList(vo);
			
			JsonObject jobject = new JsonObject(); 
			JsonArray jarray = new JsonArray();  
			Gson gson = new Gson();
			
			for(MyshopOrderVO ovo: list) {
				JsonObject jo = new JsonObject();
				jo.addProperty("status", ovo.getStatus());
				jo.addProperty("odate", ovo.getOdate());
				jo.addProperty("oid", ovo.getOid());
				jo.addProperty("brand", ovo.getBrand());
				jo.addProperty("pname", ovo.getPname());
				jo.addProperty("psfile", ovo.getPsfile());
				jo.addProperty("rid", ovo.getRid());
				jo.addProperty("price", ovo.getPrice());
				jo.addProperty("quantity", ovo.getQuantity());
				
				System.out.println(ovo.getPname());
				
				jarray.add(jo);
			}
			jobject.add("list", jarray);
			jobject.addProperty("count", list.size());
			
			return gson.toJson(jobject);
		}
		
		
		
		
		
}
