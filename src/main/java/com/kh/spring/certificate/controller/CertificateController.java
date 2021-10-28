package com.kh.spring.certificate.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.certificate.service.CertificateService;
import com.kh.spring.certificate.vo.Certificate;
import com.kh.spring.certificate.vo.Graduation;

@Controller
public class CertificateController {

	 @Autowired 
	  private CertificateService certificateService;
	
	@RequestMapping("graduation.cer") // 졸업 증명서 페이지
	public String graduationPage(Model model) {
		int stuId = 20132208;//임시 아이디 
		Graduation graduation = certificateService.gradeAbout(stuId);
		model.addAttribute("graduation", graduation);
		return "certificate/graduation";
	}
	@RequestMapping("certificate.cer") // 자격증 페이지 
	public String certificatePage(Model model) {
		int stuId = 20193019;//임시 아이디 
		ArrayList<Certificate> certificate = certificateService.certificateList(stuId);
		model.addAttribute("certificate", certificate);
		return "certificate/certificate";
	}
}
