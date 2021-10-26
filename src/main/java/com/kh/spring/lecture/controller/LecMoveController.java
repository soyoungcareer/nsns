package com.kh.spring.lecture.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.GsonBuilder;
import com.kh.spring.facility.model.vo.searchFac;
import com.kh.spring.lecture.model.service.LecService;
import com.kh.spring.lecture.model.vo.Reply;
import com.kh.spring.lecture.model.vo.lecture;
import com.kh.spring.lecture.model.vo.lectureList;

@Controller
public class LecMoveController {

	@Autowired
	private LecService ls;

	@RequestMapping("lecMove.me")
	public String lecPageMain(@RequestParam(value = "id") int id, Model model) {

		ArrayList<lecture> list = ls.selectList(id);
		System.out.println(list);

		model.addAttribute("list", list);

		return "lecture/lec_main";
	}

	@RequestMapping("lecMoves.me")
	public String lecPageSub(@RequestParam(value = "no") int no, Model model) {

		ArrayList<lectureList> list = ls.lecPageSub(no);
		System.out.println(list);

		model.addAttribute("list", list);

		return "lecture/lec_sub";
	}

	@RequestMapping("lecMovess.me")
	public String lecPageFinal(@RequestParam(value = "no") int no, Model model) {

		lectureList lec = ls.lecPageFinal(no);

		model.addAttribute("l", lec);

		return "lecture/lec_final";
	}

	@RequestMapping("lecpl.me")
	public String lecPlusMove(@RequestParam(value = "no") int no, Model model) {

		System.out.println("************************" + no);

		model.addAttribute("no", no);

		return "lecture/lec_lecpl";

	}

	@RequestMapping("lecinsert.me")
	public String lecinsert(@RequestParam(value = "name") String name, @RequestParam(value = "no") int no,
			@RequestParam(value = "week") int week,
			@RequestParam(value = "uploadFile", required = false) MultipartFile file, HttpServletRequest request,
			RedirectAttributes redirect, Model model) {
		lectureList l = new lectureList();
		System.out.println(name);
		System.out.println(file + "!@#!@#!@#!@#!@#");
		if (!file.getOriginalFilename().equals("")) {
			String changeName = saveFile(file, request);

			if (changeName != null) {
				l.setOriginName(file.getOriginalFilename());
				l.setChangeName(changeName);
			}

		}

		l.setListContent(name);
		l.setListWeek(week);
		l.setRegNo(no);

		ls.lecinsert(l);

		redirect.addAttribute("no", l.getRegNo());

		return "redirect:lecMoves.me";

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

	@ResponseBody
	@RequestMapping(value = "rlistt.bo", produces = "application/json; charset=utf-8")
	public String selectReplyList(int bno) {
		System.out.println("!@#!#!@#!@#!@#!@#!@#!@#!@#!@#!@!@#^^^^" + bno);

		ArrayList<Reply> list = ls.selectReplyList(bno);

		// System.out.println(list.get(0).getCreateDate().toString());

		return new GsonBuilder().setDateFormat("yyyy/MM/dd HH:mm:ss").create().toJson(list);

	}

	@ResponseBody
	@RequestMapping("rinsertt.bo")
	public String insertReply(Reply r) {
		System.out.println(r + "!@#!#!@#!@#!@#!@#!@#!@#!@#!@#!@!@#^^^^" + r);
		int result = ls.insertReply(r);
		return String.valueOf(result);
	}
	
	@RequestMapping("lectime.me")
	public String facTime(@RequestParam(value = "times") String times,
			@RequestParam(value = "TotalTime") String TotalTime,
			@RequestParam(value = "no") int bno) {

		System.out.println("무한으로즐겨요" + times + " " + TotalTime + " " + bno);

		int a = Integer.parseInt(times);
		int b = Integer.parseInt(TotalTime);

		searchFac sf = new searchFac();

		sf.setCate5(a);
		sf.setCate6(b);
		sf.setCate7(bno);
		ls.insertTime(sf);

		return "10";

	}
}
