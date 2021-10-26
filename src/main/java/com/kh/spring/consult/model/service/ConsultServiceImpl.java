package com.kh.spring.consult.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.consult.model.dao.ConsultDao;
import com.kh.spring.consult.model.vo.Consult;
import com.kh.spring.consult.model.vo.ConsultStatus;

@Service
public class ConsultServiceImpl implements ConsultService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ConsultDao consultDao;

	@Override
	public ArrayList<ConsultStatus> conProList(String userId) {
		
		ArrayList<ConsultStatus> list = consultDao.conProList(sqlSession, userId);
		
		return list;
	}

	@Override
	public Consult selectConsult(int conNo) {
		
		Consult con = consultDao.selectConsult(sqlSession, conNo);
		
		return con;
	}

	@Override
	public int selectConsultCount(String stuId) {
		
		int count = consultDao.selectConsultCount(sqlSession, stuId);
		
		return count;
	}

	@Override
	public void insertConsult(Consult con) {
		
		int result1 = consultDao.insertConsult(sqlSession, con);
		
		if(result1 < 0) {
			
			throw new CommException("상담신청 실패");
			
		}	else {
			
			int result2 = consultDao.insertStsCon(sqlSession); 
			
			if(result2 < 0) {
				
				throw new CommException("상담신청 실패");
			}
		
		}
	}

	@Override
	public void deleteCon(int conNo) {
		
		int result1 = consultDao.deleteCon(sqlSession, conNo);
		
		if(result1 < 0) {
			
			throw new CommException("상담신청 취소 실패");
			
		} else {
			
			int result2 = consultDao.deleteStsCon(sqlSession, conNo);
			
			if(result2 < 0) {
				throw new CommException("상담신청 취소 실패");
			}
		}
		
		
	}


}
