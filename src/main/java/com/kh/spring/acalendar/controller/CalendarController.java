package com.kh.spring.acalendar.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.GsonBuilder;
import com.kh.spring.acalendar.model.vo.Acalendar;

@Controller
public class CalendarController {
	
	@RequestMapping("/calendar.ca")
	public String toCalendar(Model model) throws ParseException { //캘린더 조회페이지
		
		return "aCalendar/calendar";
	}
	
	@ResponseBody
	@RequestMapping("/calendar.do")
	public String calendarEvents() throws ParseException { //캘린더 조회페이지
		
		SimpleDateFormat fDate = new SimpleDateFormat("yyyy-MM-dd"); //같은 형식으로 맞춰줌
        Date start = fDate.parse("2021-10-01");
        Date end = fDate.parse("2021-10-01");
        
		ArrayList list = new ArrayList();
		
		Acalendar ac = new Acalendar(1, "MT", start, end, "#D25565");
		
		list.add(ac);
		
		return new GsonBuilder().create().toJson(list);
	}
	
	@RequestMapping("/upload.ca")
	public String uploadCalnendar() { //학사일정 업로드 페이지
		
		return "aCalendar/uploadCalendar";
	}
	
	@RequestMapping("/insert.ca") //학사일정 db에 insert
	public String insertCalendar(String title, String start, String end, String backgroundColor, HttpSession session) throws ParseException { // 일정 db에 업로드
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy/mm/dd");
		Date startDay = format.parse(start);
		Date endDay = format.parse(end);
		
		Acalendar ac = new Acalendar();
		ac.setTitle(title);
		ac.setStart(startDay);
		ac.setEnd(endDay);
		ac.setBackgroundColor(backgroundColor);
		
		System.out.println(ac);
		
		
		return "aCalendar/uploadCalendar";
	}


}
