package com.kh.spring.studentEval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AttendanceController {
 
	// 교수 > 학생 관리 > 출결 관리
	@RequestMapping("profAttend.pr")
	public String profAttendance() {
		return "professor/profAttendance";
	}
}
