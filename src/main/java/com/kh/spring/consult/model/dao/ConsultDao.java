package com.kh.spring.consult.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.consult.model.vo.Consult;
import com.kh.spring.consult.model.vo.ConsultStatus;
import com.kh.spring.studentStatus.model.vo.StudentStatus;

@Repository
public class ConsultDao {

	public ArrayList<ConsultStatus> conProList(SqlSessionTemplate sqlSession, String userId) {
		
		return (ArrayList)sqlSession.selectList("consultMapper.conProList", userId);
	}

	public Consult selectConsult(SqlSessionTemplate sqlSession, int conNo) {
		
		return sqlSession.selectOne("consultMapper.selectConsult", conNo);
	}

	public int selectConsultCount(SqlSessionTemplate sqlSession, String stuId) {
		
		return sqlSession.selectOne("consultMapper.selectConsultCount", stuId);
	}

	public int insertConsult(SqlSessionTemplate sqlSession, Consult con) {
		
		return sqlSession.insert("consultMapper.insertConsult", con);
	}

	public int insertStsCon(SqlSessionTemplate sqlSession) {
		
		return sqlSession.insert("consultMapper.insertStsCon");
	}

}
