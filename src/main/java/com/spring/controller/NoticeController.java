package com.spring.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myshop.vo.MyshopNoticeVO;
import com.myshop.vo.MyshopOrderVO;
import com.myshop.vo.MyshopReviewVO;
import com.spring.service.FileServiceImpl;
import com.spring.service.NoticeServiceImpl;
import com.spring.service.OrderServiceImpl;
import com.spring.service.PageServiceImpl;
import com.spring.service.ReviewServiceImpl;
@Controller
public class NoticeController {
	@Autowired
	private FileServiceImpl  fileService;
	
	@Autowired
	private ReviewServiceImpl  reviewService;
	
	@Autowired
	private NoticeServiceImpl  noticeService;
	
	@Autowired
	private PageServiceImpl  pageService;
	
	@Autowired
	private OrderServiceImpl orderService;
	
	//리뷰 작성 페이지-test
	@ResponseBody
	@RequestMapping(value="/review_write.do", method=RequestMethod.GET)
	public MyshopOrderVO review_write(String oid) {
		MyshopOrderVO vo = orderService.getInfo(oid);
		
		return vo;
	}
	//리뷰페이지
	@RequestMapping(value="/review.do", method=RequestMethod.GET)
	public ModelAndView review(String rpage) {
		ModelAndView mv = new ModelAndView();
		
		Map<String, Integer> param = pageService.getPageResult(rpage, "review", reviewService);
		ArrayList<MyshopReviewVO> list = reviewService.getList(param.get("startCount"),param.get("endCount"));
		
		mv.addObject("list",list);
		mv.addObject("dbCount", param.get("dbCount"));
		mv.addObject("rpage", param.get("rpage"));
		mv.addObject("pageSize", param.get("pageSize"));
		mv.setViewName("/review");
		return mv;
	}
	//리뷰 작성 -test
	@RequestMapping(value="/review_write_check.do", method=RequestMethod.POST)
	public ModelAndView review_write_check(MyshopReviewVO vo, HttpServletRequest request) 
												throws Exception{
		ModelAndView mv = new ModelAndView();
		
		System.out.println(vo.getPid());
		System.out.println(vo.getRwriter());
		System.out.println(vo.getScore());
		System.out.println(vo.getRcontent());
		System.out.println("---------------------");
		
		vo = fileService.fileCheck(vo);
		int result = reviewService.getWriteResult(vo);
		
		if(result == 1){			
			fileService.fileSave(vo, request);
			mv.setViewName("redirect:/mypage_order.do?id="+vo.getRwriter());
		}else{

			mv.setViewName("error_page");
		}		
		
		return mv;
	}
	
	//리뷰 수정 페이지
	@ResponseBody
	@RequestMapping(value="/review_update.do", method=RequestMethod.GET)
	public MyshopReviewVO review_update(String rid) {
		MyshopReviewVO vo = reviewService.getReviewContent(rid);

		return vo;
	}
	
	//리뷰 수정 처리
		@RequestMapping(value="/review_update_check.do", method=RequestMethod.POST)
		public ModelAndView review_update_check(MyshopReviewVO vo, HttpServletRequest request) 
													throws Exception{
			ModelAndView mv = new ModelAndView();
			
			System.out.println(vo.getPid());
			System.out.println(vo.getRid());
			System.out.println(vo.getScore());
			System.out.println(vo.getRcontent());
			System.out.println("---------------------");
			
			vo = fileService.fileCheck(vo);
			int result = reviewService.getUpdateReview(vo);
			
			if(result == 1){			
				fileService.fileSave(vo, request);
				mv.setViewName("redirect:/mypage_order.do?id="+vo.getRwriter());
			}else{

				mv.setViewName("error_page");
			}		
			
			return mv;
		}
		
	//리뷰 삭제처리
	@ResponseBody
	@RequestMapping(value="/review_delete_check.do", method=RequestMethod.GET)
	public int review_delete_check(String rid) {	
		int result = reviewService.delete(rid);
		return result;
	}
		
	
	//공지사항 페이지
		@RequestMapping(value="/notice_board.do", method=RequestMethod.GET)
		public ModelAndView notice_board(String rpage) {
			ModelAndView mv = new ModelAndView();
			
			Map<String, Integer> param = pageService.getPageResult(rpage, "notice", noticeService);
			ArrayList<MyshopNoticeVO> list = noticeService.getList(param.get("startCount"),param.get("endCount"));
			
			mv.addObject("list",list);
			mv.addObject("dbCount", param.get("dbCount"));
			mv.addObject("rpage", param.get("rpage"));
			mv.addObject("pageSize", param.get("pageSize"));
			mv.setViewName("notice_board");
			return mv;
		}
		
	
		@RequestMapping(value="/notice_search_check.do" , method=RequestMethod.GET)
		   public String notice_search_check(String text, String searchtype, String rpage, Model model)  {
		      
			  Map<String, Integer> param = pageService.getPageResult(rpage, "notice", noticeService);
		      ArrayList<MyshopNoticeVO> list=noticeService.getSearchList(text,searchtype,param.get("startCount"), param.get("endCount"));
		      
		      if(!list.isEmpty()) {
		         model.addAttribute("list", list);
		      }else {
		         model.addAttribute("listcheck", "empty");
		         
		         return "search";
		      }
		      return "/notice_board";
		   }
}
