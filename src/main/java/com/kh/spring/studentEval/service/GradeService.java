package com.kh.spring.studentEval.service;

import java.util.ArrayList;

import com.kh.spring.gradeObject.vo.GradeObject;
import com.kh.spring.major.vo.Subject;
import com.kh.spring.studentEval.vo.Grade;

public interface GradeService {

	ArrayList<Subject> loadSubList(String profId, int gradeYear, int gradeSemester);
	
	ArrayList<Grade> selectList(String subCode, int gradeYear, int gradeSemester);

	ArrayList<GradeObject> loadObjList(String profId);

}
