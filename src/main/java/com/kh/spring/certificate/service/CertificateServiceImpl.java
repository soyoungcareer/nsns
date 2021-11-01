package com.kh.spring.certificate.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.certificate.dao.CertificateDao;
import com.kh.spring.certificate.vo.Certificate;
import com.kh.spring.certificate.vo.Graduation;
import com.kh.spring.certificate.vo.Volunteer;
import com.kh.spring.member.vo.Student;

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

	@Override
	public ArrayList<Volunteer> volunteerList(int stuId) {
		return certificateDao.volunteerList(sqlSession, stuId);
	}

	@Override
	public void certificateAdd(Certificate cer) {
		certificateDao.certificateAdd(sqlSession, cer);
	}

	@Override
	public void voluntterAdd(Volunteer vol) {
		certificateDao.voluntterAdd(sqlSession, vol);
	}

	@Override
	public void certificateDelete(int cerNo) {
		certificateDao.certificateDelete(sqlSession, cerNo);
	}

	@Override
	public void voluntterDelete(int volNo) {
		certificateDao.voluntterDelete(sqlSession, volNo);
	}

	@Override
	public Certificate certificateUpDetail(int cerNo) {
		return certificateDao.certificateUpDetail(sqlSession, cerNo);
	}

	@Override
	public Volunteer volunteerUpDetail(int volNo) {
		return certificateDao.volunteerUpDetail(sqlSession, volNo);
	}

	@Override
	public void certificateUpdate(Certificate cer) {
		certificateDao.certificateUpdate(sqlSession, cer);
	}

	@Override
	public void volunteerUpdate(Volunteer vol) {
		certificateDao.volunteerUpdate(sqlSession, vol);
		
	}

	@Override
	public Student studentDepartment(int stuId) {
		return certificateDao.studentDepartment(sqlSession, stuId);
	}
}
