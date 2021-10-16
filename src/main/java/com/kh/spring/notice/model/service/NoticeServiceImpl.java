package com.kh.spring.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.spring.notice.model.dao.NoticeDao;
import com.kh.spring.notice.model.vo.Notice;
import com.kh.spring.notice.model.vo.PageInfo;

public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Override
	public int selectNListCount() {
		
		return noticeDao.selectNListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectNList(PageInfo pi) {
		// TODO Auto-generated method stub
		return noticeDao.selectNList(sqlSession, pi);
	}

}
