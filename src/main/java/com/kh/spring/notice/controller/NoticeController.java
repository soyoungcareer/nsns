package com.kh.spring.notice.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.common.PageInfo;
//import com.kh.spring.attachment.vo.Attachment;
import com.kh.spring.common.Pagination;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.notice.model.service.NoticeService;
import com.kh.spring.notice.model.vo.Notice;

@Controller 
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	/*
	@RequestMapping("list.ntc")
	public String noticeTest() {
		return "admin/noticeListView";
	}*/
	
	@RequestMapping("list.ntc")//공지사항 목록 조회
	public String selectList(@RequestParam(value="currentPage", required = false, defaultValue="1") int currentPage , Model model) {
		
		int listCount = noticeService.selectNListCount();
		System.out.println(listCount);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Notice> list = noticeService.selectNList(pi);
		System.out.println("list : " + list);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "admin/noticeListView";
	}
	
	@RequestMapping("detail.ntc")//공지사항 게시글 상세조회
	public ModelAndView selectNBoard(int bno, ModelAndView mv) {
		
		Notice n = noticeService.selectNBoard(bno);
		mv.addObject("n", n).setViewName("admin/noticeDetailView");
		
		return mv;
	}
	
	@RequestMapping("enrollFrom.ntc")//게시글 입력 폼 페이지로 전환
	public String enrollForm() {
		return "admin/noticeEnrollForm";
	}
	
	@RequestMapping("insert.ntc")//게시글 등록
	public String insertNBoard(Notice n, HttpServletRequest request, Model model
							, @RequestParam(name="ntcAttachment", required=false) MultipartFile file) {
		
		//확인용
		System.out.println(n);
		System.out.println(file.getOriginalFilename());
		
		if(!file.getOriginalFilename().equals("")) {
			String changeName = saveFile(file, request);
			
			if(changeName != null) {
				n.setOriginName(file.getOriginalFilename());
				n.setChangeName(changeName);
			}
		}
		
		noticeService.insertNBoard(n);
		
		return "redirect:list.ntc"; // 작성한 글 상세 페이지
	}
	
	private String saveFile(MultipartFile file, HttpServletRequest request) {//첨부파일 등록
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\upload_files\\";
		
		System.out.println("savePath" + savePath);//확인용
		
		String originName = file.getOriginalFilename();
		String saveTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = saveTime + ext;
		
		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) { //change project compliance and jre to 1.7
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new CommException("파일 첨부 오류가 발생하였습니다.");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new CommException("파일 첨부 오류가 발생하였습니다.");
		}
		
		return changeName;
	}
	
	/*
	@RequestMapping("insert.ntc")
	public String insertNBoard(Notice n, Attachment a, HttpServletRequest request, Model model
							, @RequestParam(name="ntcAttachment", required=false) MultipartFile file) {
		
		//originName, changeName, savePath 생성 / fileNo db 시퀀스, refNo 참조, uploadDate db sysdate, status db y
		
		//확인용
		System.out.println(n);
		System.out.println(file.getOriginalFilename());
		
		if(!file.getOriginalFilename().equals("")) {
			String changeName = saveFile(file, request);
			
			if(changeName != null) {
				a.setOriginName(file.getOriginalFilename());
				a.setChangeName(changeName);
			}
		}
		
		//noticeService.insertNBoard(n);
		
		return "redirect:list.ntc"; // 작성한 글 상세 페이지
	}
	
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String resources = request.getSession().getServletContext().getRealPath("resources");//필요한가?
		String savePath = resources + "\\upload_files\\";
		
		System.out.println("savePath" + savePath);//확인용
		
		Attachment a = new Attachment();
		a.setSavePath(savePath);
		
		String originName = file.getOriginalFilename();
		String saveTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = savePath + ext;
		
		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) { //change project compliance and jre to 1.7
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new CommException("파일 첨부 오류가 발생하였습니다.");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new CommException("파일 첨부 오류가 발생하였습니다.");
		}
		
		return changeName;
	}*/
	
	@RequestMapping("updateForm.ntc")
	public ModelAndView updateForm(int bno, ModelAndView mv) {
		
		Notice n = noticeService.selectNBoard(bno);
		mv.addObject("n", n).setViewName("admin/noticeUpdateForm");
		 //jsp "n" - n
		return mv;
	}
	
	@RequestMapping("update.ntc")
	public ModelAndView updateNBoard(Notice n, ModelAndView mv, HttpServletRequest request,
									@RequestParam(value="reUploadFile", required=false) MultipartFile file) {
		
		//reUploadFile
		
		if(!file.getOriginalFilename().equals("")) {
			
			if(n.getChangeName() != null) {
				deleteFile(n.getChangeName(), request);
			}
			
			String changeName = saveFile(file, request);
			
			n.setOriginName(file.getOriginalFilename());
			n.setChangeName(changeName);
		}
		
		noticeService.updateNBoard(n);
		mv.addObject("bno", n.getNtcNo()).setViewName("redirect:detail.ntc");
		
		return null;
	}

	private void deleteFile(String fileName, HttpServletRequest request) {
		//String fileName, changeName
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\upload_files\\";
		
		System.out.println("savePath : " + savePath);
		
		File deleteFile = new File(savePath + fileName);
		deleteFile.delete();
		
	}
	
	@RequestMapping("delete.ntc")
	public String deleteNBoard(int bno, String fileName, HttpServletRequest request) {
		//String fileName, changeName
		noticeService.deleteNBoard(bno);
		
		if(!fileName.equals("")) {
			deleteFile(fileName, request);
		}
		
		return "redirect:list.ntc";
	}

	

}
