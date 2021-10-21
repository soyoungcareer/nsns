package com.kh.spring.studentStatus.model.service;

import java.util.ArrayList;

import com.kh.spring.studentStatus.model.vo.StudentDo;
import com.kh.spring.studentStatus.model.vo.StudentOff;
import com.kh.spring.studentStatus.model.vo.StudentStatus;

public interface StudentStatusService {

	ArrayList<StudentStatus> studentProList();

	StudentOff studentOff(int appNo);
	
}
