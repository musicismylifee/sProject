package com.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myshop.vo.MyshopMemberVO;
import com.myshop.vo.SessionVO;
import com.spring.service.MemberServiceImpl;

@Controller
public class LoginController {
	@Autowired
	private MemberServiceImpl memberService;	
	
	//로그인 페이지 
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public ModelAndView login(String auth) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("auth", auth);     //interceptor에서 넘어온 auth 받기
		mv.setViewName("login");
		return mv;
	}
		
	//로그인 처리
	@RequestMapping(value="/loginCheck.do", method=RequestMethod.POST)
	public ModelAndView loginCheck(MyshopMemberVO vo, HttpSession session) {
	ModelAndView mv = new ModelAndView();
			
		SessionVO svo= memberService.getLoginResult(vo);
		
		if(svo != null) {
			if(svo.getLoginresult() == 1){
				//로그인 성공 --> session객체에 key(sid),value(로그인계정) 추가 후 index 페이지로 이동
				session.setAttribute("svo", svo);
				//최근 방문일 카운트
				memberService.updateVisit(vo.getId());
				//mv.addObject("login_result","ok");
				
				mv.setViewName("redirect:/myshop.do");
			}
		}else{
			mv.addObject("login_result","fail");
			mv.setViewName("login");
		}
		
		return mv;
	}
	
	
	//로그아웃 처리
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public ModelAndView logout(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		//세션정보를 가져와서 sid 값이 null이 아니면 session.invalidate 메소드 호출
		//String sid = (String)session.getAttribute("sid");
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		
		if(svo != null) {
			session.invalidate();	//세션 정보 삭제
			mv.addObject("logout_result","ok"); //index 페이지에서 logout_result 값을 받아서 ok인 경우 alert 창을 띄움
		}
		
		mv.setViewName("login");
		
		return mv;
		
	}
	
	//본인인증
	@ResponseBody
	@RequestMapping(value="/sendmess.do", method=RequestMethod.GET)
	public String sendmess(String pnumber) {
		
		String code= memberService.sendRandomMessage(pnumber);
		
		
		return code;
	}
		
}
