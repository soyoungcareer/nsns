package com.kh.spring.lecture.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LecMoveController {

	@RequestMapping("lecMove.me")
	public String lecPageMain() {
		
		return "lecture/lec_main"; 
	}
	
	@RequestMapping("lecMoves.me")
	public String lecPageSub() {
		
		return "lecture/lec_sub";
	}
	
	
	@RequestMapping("lecMovess.me")
	public String lecPageFinal() {
		
		return "lecture/lec_final";
	}
}
