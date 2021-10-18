package com.kh.spring.consult.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.spring.consult.model.vo.Consult;

@Controller
public class ConsultController {

	@RequestMapping("applyPage.con")
	public String applyConsult() { //상담신청 페이지로 이동
		
		return "consult/consult";
	}
	
	@RequestMapping(value="insert.con", method=RequestMethod.POST)
	public String insertConsult(HttpServletRequest request) throws ParseException{ //상담신청  db에 넣기 
		
		//학생정보
		String stuId = request.getParameter("stuId");
		String stuName = request.getParameter("stuName");
		String major = request.getParameter("major");
		
		//상담정보
		String conCategory = request.getParameter("conCategory");
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy/mm/dd");
		Date conDate = format.parse(request.getParameter("conDate"));
		 
		String conReason = request.getParameter("conReason");
		
		//상담정보 객체에 담기
		Consult con = new Consult();
		con.setConCategory(conCategory);
		con.setConDate(conDate);
		con.setConReason(conReason);
		
		System.out.println(stuId);
		System.out.println(stuName);
		System.out.println(major);
		System.out.println(con);
		
		return "consult/consult"; 
	}
	
	@RequestMapping("consultStatusPage.con")
	public String consultStatus() { //상담신청현황 페이지로 이동
		
		return "consult/consultStatus";
	}
	
	@RequestMapping("consultPopup.con")
	public String consultPopup() { //상담내역 상세 페이지로 이동
		
		return "consult/consultPopUp";
	}
}

