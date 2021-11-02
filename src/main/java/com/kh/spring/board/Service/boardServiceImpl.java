package com.kh.spring.board.Service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.board.dao.boardDao;
import com.kh.spring.board.vo.Board;
import com.kh.spring.board.vo.BoardLike;
import com.kh.spring.common.PageInfo;
import com.kh.spring.facility.model.vo.searchFac;

@Service
public class boardServiceImpl implements boardService {

	@Autowired
	private boardDao bvd;

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return bvd.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return bvd.selectList(sqlSession, pi);
	}

	@Override
	public void boardplus(searchFac sf) {
		// TODO Auto-generated method stub
		bvd.boardplus(sqlSession, sf);
	}

	@Override
	public Board boarddetailPage(int no) {
		// TODO Auto-generated method stub
		Board b = bvd.boarddetailPage(sqlSession, no);

		if (b != null) {
			bvd.boardCount(sqlSession, no);
		}

		return b;
	}

	@Override
	public int boardLike(searchFac sf) {
		// TODO Auto-generated method stub

		BoardLike blike = bvd.boardbLike(sqlSession, sf);
		System.out.println("@#!@#!@#!");
	
		if (blike != null) {
			if (blike.getStuId() == sf.getCate5()) {
				if (blike.getBno() == sf.getCate2()) {

					return 2;
				}
			}
		} else {
			int result2 = bvd.boardLikeName(sqlSession, sf);
			if (result2 > 0) {
				int result = bvd.boardLike(sqlSession, sf);

				return 1;
			}
		}

		return 2;
	}

	@Override
	public int boardLkeCount(int no) {
		// TODO Auto-generated method stub

		return bvd.boardLkeCount(sqlSession, no);

	}

	@Override
	public ArrayList<Board> selectMyList(PageInfo pi, int id) {
		// TODO Auto-generated method stub
		return bvd.selectMyList(sqlSession, pi, id);
	}

	@Override
	public int selectMyListCount(int id) {
		// TODO Auto-generated method stub
		return bvd.selectMyListCount(sqlSession, id);
	}

	@Override
	public void boardupdate(searchFac sf) {
		// TODO Auto-generated method stub
		bvd.boardupdate(sqlSession, sf);

	}

	@Override
	public void boarddel(int no) {
		// TODO Auto-generated method stub
		bvd.boarddel(sqlSession, no);
	}

	@Override
	public ArrayList<Board> boardlikeranking() {
		// TODO Auto-generated method stub
		return bvd.boardlikeranking(sqlSession);
	}

	@Override
	public ArrayList<Board> boardiseeranking() {
		// TODO Auto-generated method stub
		return bvd.boardiseeranking(sqlSession);
	}



}
