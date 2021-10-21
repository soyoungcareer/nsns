package com.kh.spring.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.notice.model.dao.NoticeDao;
import com.kh.spring.notice.model.vo.Notice;
import com.kh.spring.notice.model.vo.PageInfo;

@Service
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

	@Override
	public Notice selectNBoard(int bno) {
		
		Notice n = null;
		int result = noticeDao.increaseCount(sqlSession, bno);
		
		if(result < 0) {
			throw new CommException("조회한 게시글이 존재하지 않습니다.");
		}else {
			n = noticeDao.selectNBoard(sqlSession, bno);
		}
		
		return n;
	}

	@Override
	public void insertNBoard(Notice n) {
		
		int result = noticeDao.insertNBoard(sqlSession, n);
		
		if(result < 0) {
			throw new CommException("게시글 등록이 실패하였습니다.");
		}
		
	}

	@Override
	public void updateNBoard(Notice n) {

		int result = noticeDao.updateNBoard(sqlSession, n);
		
		if(result < 0) {
			throw new CommException("공지사항 게시글 수정 중 오류가 발생하였습니다.");
		}
		
	}

	@Override
	public void deleteNBoard(int bno) {
		
		int result = noticeDao.deleteNBoard(sqlSession, bno);
		
		if(result < 0) {
			throw new CommException("해당 게시글을 삭제하는 도중 에러가 발생하였습니다.");
		}
	}

}
