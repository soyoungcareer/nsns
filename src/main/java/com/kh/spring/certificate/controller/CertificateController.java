package com.kh.spring.certificate.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.GsonBuilder;
import com.kh.spring.certificate.service.CertificateService;
import com.kh.spring.certificate.vo.Certificate;
import com.kh.spring.certificate.vo.Graduation;
import com.kh.spring.certificate.vo.Volunteer;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.member.vo.Student;

@Controller
public class CertificateController {

	 @Autowired 
	  private CertificateService certificateService;
	
	@RequestMapping("graduation.cer") // 졸업 증명서 페이지
	public String graduationPage(Model model, HttpSession session) {
		int stuId = ((Student)session.getAttribute("loginStu")).getStuId();
		//int stuId = 20132208;//임시 아이디 
		Graduation graduation = certificateService.gradeAbout(stuId);
		model.addAttribute("graduation", graduation);
		return "certificate/graduation";
	}
	@RequestMapping("certificate.cer") // 자격증 페이지 
	public String certificatePage(Model model, HttpSession session) {
		int stuId = ((Student)session.getAttribute("loginStu")).getStuId();
		//int stuId = 20193019;//임시 아이디 
		ArrayList<Certificate> certificate = certificateService.certificateList(stuId);
		ArrayList<Volunteer> volunteer = certificateService.volunteerList(stuId);
		model.addAttribute("certificate", certificate);
		model.addAttribute("volunteer", volunteer);
		return "certificate/certificate";
	}
	@RequestMapping("cerAdd.cer") // 자격증 insert
	public String certificateAdd( @RequestParam(name="day") String day,Certificate cer,HttpSession session) {
		int stuId = ((Student)session.getAttribute("loginStu")).getStuId();
		//int stuId = 20193019;//임시 아이디 
		SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");
		
		Date d = null;
		try {
			d = form.parse(day);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		cer.setStuId(stuId);
		cer.setGetDate(d);
		certificateService.certificateAdd(cer);
		return "redirect:certificate.cer";
	}
	@RequestMapping("cerDel.cer") // 자격증 delete
	public String certificateDelete(int cerNo) {
		certificateService.certificateDelete(cerNo);
		return "redirect:certificate.cer";
	}
	@ResponseBody
	@RequestMapping(value="cerUpdate.ce", produces="applicatoin/json; charset=utf-8") // 자격증 update 창 띄우기
	public String certificateUpDetail(int cerNo) {
		Certificate cer = certificateService.certificateUpDetail(cerNo);
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(cer);
	}
	@RequestMapping("cerUpd.cer") // 자격증 update
	public String certificateUpdate(@RequestParam(name="uday") String uday,Certificate cer, HttpSession session) {
		int stuId = ((Student)session.getAttribute("loginStu")).getStuId();
		//int stuId = 20193019;//임시 아이디 
		SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");
			Date d = null;
				try {
					d = form.parse(uday);
				} catch (ParseException e) {
					e.printStackTrace();
				}
		cer.setStuId(stuId);
		cer.setGetDate(d);
		System.out.println(cer);
		certificateService.certificateUpdate(cer);
		return "redirect:certificate.cer";
	}
	@RequestMapping("volAdd.cer") // 봉사활동 insert
	public String voluntterAdd(Volunteer vol, HttpServletRequest request,@RequestParam(name="sDay") String sDay,
			@RequestParam(name="eDay") String eDay, @RequestParam(name="uploadFile", required= false) MultipartFile file
			, HttpSession session) {
		int stuId = ((Student)session.getAttribute("loginStu")).getStuId();
		//int stuId = 20193019;//임시 아이디 
		SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");
		if(!file.getOriginalFilename().equals("")) {
			String changeName = saveFile(file,request);
			if(changeName!=null) {
				vol.setOriginName(file.getOriginalFilename());
				vol.setChangeName(changeName);
			}
		}
		
		Date d1=null;
		Date d2=null;
		try {
			 d1=form.parse(sDay);
			 d2=form.parse(eDay);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		vol.setStuId(stuId);
		vol.setStartDate(d1);
		vol.setEndDate(d2);
		certificateService.voluntterAdd(vol);
		return "redirect:certificate.cer";
	}
	@RequestMapping("volDel.cer") // 봉사활동 delete
	public String voluntterDelete(int volNo, String ch, HttpServletRequest request) {
		if(!ch.equals("")) {
			deleteFile(ch, request);
		}
		certificateService.voluntterDelete(volNo);
		return "redirect:certificate.cer";
	}
	@ResponseBody
	@RequestMapping(value="volUpdate.ce", produces="applicatoin/json; charset=utf-8") // 봉사활동 update 창 띄우기
	public String volunteerUpDetail(int volNo) {
		Volunteer vol = certificateService.volunteerUpDetail(volNo);
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(vol);
	}
	@RequestMapping("volUpd.cer") // 봉사활동 update
	public String volunteerUpdate(Volunteer vol, HttpServletRequest request,@RequestParam(name="sDay") String sDay,
			@RequestParam(name="eDay") String eDay, @RequestParam(name="uploadFile", required= false) MultipartFile file
			, HttpSession session) {
		int stuId = ((Student)session.getAttribute("loginStu")).getStuId();
		//int stuId = 20193019;//임시 아이디 
		SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");
		
		if(!file.getOriginalFilename().equals("")) {
			if(vol.getChangeName()!=null) {
				deleteFile(vol.getChangeName(), request);
			}
			String changeName = saveFile(file,request);
			vol.setOriginName(file.getOriginalFilename());
			vol.setChangeName(changeName);
		}
		
		Date d1=null;
		Date d2=null;
		try {
			 d1=form.parse(sDay);
			 d2=form.parse(eDay);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		vol.setStuId(stuId);
		vol.setStartDate(d1);
		vol.setEndDate(d2);
		certificateService.volunteerUpdate(vol);
		return "redirect:certificate.cer";
	
	}
	private String saveFile(MultipartFile file, HttpServletRequest request) { 
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources +"\\upload_files\\";
		
		System.out.println("savePath"+savePath);
		String originName = file.getOriginalFilename();//원본 파일명
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		String ext = originName.substring(originName.lastIndexOf("."));// ex> "unhappy".substring(2) returns "happy"
		String changeName = currentTime + ext;
			try {
				file.transferTo(new File(savePath+changeName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		return changeName;
	}
	private void deleteFile(String fileName, HttpServletRequest request) {  //공통
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\upload_files\\";
		File deleteFile = new File(savePath + fileName);
		deleteFile.delete();// 파일 삭제
	}
	
	
}
