package com.kh.spring.lectRegister.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.PageInfo;
import com.kh.spring.lectRegister.dao.LectRegisterDao;
import com.kh.spring.lectRegister.vo.LecRegPro;
import com.kh.spring.lectRegister.vo.LectRegister;
import com.kh.spring.lectRegister.vo.SearchReg;
import com.kh.spring.major.vo.Department;



@Service
public class LectRegisterServiceImpl implements LectRegisterService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private LectRegisterDao lectRegisterDao;
	
	@Override
	public int lectReListCount() {
		return lectRegisterDao.lectReListCount(sqlSession);
	}

	@Override
	public ArrayList<LecRegPro> lectReList(PageInfo pi) {
		return lectRegisterDao.lectReList(sqlSession, pi);
	}

	@Override
	public ArrayList<Department> departList() {
		return lectRegisterDao.departList(sqlSession);
	}

	@Override
	public ArrayList<LecRegPro> selectRegisterList(int stuId) {
		return lectRegisterDao.selectRegisterList(sqlSession, stuId);
	}

	@Override
	public LecRegPro lectReDetail(String subCode) {
		return lectRegisterDao.lectReDetail(sqlSession, subCode);
	}

	@Override
	public int regiInsert(String subCode, int stuId) {
		LectRegister re = new LectRegister();
		re.setStuId(stuId);
		re.setSubCode(subCode);
		
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy");
		Date date = new Date ( );
		String year = format.format (date);
		int neyear = Integer.parseInt(year);
		re.setYear(neyear);
		
		SimpleDateFormat format2 = new SimpleDateFormat ( "MM");
		Date date2 = new Date ( );
		String mon = format2.format (date2);
		int nemon = Integer.parseInt(mon);
		if(nemon<9&&nemon>2) {
			re.setSemester(1);
		}else {
			re.setSemester(2);
		}
		int result= lectRegisterDao.regiInsert(sqlSession,re);// 등록
		
		return result;
	}

	@Override
	public int registerDelete(String subCode, int stuId) {
		LectRegister re = new LectRegister();
		re.setStuId(stuId);
		re.setSubCode(subCode);
		
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy");
		Date date = new Date ( );
		String year = format.format (date);
		int neyear = Integer.parseInt(year);
		re.setYear(neyear);
		
		SimpleDateFormat format2 = new SimpleDateFormat ( "MM");
		Date date2 = new Date ( );
		String mon = format2.format (date2);
		int nemon = Integer.parseInt(mon);
		if(nemon<9&&nemon>2) {
			re.setSemester(1);
		}else {
			re.setSemester(2);
		}
		int result= lectRegisterDao.registerDelete(sqlSession,re);// 삭제
		
		return result;
	}

	@Override
	public int searchListCount(SearchReg sr) {
		return lectRegisterDao.searchListCount(sqlSession, sr);
	}

	@Override
	public ArrayList<LecRegPro> searchLectReList(SearchReg sr, PageInfo pi) {
		return lectRegisterDao.searchLectReList(sqlSession, sr, pi);
	}

	@Override
	public LectRegister checkRegister(int stuId, String subCode) {
		LectRegister re = new LectRegister();
		re.setStuId(stuId);
		re.setSubCode(subCode);
		
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy");
		Date date = new Date ( );
		String year = format.format (date);
		int neyear = Integer.parseInt(year);
		re.setYear(neyear);
		
		SimpleDateFormat format2 = new SimpleDateFormat ( "MM");
		Date date2 = new Date ( );
		String mon = format2.format (date2);
		int nemon = Integer.parseInt(mon);
		if(nemon<9&&nemon>2) {
			re.setSemester(1);
		}else {
			re.setSemester(2);
		}
		return lectRegisterDao.checkRegister(sqlSession, re);
	}

	@Override
	public int checkCredit(int stuId) {
		LectRegister re = new LectRegister();
		re.setStuId(stuId);
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy");
		Date date = new Date ( );
		String year = format.format (date);
		int neyear = Integer.parseInt(year);
		re.setYear(neyear);
		
		SimpleDateFormat format2 = new SimpleDateFormat ( "MM");
		Date date2 = new Date ( );
		String mon = format2.format (date2);
		int nemon = Integer.parseInt(mon);
		if(nemon<9&&nemon>2) {
			re.setSemester(1);
		}else {
			re.setSemester(2);
		}
		return lectRegisterDao.checkCredit(sqlSession, re);
	}

	@Override
	public ArrayList<LecRegPro> selectRegiCartsterList(int stuId) {
		return lectRegisterDao.selectRegiCartsterList(sqlSession, stuId);
	}

	@Override
	public int regiInsertCart(String subCode, int stuId) {
		LectRegister re = new LectRegister();
		re.setStuId(stuId);
		re.setSubCode(subCode);
		
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy");
		Date date = new Date ( );
		String year = format.format (date);
		int neyear = Integer.parseInt(year);
		re.setYear(neyear);
		
		SimpleDateFormat format2 = new SimpleDateFormat ( "MM");
		Date date2 = new Date ( );
		String mon = format2.format (date2);
		int nemon = Integer.parseInt(mon);
		if(nemon<9&&nemon>2) {
			re.setSemester(1);
		}else {
			re.setSemester(2);
		}
		int result= lectRegisterDao.regiInsertCart(sqlSession,re);// 등록
		
		return result;
	}

	@Override
	public LectRegister checkRegisterCart(int stuId, String subCode) {
		LectRegister re = new LectRegister();
		re.setStuId(stuId);
		re.setSubCode(subCode);
		
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy");
		Date date = new Date ( );
		String year = format.format (date);
		int neyear = Integer.parseInt(year);
		re.setYear(neyear);
		
		SimpleDateFormat format2 = new SimpleDateFormat ( "MM");
		Date date2 = new Date ( );
		String mon = format2.format (date2);
		int nemon = Integer.parseInt(mon);
		if(nemon<9&&nemon>2) {
			re.setSemester(1);
		}else {
			re.setSemester(2);
		}
		return lectRegisterDao.checkRegisterCart(sqlSession, re);
	}

	@Override
	public int registerDeleteCart(String subCode, int stuId) {
		LectRegister re = new LectRegister();
		re.setStuId(stuId);
		re.setSubCode(subCode);
		
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy");
		Date date = new Date ( );
		String year = format.format (date);
		int neyear = Integer.parseInt(year);
		re.setYear(neyear);
		
		SimpleDateFormat format2 = new SimpleDateFormat ( "MM");
		Date date2 = new Date ( );
		String mon = format2.format (date2);
		int nemon = Integer.parseInt(mon);
		if(nemon<9&&nemon>2) {
			re.setSemester(1);
		}else {
			re.setSemester(2);
		}
		int result= lectRegisterDao.registerDeleteCart(sqlSession,re);// 장바구니삭제
		
		return result;
	}

}
