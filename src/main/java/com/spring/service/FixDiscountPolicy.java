package com.spring.service;

import com.myshop.vo.MyshopMemberVO;

public class FixDiscountPolicy implements DiscountPolicy {
	private int fixedDiscount = 1500;//1500¿ø ÇÒÀÎ

	@Override
	public int discount(MyshopMemberVO vo, int price) {
		if(vo.getGrade() == "VIP") {
			return fixedDiscount;
		}else {
			return 0;
		}
	}
}
