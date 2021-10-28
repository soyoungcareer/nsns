package com.kh.spring.lectRegister.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.common.PageInfo;
import com.kh.spring.lectRegister.vo.Attachment;
import com.kh.spring.lectRegister.vo.LecRegPro;
import com.kh.spring.lectRegister.vo.LectRegister;
import com.kh.spring.lectRegister.vo.SearchReg;
import com.kh.spring.major.vo.Department;
import com.kh.spring.major.vo.Subject;
import com.kh.spring.member.vo.Professor;



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

	public ArrayList<LecRegPro> selectRegisterList(SqlSessionTemplate sqlSession,LectRegister re) {
		return (ArrayList)sqlSession.selectList("lectRegisterMapper.selectRegisterList", re);
	}

	public LecRegPro lectReDetail(SqlSessionTemplate sqlSession, String subCode) {
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

	public LectRegister checkRegister(SqlSessionTemplate sqlSession, LectRegister re) {
		return sqlSession.selectOne("lectRegisterMapper.checkRegister", re);
	}

	public Integer checkCredit(SqlSessionTemplate sqlSession, LectRegister re) {
		return sqlSession.selectOne("lectRegisterMapper.checkCredit", re);
	}

	public ArrayList<LecRegPro> selectRegiCartsterList(SqlSessionTemplate sqlSession, LectRegister re ) {
		return (ArrayList)sqlSession.selectList("lectRegisterMapper.selectRegiCartsterList", re);
	}

	public int regiInsertCart(SqlSessionTemplate sqlSession, LectRegister re) {
		return sqlSession.insert("lectRegisterMapper.regiInsertCart", re);
	}

	public LectRegister checkRegisterCart(SqlSessionTemplate sqlSession, LectRegister re) {
		return sqlSession.selectOne("lectRegisterMapper.checkRegisterCart", re);
	}

	public int registerDeleteCart(SqlSessionTemplate sqlSession, LectRegister re) {
		return sqlSession.update("lectRegisterMapper.registerDeleteCart", re);
	}

	public ArrayList<LecRegPro> timeBoardList(SqlSessionTemplate sqlSession, LectRegister re) {
		return (ArrayList)sqlSession.selectList("lectRegisterMapper.timeBoardList", re);
	}

	public void InsertCredit(SqlSessionTemplate sqlSession, LectRegister re) {
		sqlSession.update("lectRegisterMapper.InsertCredit", re);
		
	}

	public void deleteCredit(SqlSessionTemplate sqlSession, LectRegister re) {
		sqlSession.update("lectRegisterMapper.deleteCredit", re);
		
	}

	public ArrayList<Professor> proList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("lectRegisterMapper.proList");
	}

	public Subject sDate(SqlSessionTemplate sqlSession, String subCode) {
		return sqlSession.selectOne("lectRegisterMapper.sDate", subCode);
	}

	public ArrayList<LectRegister> selectReDateList(SqlSessionTemplate sqlSession, int stuId) {
		return (ArrayList)sqlSession.selectList("lectRegisterMapper.selectReDateList", stuId);
	}

	public int deleteAttachment(SqlSessionTemplate sqlSession, String subCode) {
		return sqlSession.update("lectRegisterMapper.deleteAttachment", subCode);
	}

	public void lectDeleteAdmin(SqlSessionTemplate sqlSession, String subCode) {
		sqlSession.update("lectRegisterMapper.lectDeleteAdmin", subCode);
	}

	public void lectUpdateAdmin(SqlSessionTemplate sqlSession, Subject subject) {
		sqlSession.update("lectRegisterMapper.lectUpdateAdmin", subject);
	}




}
