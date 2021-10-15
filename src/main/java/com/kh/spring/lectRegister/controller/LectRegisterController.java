package com.kh.spring.lectRegister.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LectRegisterController {

 @RequestMapping("register.reg")
 public String registerPage() {

		return "lectRegister/lectRegister";
	}
 @RequestMapping("cart.reg")
 public String cartPage() {

		return "lectRegister/registerCart";
	}
 @RequestMapping("timeBoard.reg")
 public String timeBoardPage() {

		return "lectRegister/timeBoard";
	}
 @RequestMapping("lectRegisterEdit.reg")
 public String lectRegisterEditPage() {

		return "lectRegister/lectRegisterEdit";
	}
 
}

