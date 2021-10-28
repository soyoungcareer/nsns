package com.kh.spring.lectRegister.service;

import java.util.ArrayList;

import com.kh.spring.common.PageInfo;
import com.kh.spring.lectRegister.vo.Attachment;
import com.kh.spring.lectRegister.vo.LecRegPro;
import com.kh.spring.lectRegister.vo.LectRegister;
import com.kh.spring.lectRegister.vo.SearchReg;
import com.kh.spring.major.vo.Department;
import com.kh.spring.major.vo.Subject;
import com.kh.spring.member.vo.Professor;


public interface LectRegisterService {

	int lectReListCount();

	ArrayList<LecRegPro> lectReList(PageInfo pi);

	ArrayList<Department> departList();

	ArrayList<LecRegPro> selectRegisterList(int stuId);

	LecRegPro lectReDetail(String subCode);

	int regiInsert(String subCode, int stuId);

	int registerDelete(String subCode, int stuId);

	int searchListCount(SearchReg sr);

	ArrayList<LecRegPro> searchLectReList(SearchReg sr, PageInfo pi);

	LectRegister checkRegister(int stuId, String subCode);

	Integer checkCredit(int stuId);

	ArrayList<LecRegPro> selectRegiCartsterList(int stuId);

	int regiInsertCart(String subCode, int stuId);

	LectRegister checkRegisterCart(int stuId, String subCode);

	int registerDeleteCart(String subCode, int stuId);

	ArrayList<LecRegPro> timeBoardList(int stuId);

	ArrayList<Professor> proList();

	int checkDate(ArrayList<LecRegPro> arlist, String subCode);

	int deleteAttachment(String subCode);

	void lectDeleteAdmin(String subCode);

	void lectUpdateAdmin(Subject subject, String day, int start, int end);



}
