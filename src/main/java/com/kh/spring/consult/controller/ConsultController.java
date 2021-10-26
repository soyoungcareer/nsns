package com.kh.spring.consult.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.GsonBuilder;
import com.kh.spring.consult.model.service.ConsultService;
import com.kh.spring.consult.model.vo.Consult;
import com.kh.spring.consult.model.vo.ConsultStatus;
import com.kh.spring.studentStatus.model.vo.StudentOff;

@Controller
public class ConsultController {
	
	@Autowired
	private ConsultService consultService;

	@RequestMapping("applyPage.con")
	public String applyConsult() { //상담신청 페이지로 이동
		
		return "consult/consult";
	}
	
	
	//상담신청현황 페이지로 이동
	@RequestMapping("consultStatusPage.con")
	public String consultStatus() { 
		
		return "consult/consultStatus";
	}
	
	//해당학생이 현재 상담신청 중인지 확인
	@ResponseBody 
	@RequestMapping(value="consultCount.con", produces="application/json; charset=utf-8")
	public String selectConsultCount (String stuId) { 
			
			int count = consultService.selectConsultCount(stuId);
				
			return new GsonBuilder().create().toJson(count);
	}
	
	//상담신청  insert
	@RequestMapping(value="insert.con", method=RequestMethod.POST)
	public String insertConsult(Consult con, String conD, RedirectAttributes redirectAttributes) throws ParseException{ 
			
		SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
		Date ConDate = format.parse(conD);
			 
		con.setConDate(ConDate);
		
		consultService.insertConsult(con);
		
		redirectAttributes.addFlashAttribute("message", "성공적으로 상담신청이 완료되었습니다.");
			
		return "redirect:applyPage.con";
	}
		
	
	//학생들의 상담 신청 현황
	@ResponseBody
	@RequestMapping(value="conStsPro.con", produces="application/json; charset=utf-8")
	public String conProList () { 
			
		String userId = "20190321"; //로그인한 세션의 학생 학번 가져오기
					
		ArrayList<ConsultStatus> list = consultService.conProList(userId);
			
		System.out.println("list : " + list);
			
		return new GsonBuilder().create().toJson(list);
	}
	
	
	//학생들의 상담 신청 내역 상세조회
	@ResponseBody
	@RequestMapping(value="selectCon.con", produces="application/json; charset=utf-8")
	public String selectConsult (int conNo) { 
			
		Consult con = consultService.selectConsult(conNo);
				
		return new GsonBuilder().create().toJson(con);
	}
	
	//학생 상담 신청 취소
	@RequestMapping("deleteCon.con")
	public String deleteCon(int conNo, RedirectAttributes redirectAttributes) { 
			
		consultService.deleteCon(conNo);
			
		redirectAttributes.addFlashAttribute("message", "해당 휴학 신청이 취소되었습니다.");
			
		return  "redirect:stuStatusPage.stu";
	}
		
}

