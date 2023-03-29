package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myshop.vo.MyshopMemberVO;
import com.spring.service.MemberServiceImpl;

@Controller
public class MemberController {
	
	@Autowired
	private MemberServiceImpl memberService;
	
	//아이디찾기
	@RequestMapping(value="/find_id.do", method=RequestMethod.GET)
	public String findView() {	
		return "find_id";
	}
	
	//아이디 찾기 실행 
	@RequestMapping(value="find_id", method=RequestMethod.POST)
	public String findIdAction(MyshopMemberVO vo, Model model) {
		MyshopMemberVO member = memberService.findId(vo);
		
		if(member == null) {
			model.addAttribute("check", 1);
		}else {
			model.addAttribute("check", 0);
			model.addAttribute("id", member.getId());
		}
		return "find_id";
	}
	
	//아이디 찾기 실행 성공 페이지 이동 
		@RequestMapping(value="find_id_ok.do", method=RequestMethod.GET)
		public String findIdOK() {
			return "find_id_ok";
		}
	
	//비밀번호 찾기
	@RequestMapping(value="/find_pass.do", method=RequestMethod.GET)
	public String find_pass() {	
		return "find_pass";
	}
	
	//비밀번호 찾기 실행 
	@RequestMapping(value="find_pass_modify.do", method=RequestMethod.POST) 
	public String findPassActiion(MyshopMemberVO vo, Model model)  {
		MyshopMemberVO member = memberService.findPass(vo);
		
		if(member == null) {
			model.addAttribute("check", 1);
		}else {
			model.addAttribute("check", 0);
			model.addAttribute("updateid", member.getId());
		}
		return "find_pass_modify";
	}
	
	//비밃번호 바꾸기할 경우 성공 페이지 이동 
	@RequestMapping(value="find_pass_ok.do", method=RequestMethod.POST)
	public String findPassOK() {
		return "find_pass_ok";
	}
	
	
}
