package com.kh.spring.lectRegister.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.PageInfo;
import com.kh.spring.lectRegister.dao.LectRegisterDao;
import com.kh.spring.lectRegister.vo.Attachment;
import com.kh.spring.lectRegister.vo.LecRegPro;
import com.kh.spring.lectRegister.vo.LectRegister;
import com.kh.spring.lectRegister.vo.SearchReg;
import com.kh.spring.major.vo.Department;
import com.kh.spring.major.vo.Subject;
import com.kh.spring.member.vo.Professor;



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
		return lectRegisterDao.selectRegisterList(sqlSession, re);
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
		int result= lectRegisterDao.regiInsert(sqlSession,re);// ??????
		lectRegisterDao.InsertCredit(sqlSession,re);// ?????? ?????? ??????
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
		lectRegisterDao.deleteCredit(sqlSession,re);// ?????? ?????? ??????
		int result= lectRegisterDao.registerDelete(sqlSession,re);// ??????
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
	public Integer checkCredit(int stuId) {
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
		return lectRegisterDao.selectRegiCartsterList(sqlSession, re);
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
		int result= lectRegisterDao.regiInsertCart(sqlSession,re);// ??????
		
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
		int result= lectRegisterDao.registerDeleteCart(sqlSession,re);// ??????????????????
		
		return result;
	}

	@Override
	public ArrayList<LecRegPro> timeBoardList(int stuId) {
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
		return lectRegisterDao.timeBoardList(sqlSession, re);
	}

	@Override
	public ArrayList<Professor> proList() {
		return lectRegisterDao.proList(sqlSession);
	}

	@Override
	public int checkDate(ArrayList<LecRegPro> arlist, String subCode) {
		Subject sDate =  lectRegisterDao.sDate(sqlSession, subCode);// ????????? ?????? 
		int result=-1;
		for(int i=0; i<arlist.size();i++) {
			if(sDate.getSubTime().charAt(0)==arlist.get(i).getSubject().getSubTime().charAt(0)) {
				int j=0;
				while(j<sDate.getSubTime().length()-1) {
					result = arlist.get(i).getSubject().getSubTime().substring(1).indexOf(sDate.getSubTime().charAt(j+1));
					j++;
					if(result!=-1) {
						break;
					}
				}
			}
		}
		
		return result;
	}

	@Override
	public int deleteAttachment(String subCode) {
		return lectRegisterDao.deleteAttachment(sqlSession, subCode);
	}

	@Override
	public void lectDeleteAdmin(String subCode) {
		lectRegisterDao.lectDeleteAdmin(sqlSession, subCode);
	}

	@Override
	public void lectUpdateAdmin(Subject subject, String day, int start, int end) {
		for(int i=start; i<=end;i++) {
			day=day+String.valueOf(i);
		}
		if(start==end) {
			day=day+end;
		}
		subject.setSubTime(day);
		lectRegisterDao.lectUpdateAdmin(sqlSession, subject);
	}

	@Override
	public ArrayList<LecRegPro> timeBoardCartList(int stuId) {
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
		return lectRegisterDao.timeBoardCartList(sqlSession, re);
	}


}
