package com.spring.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

public class PageServiceImpl {
	
	@Autowired
	private ProductServiceImpl productService;
	
	@Autowired
	private NoticeServiceImpl noticeService;
	
	@Autowired
	private ReviewServiceImpl reviewService;
	
	public Map<String, Integer> getPageResult(String rpage, String serviceName, Object service) {
		Map<String, Integer> param = new HashMap<String, Integer>();
		
		
		int startCount = 0;
		int endCount = 0;
		int pageSize = 12;	
		int reqPage = 1;	
		int pageCount = 1;	
		int dbCount = 0;
		
		if(serviceName.equals("product")) {
			productService = (ProductServiceImpl)service;
			dbCount = productService.getTotalCount();
		}else if(serviceName.equals("notice")) {
			noticeService = (NoticeServiceImpl)service;
			dbCount = noticeService.getTotalCount();
		}else if(serviceName.equals("review")) {
			reviewService = (ReviewServiceImpl)service;
			dbCount= reviewService.getTotalCount();
		}
		
		
		
		
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = dbCount/pageSize+1;
		}
		
	
		if(rpage != null){
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage-1) * pageSize+1;
			endCount = reqPage *pageSize;
		}else{
			startCount = 1;
			endCount = pageSize;
		}
		

		param.put("startCount", startCount);
		param.put("endCount", endCount);
		param.put("dbCount", dbCount);
		param.put("pageSize", pageSize);
		param.put("rpage", reqPage);
		param.put("pageCount", pageCount);
		
		return param;
		
	}
}
