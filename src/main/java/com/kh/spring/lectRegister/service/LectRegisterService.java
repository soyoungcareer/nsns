package com.kh.spring.lectRegister.service;

import java.util.ArrayList;

import com.kh.spring.lectRegister.vo.LecRegPro;
import com.kh.spring.lectRegister.vo.LectRegister;
import com.kh.spring.lectRegister.vo.SearchReg;
import com.kh.spring.major.vo.Department;
import com.kh.spring.major.vo.Subject;
import com.kh.spring.notice.vo.PageInfo;

public interface LectRegisterService {

	int lectReListCount();

	ArrayList<LecRegPro> lectReList(PageInfo pi);

	ArrayList<Department> departList();

	ArrayList<LecRegPro> selectRegisterList(int stuId);

	LecRegPro lectReDetail(int subCode);

	int regiInsert(String subCode, int stuId);

	int registerDelete(String subCode, int stuId);

	int searchListCount(SearchReg sr);

	ArrayList<LecRegPro> searchLectReList(SearchReg sr, PageInfo pi);

}
