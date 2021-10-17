package com.kh.spring.lectRegister.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LectRegisterController {

 @RequestMapping("register.reg") //수강신청- 추가
 public String registerPage() {

		return "lectRegister/lectRegister";
	}
 @RequestMapping("cart.reg") //장바구니
 public String cartPage() {

		return "lectRegister/registerCart"; 
	}
 @RequestMapping("timeBoard.reg") //시간표
 public String timeBoardPage() { 

		return "lectRegister/timeBoard";
	}
 @RequestMapping("lectRegisterEdit.reg") //관리자용 과목 설명 수정페이지 
 public String lectRegisterEditPage() {

		return "lectRegister/lectRegisterEdit";
	}
 @RequestMapping("grade.gra") //성적 조회 페이지
 public String gradeSearchPage() {

		return "studentEval/gradeSearchPage";
	}
 @RequestMapping("credit.reg") //학점 조회 페이지
 public String creditSearchPage() {

		return "studentEval/creditSearchPage";
	}
}

