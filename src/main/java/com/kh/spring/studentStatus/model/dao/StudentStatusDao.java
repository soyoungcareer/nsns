package com.kh.spring.studentStatus.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.studentStatus.model.vo.StudentBack;
import com.kh.spring.studentStatus.model.vo.StudentDo;
import com.kh.spring.studentStatus.model.vo.StudentOff;
import com.kh.spring.studentStatus.model.vo.StudentStatus;

@Repository
public class StudentStatusDao {


	public ArrayList<StudentStatus> studentProList(SqlSessionTemplate sqlSession, int stuId) {
		
		return (ArrayList)sqlSession.selectList("studentStatusMapper.studentProList", stuId);
		
	}

	public StudentOff selectStuOff(SqlSessionTemplate sqlSession, int appNo) {

		return sqlSession.selectOne("studentStatusMapper.selectStuOff", appNo);
	}
	

	public StudentDo selectStuDo(SqlSessionTemplate sqlSession, int appNo) {

		return sqlSession.selectOne("studentStatusMapper.selectStuDo", appNo);
	}

	public int insertStuOff(SqlSessionTemplate sqlSession, StudentOff stuOff) {
		
		return sqlSession.insert("studentStatusMapper.insertStuOff", stuOff);
	}
	
	public int insertStsOff(SqlSessionTemplate sqlSession) {
		
		return sqlSession.insert("studentStatusMapper.insertStsOff");
	}

	public int insertStuDo(SqlSessionTemplate sqlSession, StudentDo stuDo) {
		
		return sqlSession.insert("studentStatusMapper.insertStuDo", stuDo);
	}


	public int insertStsDo(SqlSessionTemplate sqlSession) {
		
		return sqlSession.insert("studentStatusMapper.insertStsDo");
	}

	public int selectOffCount(SqlSessionTemplate sqlSession, int stuId) {
		
		return sqlSession.selectOne("studentStatusMapper.selectOffCount", stuId);
	}

	public int selectDoCount(SqlSessionTemplate sqlSession, int stuId) {
	
		return sqlSession.selectOne("studentStatusMapper.selectDoCount", stuId);
	}

	public int deleteOff(SqlSessionTemplate sqlSession, int appNo) {
	
		return sqlSession.update("studentStatusMapper.deleteOff", appNo);
	}

	public int deleteStsOff(SqlSessionTemplate sqlSession, int appNo) {
		
		return sqlSession.update("studentStatusMapper.deleteStsOff", appNo);
		
	}

	public int deleteDo(SqlSessionTemplate sqlSession, int appNo) {
		
		return sqlSession.update("studentStatusMapper.deleteDo", appNo);
	}

	public int deleteStsDo(SqlSessionTemplate sqlSession, int appNo) {
		
		return sqlSession.update("studentStatusMapper.deleteStsDo", appNo);
	}

	public StudentBack stuBackPage(SqlSessionTemplate sqlSession, int bno) {
		
		return sqlSession.selectOne("studentStatusMapper.stuBackPage", bno);
	}


	

}
