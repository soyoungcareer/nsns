package com.kh.spring.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {
	
	@RequestMapping("list.ntc")
	public String noticeTest() {
		return "admin/noticeListView";
	}

}
