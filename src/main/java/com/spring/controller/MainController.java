package com.spring.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.service.ProductService;



@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
			
			
	@Autowired 
	ProductService productService;		


	//회원 - 공통 헤더 
	@RequestMapping(value="/header.do", method=RequestMethod.GET)
	public String header(Model model) {
		logger.info("메인페이지 진입");
		model.addAttribute("cate1", productService.getWcateCode());
		model.addAttribute("cate2", productService.getMcateCode());
		model.addAttribute("cate3", productService.getKcateCode());
		model.addAttribute("cate4", productService.getLcateCode());
		return "header";
	}
	
	
	
	/** 메인페이지 **/
	@RequestMapping(value="/myshop.do", method=RequestMethod.GET)
	public String myshop() {	
		return "myshop";
	}
	

	
	
	
	
	//멤버십 혜택 안내 페이지
	@RequestMapping(value="/membership_benefit.do", method=RequestMethod.GET)
	public String membership_benefit() {
		return "membership_benefit";
	}
	
	
	/**
	 * footer.do
	 */
	@RequestMapping(value="/footer.do", method=RequestMethod.GET)
	public String footer() {
		return "footer";
		
	}
	

}
