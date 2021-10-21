package com.kh.spring.member.service;

import java.util.ArrayList;

import com.kh.spring.major.vo.Subject;

public interface ProfService {

	int profLectListCount();

	ArrayList<Subject> selectSubList(String profId);

}
