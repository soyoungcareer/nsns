package com.kh.spring.board.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.board.vo.Board;
import com.kh.spring.board.vo.BoardLike;
import com.kh.spring.common.PageInfo;
import com.kh.spring.facility.model.vo.searchFac;

@Repository
public class boardDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.selectListCount");
	}

	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList) sqlSession.selectList("boardMapper.selectList", null, rowBounds);
	}

	public void boardplus(SqlSessionTemplate sqlSession, searchFac sf) {
		// TODO Auto-generated method stub
		sqlSession.insert("boardMapper.boardplus", sf);
	}

	public Board boarddetailPage(SqlSessionTemplate sqlSession, int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.boarddetailPage", no);
	}

	public void boardCount(SqlSessionTemplate sqlSession, int no) {
		// TODO Auto-generated method stub
		sqlSession.update("boardMapper.boardCount", no);
	}

	public int boardLike(SqlSessionTemplate sqlSession, searchFac sf) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardMapper.boardLike", sf);
	}

	public int boardLikeName(SqlSessionTemplate sqlSession, searchFac sf) {
		// TODO Auto-generated method stub
		return sqlSession.insert("boardMapper.boardLikeName", sf);
	}

	public int boardLkeCount(SqlSessionTemplate sqlSession, int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.boardLkeCount", no);
	}

	public BoardLike boardbLike(SqlSessionTemplate sqlSession, searchFac sf) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.boardCheck", sf);
	}

	public ArrayList<Board> selectMyList(SqlSessionTemplate sqlSession, PageInfo pi, int id) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
	
		System.out.println("DAO");
		return (ArrayList) sqlSession.selectList("boardMapper.selectMyList", id, rowBounds);
	}

	public int selectMyListCount(SqlSessionTemplate sqlSession, int id) {
		// TODO Auto-generated method stub
		System.out.println(id);
		return sqlSession.selectOne("boardMapper.selecMyListCount",id);
	}

	public void boardupdate(SqlSessionTemplate sqlSession, searchFac sf) {
		// TODO Auto-generated method stub
		sqlSession.update("boardMapper.boardupdate", sf);

	}

	public void boarddel(SqlSessionTemplate sqlSession, int no) {
		// TODO Auto-generated method stub
		sqlSession.delete("boardMapper.boarddel", no);

	}

}
