package com.kh.spring.member.service;

import com.kh.spring.member.vo.Student;

public interface StudentService {

	Student studentInfo(String stuId);

	void updateStu(Student student);

}
