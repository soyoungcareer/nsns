package com.kh.spring.major.model.service;

import java.util.ArrayList;

import com.kh.spring.common.PageInfo;
import com.kh.spring.major.vo.RequestedSubject;
import com.kh.spring.major.vo.Subject;

public interface SubjectService {

	int subjectModifyListCount();

	ArrayList<RequestedSubject> subjectModifyList(PageInfo pi);

	RequestedSubject selectSubjectModify(int sno);
	
	void createSubject(Subject sub);

	void createRequestSubject(RequestedSubject reqSub);

	
}
