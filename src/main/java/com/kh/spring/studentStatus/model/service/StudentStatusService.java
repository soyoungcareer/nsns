package com.kh.spring.studentStatus.model.service;

import java.util.ArrayList;

import com.kh.spring.studentStatus.model.vo.StudentDo;
import com.kh.spring.studentStatus.model.vo.StudentOff;
import com.kh.spring.studentStatus.model.vo.StudentStatus;

public interface StudentStatusService {

	ArrayList<StudentStatus> studentProList(String userId);

	StudentOff selectStuOff(int appNo);

	void insertStuOff(StudentOff stuOff);

	void insertStuDo(StudentDo stuDo);

	StudentDo selectStuDo(int appNo);

	int selectOffCount(String stuId);

	int selectDoCount(String stuId);

	void deleteOff(int appNo);

	void deleteDo(int appNo);
	
}
