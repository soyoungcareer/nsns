package com.kh.spring.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.common.Pagination;
import com.kh.spring.notice.model.service.NoticeService;
import com.kh.spring.notice.model.vo.Notice;
import com.kh.spring.notice.model.vo.PageInfo;

@Controller
public class NoticeController2 {
	
	@Autowired
	private NoticeService noticeService;
	/*//
	@RequestMapping("list.ntc")
	public String noticeTest() {
		return "admin/noticeListView";
	}*/
	
	@RequestMapping("list.ntc")
	public String selectList(@RequestParam(value="currentPage", required = false, defaultValue="1") int currentPage , Model model) {
		
		int listCount = noticeService.selectNListCount();
		System.out.println(listCount);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Notice> list = noticeService.selectNList(pi);
		System.out.println("list : " + list);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "admin/noticeListView";
	}

}
