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

	void modifySubject(Subject sub);

	void modifyRequestedSubject(RequestedSubject reqSub);

	void deleteSubject(Subject sub);

	void deleteRequestedSubject(RequestedSubject reqSub);

	int subAllListCount();

	ArrayList<Subject> subAllList(PageInfo pi);

	
}
