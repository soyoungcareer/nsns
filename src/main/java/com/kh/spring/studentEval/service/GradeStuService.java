package com.kh.spring.studentEval.service;

import java.util.ArrayList;

import com.kh.spring.gradeObject.vo.GradeObject;
import com.kh.spring.lectRegister.vo.LecRegPro;
import com.kh.spring.lectRegister.vo.LectRegister;
import com.kh.spring.lectRegister.vo.SearchReg;
import com.kh.spring.studentEval.vo.CountCredit;

public interface GradeStuService {

	ArrayList<LecRegPro> selectGradeList(int stuId);

	CountCredit cCredit(int stuId);

	ArrayList<LecRegPro> selectGradeSearchList(SearchReg sr);

	CountCredit cSearchCredit(SearchReg sr);

	ArrayList<LectRegister> selectReYearList(int stuId);

	ArrayList<LectRegister> selectReSemeList(int stuId);

	LecRegPro gradeDetailList(int stuId, String subCode, String date);

	ArrayList<GradeObject> objectList(int stuId);


}
