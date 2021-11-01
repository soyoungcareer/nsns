package com.kh.spring.certificate.service;

import java.util.ArrayList;

import com.kh.spring.certificate.vo.Certificate;
import com.kh.spring.certificate.vo.Graduation;
import com.kh.spring.certificate.vo.Volunteer;
import com.kh.spring.member.vo.Student;

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

	void certificateUpdate(Certificate cer);

	void volunteerUpdate(Volunteer vol);

	Student studentDepartment(int stuId);

}
