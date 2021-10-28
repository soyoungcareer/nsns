package com.kh.spring.lecture.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.facility.model.vo.searchFac;
import com.kh.spring.lecture.model.dao.LecDao;
import com.kh.spring.lecture.model.vo.Reply;
import com.kh.spring.lecture.model.vo.lecture;
import com.kh.spring.lecture.model.vo.lectureList;

@Service
public class LecServiceImpl implements LecService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private LecDao ld;

	@Override
	public ArrayList<lecture> selectList(int id) {
		// TODO Auto-generated method stub
		
		
		return ld.selectList(sqlSession,id);
	}

	@Override
	public ArrayList<lectureList> lecPageSub(int no) {
		// TODO Auto-generated method stub
		return ld.lecPageSub(sqlSession, no);
	}

	@Override
	public lectureList lecPageFinal(int no) {
		// TODO Auto-generated method stub
		return ld.lecPageFinal(sqlSession,no);
	}

	@Override
	public void lecinsert(lectureList l) {
		
		ld.lecinsert(sqlSession, l);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int bno) {
		// TODO Auto-generated method stub
		return ld.selectReplyList(sqlSession,bno);
	}

	@Override
	public int insertReply(Reply r) {
		int result = ld.insertReply(sqlSession, r);

		if (result < 0) {
			throw new CommException("�Խñ� ������Ʈ ����");

		}
		return result;
	}

	@Override
	public void insertTime(searchFac sf) {

		int result = ld.insertTime(sqlSession, sf);
	}


	

}
