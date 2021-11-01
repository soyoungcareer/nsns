package com.kh.spring.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.GsonBuilder;
import com.kh.spring.board.Service.boardService;
import com.kh.spring.board.vo.Board;
import com.kh.spring.common.PageInfo;
import com.kh.spring.common.Pagination;
import com.kh.spring.facility.model.vo.searchFac;
import com.kh.spring.member.vo.Student;

@Controller
public class BoardController {

	@Autowired
	private boardService bs;

	@RequestMapping("board.me")
	public String boardMove() {

		return "board/portfolio-details";

	}

	@RequestMapping("boardMoves.me")
	public String mobardMoves() {

		return "board/portfolio-details";

	}

	@RequestMapping("boardMovesss.me")
	public String boardMovesss(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, Model model) {

		int listCount = bs.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);

		ArrayList<Board> list = bs.selectList(pi);
		System.out.println(list);

		model.addAttribute("list", list);
		model.addAttribute("pi", pi);

		return "board/portfolio-board";

	}

	@RequestMapping("boardMovess.me")
	public String boardMovess(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, Model model,
			HttpSession session) {

		searchFac sf = new searchFac();
		Student st = (Student) session.getAttribute("loginStu");
		int id = st.getStuId();

		int listCount = bs.selectMyListCount(id);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);

		ArrayList<Board> list = bs.selectMyList(pi, id);
		System.out.println(list);

		model.addAttribute("list", list);
		model.addAttribute("pi", pi);

		return "board/portfolio-myboard";

	}

	@RequestMapping("boardplPage.me")
	public String boardplPage() {

		return "board/portfolio-plPage";

	}

	@RequestMapping("boardplus.me")
	public String boardplus(@RequestParam(value = "title") String title,
			@RequestParam(value = "content") String content, HttpSession session) {

		searchFac sf = new searchFac();
		Student st = (Student) session.getAttribute("loginStu");
		int id = st.getStuId();

		sf.setCate3(title);
		sf.setCate4(content);
		sf.setCate2(id);

		bs.boardplus(sf);

		return "redirect:boardMovesss.me";

	}

	@RequestMapping("boarddetail.me")
	public String boarddetailPage(@RequestParam(value = "no") int no, Model model) {

		System.out.println("나의나의나의나");

		Board b = bs.boarddetailPage(no);

		System.out.println(b);
		model.addAttribute("b", b);

		return "board/portfolio-detailPage";

	}

	@ResponseBody
	@RequestMapping("boardlike.me")
	public String boardLike(HttpSession session, @RequestParam(value = "no") int no) {

		searchFac sf = new searchFac();
		Student st = (Student) session.getAttribute("loginStu");
		int id = st.getStuId();

		sf.setCate2(no);
		sf.setCate5(id);

		String msg = "";
		int a = bs.boardLike(sf);

		if (a == 1) {
			msg = "LIKE !!!!";
		} else {
			msg = "FOREVER LIKE!!!!";
		}

		return new GsonBuilder().create().toJson(msg);

	}

	@ResponseBody
	@RequestMapping("boardLikeCount.me")
	public String boardLikeCount(@RequestParam(value = "no") int no) {

		System.out.println("카카카카카카" + no);
		int lno = bs.boardLkeCount(no);

		return new GsonBuilder().create().toJson(lno);

	}

	@RequestMapping("boarddetailtwo.me")
	public String boarddetailPagetwo(@RequestParam(value = "no") int no, Model model) {

		System.out.println("나의나의나의나");

		Board b = bs.boarddetailPage(no);

		System.out.println(b);
		model.addAttribute("b", b);

		return "board/portfolio-detailPagetwo";

	}

	@RequestMapping("boardupdate.me")
	public String boardupdate(@RequestParam(value = "no") int no,@RequestParam(value = "title") String title,
			@RequestParam(value = "content") String content, HttpSession session) {

		searchFac sf = new searchFac();
		Student st = (Student) session.getAttribute("loginStu");
		int id = st.getStuId();

		sf.setCate3(title);
		sf.setCate4(content);
		sf.setCate2(no);

		bs.boardupdate(sf);

		return "redirect:boardMovess.me";

	}

	@RequestMapping("boarddel.me")
	public String mobarddel(@RequestParam(value = "no") int no) {
		
		bs.boarddel(no);

		return "redirect:boardMovess.me";

	}
}