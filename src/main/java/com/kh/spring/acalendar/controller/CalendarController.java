package com.kh.spring.acalendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CalendarController {
	
	@RequestMapping("/calendar.ca")
	public String toCalendar() { //캘린더 조회페이지
		
		return "aCalendar/calendar";
	}
	
	@RequestMapping("/upload.ca")
	public String uploadCalnendar() { //캘린더 업로드 페이지
		
		return "aCalendar/uploadCalendar";
	}

}
