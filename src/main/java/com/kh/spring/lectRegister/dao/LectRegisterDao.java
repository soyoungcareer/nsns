package com.kh.spring.lectRegister.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.lectRegister.vo.LecRegPro;
import com.kh.spring.lectRegister.vo.LectRegister;
import com.kh.spring.lectRegister.vo.SearchReg;
import com.kh.spring.major.vo.Department;
import com.kh.spring.major.vo.Subject;
import com.kh.spring.notice.vo.PageInfo;

@Repository
public class LectRegisterDao {

	public int lectReListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("lectRegisterMapper.lectReListCount");
	}

	public ArrayList<LecRegPro> lectReList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("lectRegisterMapper.lectReList",null, rowBounds);
	}

	public ArrayList<Department> departList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("lectRegisterMapper.departList");
	}

	public ArrayList<LecRegPro> selectRegisterList(SqlSessionTemplate sqlSession, int stuId) {
		return (ArrayList)sqlSession.selectList("lectRegisterMapper.selectRegisterList", stuId);
	}

	public LecRegPro lectReDetail(SqlSessionTemplate sqlSession, int subCode) {
		return sqlSession.selectOne("lectRegisterMapper.lectReDetail",subCode);
	}

	public int regiInsert(SqlSessionTemplate sqlSession, LectRegister re) {
		return sqlSession.insert("lectRegisterMapper.regiInsert", re);
	}

	public int registerDelete(SqlSessionTemplate sqlSession, LectRegister re) {
		return sqlSession.update("lectRegisterMapper.registerDelete", re);
	}

	public int searchListCount(SqlSessionTemplate sqlSession, SearchReg sr) {
		return sqlSession.selectOne("lectRegisterMapper.searchListCount", sr);
	}

	public ArrayList<LecRegPro> searchLectReList(SqlSessionTemplate sqlSession, SearchReg sr, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("lectRegisterMapper.searchLectReList", sr , rowBounds);
	}


}
