package com.kh.spring.certificate.service;

import java.util.ArrayList;

import com.kh.spring.certificate.vo.Certificate;
import com.kh.spring.certificate.vo.Graduation;

public interface CertificateService {

	Graduation gradeAbout(int stuId);

	ArrayList<Certificate> certificateList(int stuId);

}
