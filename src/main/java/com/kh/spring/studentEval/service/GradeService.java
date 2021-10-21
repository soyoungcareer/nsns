package com.kh.spring.studentEval.service;

import java.util.ArrayList;

import com.kh.spring.notice.vo.PageInfo;
import com.kh.spring.studentEval.vo.Grade;

public interface GradeService {

	int selectListCount();

	ArrayList<Grade> selectList(PageInfo pi, String subCode, int gradeYear, int gradeSemester);

	Grade selectGrade(int gno);
 
}
