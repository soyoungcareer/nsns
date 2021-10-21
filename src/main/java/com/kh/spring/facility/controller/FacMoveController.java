package com.kh.spring.facility.controller;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.common.Pagination;
import com.kh.spring.facility.model.Service.FacilityService;
import com.kh.spring.facility.model.vo.PageInfoo;
import com.kh.spring.facility.model.vo.facility;

@Controller
public class FacMoveController {

	@Autowired
	private FacilityService fs;

	@RequestMapping("facMove.me")
	public String facMain(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			Model model) {

		int listCount = fs.selectListCount();
		System.out.println("리스트확인 테스트 " + listCount);
		PageInfoo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);

		ArrayList<facility> list = fs.selectList(pi);
		System.out.println(list);

		model.addAttribute("list", list);
		model.addAttribute("pi", pi);

		return "facility/fac_main";
	}

	@RequestMapping("facMovess.me")
	public String facMy() {
		return "facility/fac_my";
	}

	// @RequestMapping("facMoves.me")
	@ResponseBody
	@RequestMapping(value = "facMoves.me", method = { RequestMethod.POST })
	public String facSemi(facility f, Model model, @RequestParam(value = "no") int no) {

		System.out.println("adsalskqlflafasf " + no);

		f = fs.selectFacility(no);

		String a = f.getFileFName();

		System.out.println(a);
		return a;

	}

	private String saveFile(MultipartFile file, HttpServletRequest request) {

		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\upload_files\\";

		String originName = file.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		String ext = originName.substring(originName.lastIndexOf("."));

		String changeName = currentTime + ext;

		try {
			file.transferTo(new File(savePath + changeName));

		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return changeName;

	}

	@RequestMapping("facMovesss.me")
	public String facCheck() {
		return "facility/fac_check";
	}

	@RequestMapping("facpl.me")
	public String insertFacility(facility f, HttpServletRequest request, Model model,
			@RequestParam(name = "uploadFile", required = false) MultipartFile file) {

		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$" + f);
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$" + file);

		if (!file.getOriginalFilename().equals("")) {
			String changeName = saveFile(file, request);

			if (changeName != null) {
				f.setFileBName(file.getOriginalFilename());
				f.setFileFName(changeName);
			}

		}

		fs.insertFacility(f);

		return "redirect:facMove.me";

	}

}
