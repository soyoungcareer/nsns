package com.kh.spring.lecture.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.concurrent.ThreadLocalRandom;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
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
import com.kh.spring.lecture.model.vo.Coolsms;
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
		model.addAttribute("id", id);
		return "lecture/lec_main";
	}

	@RequestMapping("lecMoves.me")
	public String lecPageSub(@RequestParam(value = "no") int no, @RequestParam(value = "id", required = false) int id,
			Model model) {

		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		model.addAttribute("no", no);

		ArrayList<lectureList> list = ls.lecPageSub(no);

		model.addAttribute("list", list);
		model.addAttribute("no", no);
		if (id > 0) {
			model.addAttribute("id", id);
		}
		System.out.println("!@#!@#!@#!@#!@@@@@@@@@@@@@@@@@@@@@@@@@@2" + list);
		return "lecture/lec_sub";
	}

	@RequestMapping("lecMovess.me")
	public String lecPageFinal(@RequestParam(value = "no") int no, @RequestParam(value = "id", required = false) int id,
			Model model) {

		lectureList lec = ls.lecPageFinal(no);

		model.addAttribute("l", lec);
		if (id > 0) {
			model.addAttribute("id", id);
		}
		return "lecture/lec_final";
	}

	@RequestMapping("lecpl.me")
	public String lecPlusMove(@RequestParam(value = "no") int no, @RequestParam(value = "id", required = false) int id,
			Model model) {

		System.out.println("************************" + no);

		model.addAttribute("no", no);
		if (id > 0) {
			model.addAttribute("id", id);
		}

		return "lecture/lec_lecpl";

	}

	@RequestMapping("lecinsert.me")
	public String lecinsert(@RequestParam(value = "name") String name, @RequestParam(value = "no") int no,
			@RequestParam(value = "id", required = false) int id, @RequestParam(value = "week") int week,
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

		if (id > 0) {
			redirect.addAttribute("id", id);
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
			@RequestParam(value = "TotalTime") String TotalTime, @RequestParam(value = "no") int bno) {

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
	
	@ResponseBody
	@RequestMapping(value="sendSms.me")
	public String sendSms(HttpServletRequest request) throws Exception {
		
		String a = Integer.toString(ThreadLocalRandom.current().nextInt(100000, 1000000));
		
		String api_key = "NCSANPMH0N490VJV";
		String api_secret = "A6B5EUT9RDND1MX7SJULZSSN145ENWZS";
		Coolsms coolsms = new Coolsms(api_key, api_secret);

		HashMap<String, String> set = new HashMap<String, String>();
		set.put("to", "01086297286"); // 수신번호

			set.put("from", (String) request.getParameter("from")); // 발신번호
			set.put("text", (String) a); // 문자내용
			set.put("type", "sms"); // 문자 타입
	
			System.out.println(set);
	
			JSONObject result = coolsms.send(set); // 보내기&전송결과받기
	
			if ((boolean) result.get("status") == true) {
				// 메시지 보내기 성공 및 전송결과 출력
				System.out.println("성공");
				System.out.println(result.get("group_id")); // 그룹아이디
			System.out.println(result.get("result_code")); // 결과코드
			System.out.println(result.get("result_message")); // 결과 메시지
			System.out.println(result.get("success_count")); // 메시지아이디
			System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수
		} else {
			// 메시지 보내기 실패
			System.out.println("실패");
			System.out.println(result.get("code")); // REST API 에러코드
			System.out.println(result.get("message")); // 에러메시지
		}

		return new GsonBuilder().create().toJson(a);
	}
	
	

	}
