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
	
	@RequestMapping("list.ntc") //공지사항 목록 조회
	public String selectList(@RequestParam(value="currentPage", required = false, defaultValue="1") int currentPage , Model model) {
		
		int listCount = noticeService.selectNListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Notice> list = noticeService.selectNList(pi);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "admin/noticeListView";
	}
	
	@RequestMapping("detail.ntc") //공지사항 게시글 상세조회
	public ModelAndView selectNBoard(int bno, ModelAndView mv) {
		
		Notice n = noticeService.selectNBoard(bno);
		mv.addObject("n", n).setViewName("admin/noticeDetailView");
		
		return mv;
	}
	
	@RequestMapping("enrollFrom.ntc") //게시글 입력 폼 페이지로 전환
	public String enrollForm() {
		
		return "admin/noticeEnrollForm";
	}
	
	@RequestMapping("insert.ntc") //게시글 등록
	public String insertNBoard(Notice n, HttpServletRequest request, Model model
							, @RequestParam(name="ntcAttachment", required=false) MultipartFile file) {
		
		if(!file.getOriginalFilename().equals("")) {
			String changeName = saveFile(file, request);
			
			if(changeName != null) {
				n.setOriginName(file.getOriginalFilename());
				n.setChangeName(changeName);
			}
		}
		
		noticeService.insertNBoard(n);
		
		return "redirect:list.ntc";
	}
	
	private String saveFile(MultipartFile file, HttpServletRequest request) { //첨부파일 등록
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\upload_files\\";
		String originName = file.getOriginalFilename();
		
		String saveTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = saveTime + ext;
		
		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
			throw new CommException("파일 첨부 오류가 발생하였습니다.");
		} catch (IOException e) {
			e.printStackTrace();
			throw new CommException("파일 첨부 오류가 발생하였습니다.");
		}
		
		return changeName;
	}

	@RequestMapping("updateForm.ntc") //게시글 수정 페이지 이동
	public ModelAndView updateForm(int bno, ModelAndView mv) {
		
		Notice n = noticeService.selectNBoard(bno);
		mv.addObject("n", n).setViewName("admin/noticeUpdateForm");
		
		return mv;
	}
	
	@RequestMapping("update.ntc") //게시글 수정
	public ModelAndView updateNBoard(Notice n, ModelAndView mv, HttpServletRequest request,
									@RequestParam(value="reUploadFile", required=false) MultipartFile file) {
		
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
		
		return mv;
	}

	private void deleteFile(String fileName, HttpServletRequest request) { //게시글 첨부파일 삭제

		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\upload_files\\";
		
		File deleteFile = new File(savePath + fileName);
		deleteFile.delete();
	}
	
	@RequestMapping("delete.ntc") //게시글 삭제
	public String deleteNBoard(int bno, String fileName, HttpServletRequest request) {
		
		noticeService.deleteNBoard(bno);
		
		if(!fileName.equals("")) {
			deleteFile(fileName, request);
		}
		
		return "redirect:list.ntc";
	}

}
