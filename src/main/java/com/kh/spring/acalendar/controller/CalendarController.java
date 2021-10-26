package com.kh.spring.acalendar.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.GsonBuilder;
import com.kh.spring.acalendar.model.service.CalendarService;
import com.kh.spring.acalendar.model.vo.Acalendar;
import com.kh.spring.acalendar.model.vo.SearchCondition;

@Controller
public class CalendarController {
	
	@Autowired
	private CalendarService calendarService;
	
	@RequestMapping("/calendar.ca")
	public String toCalendar(Model model) throws ParseException { //캘린더 조회페이지
		
		return "aCalendar/calendar";
	}
	
	// 이벤트 불러오기
	@ResponseBody
	@RequestMapping(value="/calendarEvent.ca", produces="application/json; charset=utf-8")
	public String calendarEvents() throws ParseException {
		
		ArrayList<Acalendar> list = calendarService.calendarEvents();
		
		return new GsonBuilder().create().toJson(list);
	}
	
	//학사일정 업로드 페이지 (year 받아오기)
	@RequestMapping("/upload.ca")
	public String uploadCalnendar(Model model) { 
		
		ArrayList<String> yearList = calendarService.selectYear();
		
		model.addAttribute("yearList", yearList);
		
		return "aCalendar/uploadCalendar";
	}
	
	//학사일정 이벤트에 insert
	@RequestMapping("/insert.ca") 
	public String insertCalendar(String title, String start, String end, String backgroundColor, RedirectAttributes redirectAttributes) throws ParseException { // 일정 db에 업로드
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
		Date startDay = format.parse(start);
		Date endDay = format.parse(end);
		
		Acalendar ac = new Acalendar();
		ac.setTitle(title);
		ac.setStart(startDay);
		ac.setEnd(endDay);
		ac.setBackgroundColor(backgroundColor);
		
		calendarService.insertCalendar(ac);
		
		redirectAttributes.addFlashAttribute("message", "학사일정 등록성공");
		
		return "redirect:upload.ca";
	}
	
	//학사일정 관리 리스트 띄우기
	@ResponseBody
	@RequestMapping(value="calendar.li", produces="application/json; charset=utf-8")
	public String calendarList(String sYear, String sMonth) { 
		
		SearchCondition sc = new SearchCondition(sYear, sMonth);
		
		System.out.println(sc);
		
		ArrayList<Acalendar> list = calendarService.calendarList(sc);
		
		return new GsonBuilder().create().toJson(list);
	}

	//일정 삭제
	@RequestMapping("delete.ca")
	public String deleteCalendar(String acId, RedirectAttributes redirectAttributes) { 
		
		calendarService.deleteCalendar(acId);
		
		redirectAttributes.addFlashAttribute("message", "학사일정 삭제성공");
		
		return "redirect:upload.ca";
	}

}
