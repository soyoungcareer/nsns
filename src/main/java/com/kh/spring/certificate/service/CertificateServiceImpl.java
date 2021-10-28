package com.kh.spring.certificate.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.certificate.dao.CertificateDao;
import com.kh.spring.certificate.vo.Certificate;
import com.kh.spring.certificate.vo.Graduation;

@Service
public class CertificateServiceImpl implements CertificateService {


	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CertificateDao certificateDao;

	@Override
	public Graduation gradeAbout(int stuId) {
		return certificateDao.gradeAbout(sqlSession, stuId);
	}

	@Override
	public ArrayList<Certificate> certificateList(int stuId) {
		return certificateDao.certificateList(sqlSession, stuId);
	}
}
