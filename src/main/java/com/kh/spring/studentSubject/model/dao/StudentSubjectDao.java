package com.kh.spring.studentSubject.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.common.PageInfo;
import com.kh.spring.studentSubject.model.vo.SearchCondition;
import com.kh.spring.studentSubject.model.vo.StudentSubject;

@Repository
public class StudentSubjectDao {

	public ArrayList<String> selectYear(SqlSessionTemplate sqlsession, String stuId) {
		
		return (ArrayList)sqlsession.selectList("studentSubjectMapper.selectYear", stuId);
	}

	public ArrayList<String> selectSemester(SqlSessionTemplate sqlsession, String stuId) {
		
		return (ArrayList)sqlsession.selectList("studentSubjectMapper.selectSemester", stuId);
	}

	public int selectListCount(SqlSessionTemplate sqlsession, String stuId) {
		
		return sqlsession.selectOne("studentSubjectMapper.selectListCount", stuId);
	}
	
	public ArrayList<StudentSubject> selectStuSubjectList(SqlSessionTemplate sqlsession,String stuId, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList)sqlsession.selectList("studentSubjectMapper.selectStuSubjectList", stuId, rowBounds);
	}
	
	public int selectListCount(SqlSessionTemplate sqlsession, SearchCondition sc) {
		
		return sqlsession.selectOne("studentSubjectMapper.selectListCountSC", sc);
	}

	
	public ArrayList<StudentSubject> searchSubject(SqlSessionTemplate sqlsession, SearchCondition sc, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList)sqlsession.selectList("studentSubjectMapper.searchSubject", sc, rowBounds);
	}


	

}
