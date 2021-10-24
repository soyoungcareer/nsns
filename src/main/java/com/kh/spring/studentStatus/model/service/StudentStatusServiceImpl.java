package com.kh.spring.studentStatus.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.studentStatus.model.dao.StudentStatusDao;
import com.kh.spring.studentStatus.model.vo.StudentDo;
import com.kh.spring.studentStatus.model.vo.StudentOff;
import com.kh.spring.studentStatus.model.vo.StudentStatus;
@Service
public class StudentStatusServiceImpl implements StudentStatusService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private StudentStatusDao studentStatusDao;

	@Override
	public ArrayList<StudentStatus> studentProList(String userId) {
		
		ArrayList<StudentStatus> list = studentStatusDao.studentProList(sqlSession, userId);
				
		return list;
	}

	@Override
	public StudentOff selectStuOff(int appNo) {
	
		StudentOff stuOff = studentStatusDao.selectStuOff(sqlSession, appNo);
		
		return stuOff;
	}

	@Override
	public StudentDo selectStuDo(int appNo) {
		
		StudentDo stuDo = studentStatusDao.selectStuDo(sqlSession, appNo);
		
		return stuDo;
	}
	
	
	@Override
	public void insertStuOff(StudentOff stuOff) {
		
		int result1 = studentStatusDao.insertStuOff(sqlSession, stuOff);
		
		if(result1 < 0) {
			
			throw new CommException("휴학신청 실패");
			
		} else {
			
			int result2 = studentStatusDao.insertStsOff(sqlSession); //SEQ_APPLICATION_NO.CURRVAL으로 application_no를 넣어준다.
			
			if(result2 < 0) {
				
				throw new CommException("휴학신청 실패");
			}
			
		}
		
		
		
	}

	@Override
	public void insertStuDo(StudentDo stuDo) {
		int result1 = studentStatusDao.insertStuDo(sqlSession, stuDo);
		
		if(result1 < 0) {
			
			throw new CommException("자퇴신청 실패");
			
		} else {
			
			int result2 = studentStatusDao.insertStsDo(sqlSession); //SEQ_APPLICATION_NO.CURRVAL으로 application_no를 넣어준다.
			
			if(result2 < 0) {
				
				throw new CommException("자퇴신청 실패");
			}
			
		}
		
		
	}

	@Override
	public int selectOffCount(String stuId) {
		
		int count = studentStatusDao.selectOffCount(sqlSession, stuId);
		
		return count;
	}

	@Override
	public int selectDoCount(String stuId) {
		
		int count = studentStatusDao.selectDoCount(sqlSession, stuId);
		
		return count;
	}

	@Override
	public void deleteOff(int appNo) {
		
		int result1 = studentStatusDao.deleteOff(sqlSession, appNo);
		
		if(result1 < 0) {
			
			throw new CommException("휴학신청 취소 실패");
			
		} else {
			
			int result2 = studentStatusDao.deleteStsOff(sqlSession, appNo);
			
			if(result2 < 0) {
				throw new CommException("휴학신청 취소 실패");
			}
		}
		
	}

	@Override
	public void deleteDo(int appNo) {
		
		int result1 = studentStatusDao.deleteDo(sqlSession, appNo);
		
		if(result1 < 0) {
			
			throw new CommException("자퇴신청 취소 실패");
			
		} else {
			
			int result2 = studentStatusDao.deleteStsDo(sqlSession, appNo);
			
			if(result2 < 0) {
				throw new CommException("자퇴신청 취소 실패");
			}
		}
		
	}

	
	
	
}
