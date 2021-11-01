package com.kh.spring.facility.controller;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.GsonBuilder;
import com.kh.spring.common.PageInfo;
import com.kh.spring.common.Pagination;
import com.kh.spring.facility.model.Service.FacilityService;
import com.kh.spring.facility.model.vo.allam;
import com.kh.spring.facility.model.vo.facility;
import com.kh.spring.facility.model.vo.facilitycheck;
import com.kh.spring.facility.model.vo.searchFac;
import com.kh.spring.member.vo.Admin;
import com.kh.spring.member.vo.Student;

@Controller
public class FacMoveController {

	@Autowired
	private FacilityService fs;

	@RequestMapping("facMove.me")
	public String facMain(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			HttpSession session, Model model) {
		String position = (String) session.getAttribute("position");
		model.addAttribute("position", position);
	
		if(position.equals("student")) {
			Student st = (Student) session.getAttribute("loginStu");
			int id = st.getStuId();
		}
		

		System.out.println("@@@@@@@@@@@@@@@@@" + position);
		int listCount = fs.selectListCount();
		System.out.println("리스트확인 테스트 " + listCount);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);

		ArrayList<facility> list = fs.selectList(pi);
		System.out.println(list);

		model.addAttribute("list", list);
		model.addAttribute("pi", pi);

		return "facility/fac_main";
	}

	@RequestMapping("facMovessss.me")
	public String facadminMain(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, Model model,
			HttpSession session, @RequestParam(value = "msg", required = false) String msg) {

		String position = (String) session.getAttribute("position");
		model.addAttribute("position", position);

		int listCount = fs.selectListCount();
		System.out.println("리스트확인 테스트 " + listCount);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);

		ArrayList<facility> list = fs.selectList(pi);
		System.out.println(list);

		model.addAttribute("list", list);
		model.addAttribute("pi", pi);

		if (msg != null) {
			model.addAttribute("msg", msg);
		}

		return "facility/fac_admin_main";
	}

	@RequestMapping("facMovess.me")
	public String facMy(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			HttpSession session, Model model) {

		String position = (String) session.getAttribute("position");
		model.addAttribute("position", position);

		int id = 0;
		if(position.equals("student")) {
			Student st = (Student) session.getAttribute("loginStu");
			 id = st.getStuId();
		}
		

		int listCount = fs.selectMyListCount(id);
		System.out.println("리스트확인 테스트 " + listCount);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<facility> list = fs.facMyPage(id, pi);

		ArrayList<allam> listt = fs.selectallam(id);

		model.addAttribute("list", list);
		model.addAttribute("listt", listt);

		model.addAttribute("pi", pi);

		Date from = new Date();

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String date = transFormat.format(from);

		for (facility a : list) {

			String to = transFormat.format(a.getFacPeriod());

			try {
				Date format1 = new SimpleDateFormat("yyyy-MM-dd").parse(date);
				Date format2 = new SimpleDateFormat("yyyy-MM-dd").parse(to);
				System.out.println(format1);
				System.out.println(format2);

				long diffDays = (format2.getTime() - format1.getTime()) / (24 * 60 * 60 * 1000);
				System.out.println(diffDays);
				if (diffDays <= 0) {
					a.setFacbancheck("반납");
					System.out.println(a.getFacbancheck());
				}

				a.setFacban(diffDays);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

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
	public String facCheck(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			HttpSession session, Model model) {

		String position = (String) session.getAttribute("position");
		model.addAttribute("position", position);

		int listCount = fs.selectListAppCount();
		System.out.println("리스트확인 테스트 " + listCount);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);

		ArrayList<facilitycheck> list = fs.selectAppList(pi);
		System.out.println(list);

		model.addAttribute("list", list);
		model.addAttribute("pi", pi);

		System.out.println("김경준 김경준 도배@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + list);

		return "facility/fac_check";
	}

	@RequestMapping("facpl.me")
	public String insertFacility(facility f, HttpServletRequest request, Model model, HttpSession session,
			@RequestParam(name = "uploadFile", required = false) MultipartFile file) {

		String position = (String) session.getAttribute("position");
		model.addAttribute("position", position);

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

	@RequestMapping("facMovecate.me")
	public String selectCateList(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, Model model,
			HttpSession session, @RequestParam(name = "cate1", required = false) String cate1,
			@RequestParam(name = "cate2", required = false) String cate2,
			@RequestParam(name = "search", required = false) String cate3) {

		if (cate3.isEmpty()) {
			cate3 = "선택";
		}
		String position = (String) session.getAttribute("position");
		model.addAttribute("position", position);

		searchFac sf = new searchFac();
		sf.setCate1(cate1);
		sf.setCate4(cate2);
		sf.setCate3(cate3);

		System.out.println("!@!@$!@$!%$#^#%" + cate1 + cate2 + cate3);
		int listCount = fs.selectListCount(sf);
		System.out.println("리스트확인 테스트 @@@@@" + listCount);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);

		ArrayList<facility> list = fs.selectList(sf, pi);
		System.out.println("김경준의 체크링스트 @@@@@@@@@@@@@" + list);

		model.addAttribute("list", list);
		model.addAttribute("pi", pi);

		return "facility/fac_main";

	}

	@RequestMapping("facMovecate2.me")
	public String selectCateList2(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, Model model,
			HttpSession session, @RequestParam(name = "cate1", required = false) String cate1,
			@RequestParam(name = "cate2", required = false) String cate2,
			@RequestParam(name = "search", required = false) String cate3) {

		if (cate3.isEmpty()) {
			cate3 = "선택";
		}

		String position = (String) session.getAttribute("position");
		model.addAttribute("position", position);

		searchFac sf = new searchFac();
		sf.setCate1(cate1);
		sf.setCate4(cate2);
		sf.setCate3(cate3);

		System.out.println("!@!@$!@$!%$#^#%" + cate1 + cate2 + cate3);
		int listCount = fs.selectListCount(sf);
		System.out.println("리스트확인 테스트 @@@@@" + listCount);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);

		ArrayList<facility> list = fs.selectList(sf, pi);
		System.out.println("김경준의 체크링스트 @@@@@@@@@@@@@" + list);

		model.addAttribute("list", list);
		model.addAttribute("pi", pi);

		return "facility/fac_admin_main";

	}

	@RequestMapping("facdel.me")
	public String selectfacdel(Model model, String no, @RequestParam(value = "hiddenNO") int hiddenNo,
			RedirectAttributes redirect) {

		System.out.println(hiddenNo);

		fs.selectfacdel(hiddenNo);

		redirect.addAttribute("msg", "삭제되었습니다");

		return "redirect:facMovessss.me";

	}

	@RequestMapping("facapp.me")
	public String facApp(@RequestParam(value = "area") String area, HttpSession session,
			@RequestParam(value = "hiddenNO") String hiddenNO, Model model) {
		String position = (String) session.getAttribute("position");
		model.addAttribute("position", position);

		int userId = 0;
		if(position.equals("student")) {
			Student st = (Student) session.getAttribute("loginStu");
			 userId = st.getStuId();
		}
		searchFac sf = new searchFac();
		sf.setCate1(area);
		sf.setCate2(userId);
		sf.setCate3(hiddenNO);
		sf.setCate4("예약중");

		System.out.println(area);
		System.out.println(userId);
		System.out.println(hiddenNO);
		int result = fs.facApp(sf);

		if (result <= 0) {
			model.addAttribute("msg", "예약대기중입니다.");
			return "redirect:FacMove.me";
		}

		return "redirect:facMove.me";

	}

	@RequestMapping("facok.me")
	public String facOk(@RequestParam(value = "no") int no) {

		System.out.println("10/25 chkeck" + no);

		fs.facOk(no);

		return "redirect:facMovesss.me";

	}

	@RequestMapping("facno.me")
	public String facNo(@RequestParam(value = "no") int no, @RequestParam(value = "stuid") int id,
			@RequestParam(value = "name") String name) {

		System.out.println("10/25 chkeck" + no + id + name);

		searchFac sf = new searchFac();

		sf.setCate5(id);
		sf.setCate4(name);

		fs.facNo(no, sf);

		return "redirect:facMovesss.me";

	}

	@RequestMapping("fachome.me")
	public String facHome(@RequestParam(value = "no") int no) {

		System.out.println("10/25 chkeck" + no);

		fs.facHome(no);

		return "redirect:facMovessss.me";

	}
	
	@ResponseBody
	@RequestMapping("delallam.me")
	public String delallam(HttpSession session,@RequestParam(value = "test") String test1) {
		Student st = (Student) session.getAttribute("loginStu");
		int id = st.getStuId();
		fs.delallam(id);
		String data = "data";
		return new GsonBuilder().create().toJson(data);

	}

}
