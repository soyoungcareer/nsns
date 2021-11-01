package com.kh.spring.board.Service;

import java.util.ArrayList;

import com.kh.spring.board.vo.Board;
import com.kh.spring.common.PageInfo;
import com.kh.spring.facility.model.vo.searchFac;

public interface boardService {

	int selectListCount();

	ArrayList<Board> selectList(PageInfo pi);

	void boardplus(searchFac sf);

	Board boarddetailPage(int no);

	int boardLike(searchFac sf);

	int boardLkeCount(int no);

	ArrayList<Board> selectMyList(PageInfo pi, int id);

	int selectMyListCount(int id);

	void boardupdate(searchFac sf);

	void boarddel(int no);




}
