package com.kh.spring.studentStatus.controller;

import java.text.ParseException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.GsonBuilder;
import com.kh.spring.studentStatus.model.service.StudentStatusService;
import com.kh.spring.studentStatus.model.vo.StudentOff;
import com.kh.spring.studentStatus.model.vo.StudentStatus;

@Controller	
public class StudentStatusController {
	
	@Autowired
	private StudentStatusService studentStatusService;
	
	//학생 상태 조회 페이지
	@RequestMapping("stuStatusPage.stu")
	public String studentStatusPage() { 
		
		return "studentStatus/studentStatus";
	}
	
	//학생들의 휴복학 신청 현황
	@ResponseBody
	@RequestMapping(value="stuStsPro.stu", produces="application/json; charset=utf-8")
	public String studentProList () { 
		
		ArrayList<StudentStatus> list = studentStatusService.studentProList();
		
		System.out.println("list : " + list);
		
		return new GsonBuilder().create().toJson(list);
	}
	
	//학생들의 휴학 신청 현황
	@ResponseBody
		@RequestMapping(value="stuOff.stu", produces="application/json; charset=utf-8")
		public String studentOff (int appNo) { 
		
		System.out.println("appNo : " + appNo);
		
		StudentOff stuOff = studentStatusService.studentOff(appNo);
			
		return new GsonBuilder().create().toJson(stuOff);
	}
	
	//휴학 신청 페이지
		@RequestMapping("stuOffPage.stu")
		public String stuOffPage() { 
			
			return "studentStatus/studentOff";
		}
}
