package com.kh.spring.certificate.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.certificate.vo.Certificate;
import com.kh.spring.certificate.vo.Graduation;
import com.kh.spring.certificate.vo.Volunteer;

@Repository
public class CertificateDao {

	public Graduation gradeAbout(SqlSessionTemplate sqlSession, int stuId) {
		return sqlSession.selectOne("certificateMapper.gradeAbout", stuId);
	}

	public ArrayList<Certificate> certificateList(SqlSessionTemplate sqlSession, int stuId) {
		return (ArrayList)sqlSession.selectList("certificateMapper.certificateList", stuId);
	}

	public ArrayList<Volunteer> volunteerList(SqlSessionTemplate sqlSession, int stuId) {
		return  (ArrayList)sqlSession.selectList("certificateMapper.volunteerList", stuId);
	}

	public void certificateAdd(SqlSessionTemplate sqlSession, Certificate cer) {
		sqlSession.insert("certificateMapper.certificateAdd", cer);
	}

	public void voluntterAdd(SqlSessionTemplate sqlSession, Volunteer vol) {
		sqlSession.insert("certificateMapper.voluntterAdd", vol);
		
	}

	public void certificateDelete(SqlSessionTemplate sqlSession, int cerNo) {
		sqlSession.update("certificateMapper.certificateDelete", cerNo);		
	}

	public void voluntterDelete(SqlSessionTemplate sqlSession, int volNo) {
		sqlSession.update("certificateMapper.voluntterDelete", volNo);		
		
	}

	public Certificate certificateUpDetail(SqlSessionTemplate sqlSession, int cerNo) {
		return sqlSession.selectOne("certificateMapper.certificateUpDetail", cerNo);
	}

	public Volunteer volunteerUpDetail(SqlSessionTemplate sqlSession, int volNo) {
		return sqlSession.selectOne("certificateMapper.volunteerUpDetail", volNo);
	}


}
