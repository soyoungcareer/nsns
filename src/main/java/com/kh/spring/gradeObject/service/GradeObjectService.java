package com.kh.spring.gradeObject.service;

import java.util.ArrayList;

import com.kh.spring.lectRegister.vo.LecRegPro;

public interface GradeObjectService {

	LecRegPro gradeDetailList(int stuId, String subCode, String date);

	void insertGradeObj(LecRegPro detail, String title, String content);

	ArrayList<LecRegPro> gradeObjectList(int stuId);

	LecRegPro gradeObjectDetailPage(int stuId, String subCode, String date);



}
