package com.kh.spring.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.common.PageInfo;
import com.kh.spring.notice.model.vo.Notice;

@Repository
public class NoticeDao {

	public int selectNListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("adminMapper.selectNListCount");
	}

	public ArrayList<Notice> selectNList(SqlSessionTemplate sqlSession, PageInfo pi) {

		int offset = (pi.getCurrentPage() -1)* pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectNList", null, rowBounds);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminMapper.increaseCount", bno);
	}

	public Notice selectNBoard(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.selectNBoard", bno);
	}

	public int insertNBoard(SqlSessionTemplate sqlSession, Notice n) {
		// TODO Auto-generated method stub
		return sqlSession.insert("adminMapper.insertNBoard", n);
	}

	public int updateNBoard(SqlSessionTemplate sqlSession, Notice n) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminMapper.updateNBoard", n);
	}

	public int deleteNBoard(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminMapper.deleteNBoard", bno);
	}

}
