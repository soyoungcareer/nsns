package com.kh.spring.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.spring.notice.model.vo.Notice;
import com.kh.spring.notice.model.vo.PageInfo;

public class NoticeDao {

	public int selectNListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.selectNListCount");
	}

	public ArrayList<Notice> selectNList(SqlSessionTemplate sqlSession, PageInfo pi) {

		int offset = (pi.getCurrentPage() -1)* pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectNList", null, rowBounds);
	}

}
