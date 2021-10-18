package com.kh.spring.certificate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CertificateController {

	@RequestMapping("graduation.cer") // 졸업 증명서- 추가
	public String graduationPage() {

		return "certificate/graduation";
	}
	@RequestMapping("certificate.cer") // 자격증 페이지 
	public String certificatePage() {

		return "certificate/certificate";
	}
}
