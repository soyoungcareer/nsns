package com.kh.spring.facility.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FacMoveController {

	
	@RequestMapping("facMove.me")
	public String facMain() {
		return "facility/fac_main";
	}

	@RequestMapping("facMovess.me")
	public String facMy() {
		return "facility/fac_my";
	}

	@RequestMapping("facMoves.me")
	public String facSemi(HttpServletRequest req) {
	
		String aa = req.getParameter("aa");
		
		System.out.println("스쳐가듯 확인하기 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!   aa : " + aa);
		
		return "redirect:/";
	}
	
	
	@RequestMapping("facMovesss.me")
	public String facCheck() {
		return "facility/fac_check";
	}
	
}
