package com.kh.spring.studentSubject.model.service;

import java.util.ArrayList;

import com.kh.spring.acalendar.model.vo.Acalendar;
import com.kh.spring.common.PageInfo;
import com.kh.spring.studentSubject.model.vo.SearchCondition;
import com.kh.spring.studentSubject.model.vo.StuGradeAndCredit;
import com.kh.spring.studentSubject.model.vo.StudentSubject;

public interface StudentSubjectService {

	ArrayList<String> selectYear(int stuId);

	ArrayList<String> selectSemester(int stuId);

	ArrayList<StudentSubject> selectStuSubjectList(int stuId, PageInfo pi);

	ArrayList<StudentSubject> searchSubject(SearchCondition sc, PageInfo pi);

	int selectListCount(int stuId);

	int selectListCount(SearchCondition sc);

	ArrayList<StuGradeAndCredit> selectGradeList(int stuId);

}
