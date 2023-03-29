package com.spring.service;

import com.myshop.vo.MyshopMemberVO;

public interface DiscountPolicy {
	/**
	 * 할인정책 인터페이스
	 */
	int discount(MyshopMemberVO member, int price);
}
