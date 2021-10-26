package com.kh.spring.gradeObject.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.GsonBuilder;
import com.kh.spring.gradeObject.service.GradeObjectService;
import com.kh.spring.lectRegister.vo.LecRegPro;

@Controller
public class GradeObjectController {

	
	  @Autowired 
	  private GradeObjectService gradeObjectService;
	 
	
	@RequestMapping("gradeObject.obj") // 이의 신청 리스트 페이지
	public String gradeObjectPage(Model model) {
		int stuId = 20193019;//임시 아이디 
		ArrayList<LecRegPro> objList = gradeObjectService.gradeObjectList(stuId);
		model.addAttribute("objList",objList);
		return "gradeObject/gradeObjectListPage";
	}
	@RequestMapping("gradeObjAddPop.obj") // 이의 신청 insert
	public String gradeObjectPopPage( @RequestParam("title") String title, @RequestParam("content") String content, 
			@RequestParam("subCode") String subCode, @RequestParam("date") String date) {
		int stuId = 20193019;//임시 아이디 
		LecRegPro detail =gradeObjectService.gradeDetailList(stuId, subCode, date);
		gradeObjectService.insertGradeObj(detail, title, content);
		return "gradeObject.obj";
	}
	@ResponseBody
	@RequestMapping(value="obDetail.ob", produces="applicatoin/json; charset=utf-8;")// 이의 신청 상세 팝업창
	public String gradeObjectDetailPage(String subCode, String date)  {
		  int stuId = 20193019;//임시 아이디 
		  LecRegPro objDe =gradeObjectService.gradeObjectDetailPage(stuId, subCode, date);//이의 신청 상세
		  return new GsonBuilder().create().toJson(objDe);
	}
}
