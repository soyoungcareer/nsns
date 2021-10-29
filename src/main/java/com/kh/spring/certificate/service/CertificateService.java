package com.kh.spring.certificate.service;

import java.util.ArrayList;

import com.kh.spring.certificate.vo.Certificate;
import com.kh.spring.certificate.vo.Graduation;
import com.kh.spring.certificate.vo.Volunteer;

public interface CertificateService {

	Graduation gradeAbout(int stuId);

	ArrayList<Certificate> certificateList(int stuId);

	ArrayList<Volunteer> volunteerList(int stuId);

	void certificateAdd(Certificate cer);

	void voluntterAdd(Volunteer vol);

	void certificateDelete(int cerNo);

	void voluntterDelete(int volNo);

	Certificate certificateUpDetail(int cerNo);

	Volunteer volunteerUpDetail(int volNo);

}
