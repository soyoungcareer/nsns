package com.kh.spring.gradeObject.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.gradeObject.dao.GradeObjectDao;
import com.kh.spring.gradeObject.vo.GradeObject;
import com.kh.spring.lectRegister.vo.LecRegPro;
import com.kh.spring.lectRegister.vo.LectRegister;
@Service
public class GradeObjectServiceImpl implements GradeObjectService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private GradeObjectDao gradeObjectDao;
	
	@Override
	public LecRegPro gradeDetailList(int stuId, String subCode, String date) {
		LectRegister re = new LectRegister();
		re.setStuId(stuId);
		re.setSubCode(subCode);
		
		String day[] = date.split(" ");
		int year = Integer.parseInt(day[0]);
		int sem =Integer.parseInt(day[2]);
		
		re.setYear(year);
		re.setSemester(sem);
		return gradeObjectDao.gradeDetailList(sqlSession, re);
	}

	@Override
	public void insertGradeObj(LecRegPro detail, String title, String content) {
		GradeObject go= new GradeObject();
		go.setGradeNo(detail.getGrade().getGradeNo());
		go.setStuId(detail.getLectRegister().getStuId());
		go.setTitle(title);
		go.setContent(content);
		gradeObjectDao.insertGradeObj(sqlSession, go);
	}

	@Override
	public ArrayList<LecRegPro> gradeObjectList(int stuId) {
		return gradeObjectDao.gradeObjectList(sqlSession, stuId);
	}

	@Override
	public LecRegPro gradeObjectDetailPage(int stuId, String subCode, String date) {
		LectRegister re = new LectRegister();
		re.setStuId(stuId);
		re.setSubCode(subCode);
		
		String day[] = date.split(" ");
		int year = Integer.parseInt(day[0]);
		int sem =Integer.parseInt(day[2]);
		
		re.setYear(year);
		re.setSemester(sem);
		return gradeObjectDao.gradeObjectDetailPage(sqlSession, re);
	}

}
