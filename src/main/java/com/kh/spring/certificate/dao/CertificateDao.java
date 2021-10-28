package com.kh.spring.certificate.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.certificate.vo.Certificate;
import com.kh.spring.certificate.vo.Graduation;

@Repository
public class CertificateDao {

	public Graduation gradeAbout(SqlSessionTemplate sqlSession, int stuId) {
		return sqlSession.selectOne("certificateMapper.gradeAbout", stuId);
	}

	public ArrayList<Certificate> certificateList(SqlSessionTemplate sqlSession, int stuId) {
		return (ArrayList)sqlSession.selectOne("certificateMapper.certificateList", stuId);
	}

}
