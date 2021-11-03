package com.kh.spring.major.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.PageInfo;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.major.model.dao.SubjectDao;
import com.kh.spring.major.vo.RequestedSubject;
import com.kh.spring.major.vo.Subject;

@Service
public class SubjectServiceImpl implements SubjectService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private SubjectDao subjectDao;

	@Override
	public int subjectModifyListCount() {
		// TODO Auto-generated method stub
		return subjectDao.subjectModifyListCount(sqlSession);
	}

	@Override
	public ArrayList<RequestedSubject> subjectModifyList(PageInfo pi) {
		// TODO Auto-generated method stub
		return subjectDao.subjectModifyList(sqlSession, pi);
	}

	@Override
	public RequestedSubject selectSubjectModify(int sno) {
		
		RequestedSubject reqSub = null;
		
		reqSub = subjectDao.selectSubjectModify(sqlSession, sno);
		
		return reqSub;
	}
	
	@Override
	public void createSubject(Subject sub) {
		
		int result = subjectDao.createSubject(sqlSession, sub);
		
		if(result < 0) {
			throw new CommException("과목 등록 중 오류 발생");
		}
	}

	@Override
	public void createRequestSubject(RequestedSubject reqSub) {
		
		//System.out.println("==========impl reqSub : " + reqSub);

		int result = subjectDao.createRequestSubject(sqlSession, reqSub);
		
		if(result < 0) {
			throw new CommException("과목 등록 중 오류 발생");
		}
		
	}

	@Override
	public void modifySubject(Subject sub) {
		
		int result = subjectDao.modifySubject(sqlSession, sub);
		
		if(result < 0) {
			throw new CommException("과목 수정 중 오류 발생");
		}
		
	}

	@Override
	public void modifyRequestedSubject(RequestedSubject reqSub) {
		
		System.out.println("==========modify impl reqSub : " + reqSub);
		
		int result = subjectDao.modifyRequestedSubject(sqlSession, reqSub);
		
		if(result < 0) {
			throw new CommException("과목 등록 중 오류 발생");
		}
		
	}

	@Override
	public void deleteSubject(Subject sub) {
		
		int result = subjectDao.deleteSubject(sqlSession, sub);
		
		if(result < 0) {
			throw new CommException("과목 삭제 중 오류 발생");
		}
		
	}

	@Override
	public void deleteRequestedSubject(RequestedSubject reqSub) {
		
		System.out.println("==========delete impl reqSub : " + reqSub);
		
		int result = subjectDao.deleteRequestedSubject(sqlSession, reqSub);
		
		if(result < 0) {
			throw new CommException("과목 삭제 중 오류 발생");
		}
		
	}

	@Override
	public int subAllListCount() {
		
		return subjectDao.subAllListCount(sqlSession);
	}

	@Override
	public ArrayList<Subject> subAllList(PageInfo pi) {
		// TODO Auto-generated method stub
		return subjectDao.subAllList(sqlSession, pi);
	}

}
