package com.kh.spring.studentEval.service;

import java.util.ArrayList;

import com.kh.spring.common.PageInfo;
import com.kh.spring.gradeObject.vo.GradeObject;
import com.kh.spring.major.vo.Subject;
import com.kh.spring.studentEval.vo.Grade;
import com.kh.spring.studentEval.vo.SearchGrade;
import com.kh.spring.studentEval.vo.SearchSubject;

public interface GradeService {

	ArrayList<Subject> loadSubList(String profId, int gradeYear, int gradeSemester);
	
	ArrayList<Grade> selectList(String subCode, int gradeYear, int gradeSemester);

	ArrayList<GradeObject> loadObjList(String profId);

	int selectSubListCount(SearchSubject searchSubject);

	ArrayList<Subject> selectFilteredSubList(SearchSubject searchSubject, PageInfo pi);

	//ArrayList<Grade> selectFilteredGrade(String subCode, int subYear, int subSmst);

	ArrayList<Grade> selectFilteredGrade(SearchGrade searchGrade);


}
