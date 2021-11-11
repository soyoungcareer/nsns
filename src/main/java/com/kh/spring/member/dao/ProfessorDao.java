package com.kh.spring.member.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.common.PageInfo;
import com.kh.spring.consult.model.vo.Consult;
import com.kh.spring.consult.model.vo.ConsultStatus;
import com.kh.spring.evaluation.vo.Evaluation;
import com.kh.spring.major.vo.RequestedSubject;
import com.kh.spring.major.vo.Subject;
import com.kh.spring.member.vo.Professor;
import com.kh.spring.member.vo.SearchStudent;
import com.kh.spring.member.vo.Student;
import com.kh.spring.studentEval.vo.SearchSubject;
import com.kh.spring.studentStatus.model.vo.StudentDo;
import com.kh.spring.studentStatus.model.vo.StudentOff;
import com.kh.spring.studentStatus.model.vo.StudentStatus;

@Repository
public class ProfessorDao {
 
	public int profLectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("profMapper.profLectListCount");
	}

	public ArrayList<Subject> selectSubList(SqlSessionTemplate sqlSession, String profId, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("profMapper.selectSubList", profId , rowBounds);
	}

	public Professor selectMypage(SqlSessionTemplate sqlSession, String profId) {
		return sqlSession.selectOne("profMapper.selectMypage", profId);
	}

	public Professor profInfoLoad(SqlSessionTemplate sqlSession, String profId) {
		return sqlSession.selectOne("profMapper.profInfoLoad", profId);
	}

	public int profCreateLecture(SqlSessionTemplate sqlSession, RequestedSubject reqSubject) {
		return sqlSession.insert("profMapper.profCreateLecture", reqSubject);
	}

	public Subject subInfoLoad(SqlSessionTemplate sqlSession, Map map) {
		return sqlSession.selectOne("profMapper.subInfoLoad", map);
	}

	public int editMypage(SqlSessionTemplate sqlSession, Professor prof) {
		return sqlSession.update("profMapper.editMypage", prof);
	}

	public Professor loginProfessor(SqlSessionTemplate sqlSession, String profId) {
		return sqlSession.selectOne("profMapper.loginProfessor", profId);
	}

	public ArrayList<Consult> loadConsultList(SqlSessionTemplate sqlSession, String profId, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("profMapper.loadConsultList", profId, rowBounds);
	}

	public ArrayList<StudentDo> loadDoList(SqlSessionTemplate sqlSession, String profId, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("profMapper.loadDoList", profId, rowBounds);
	}

	public ArrayList<StudentOff> loadOffList(SqlSessionTemplate sqlSession, String profId, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("profMapper.loadOffList", profId, rowBounds);
	}

	public ArrayList<RequestedSubject> selectReqSubList(SqlSessionTemplate sqlSession, String profId, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("profMapper.selectReqSubList", profId , rowBounds);
	}

	public int subListCount(SqlSessionTemplate sqlSession, String profId) {
		return sqlSession.selectOne("profMapper.subListCount", profId);
	}

	public int reqSubListCount(SqlSessionTemplate sqlSession, String profId) {
		return sqlSession.selectOne("profMapper.reqSubListCount", profId);
	}

	public int offListCount(SqlSessionTemplate sqlSession, String profId) {
		return sqlSession.selectOne("profMapper.offListCount", profId);
	}

	public int doListCount(SqlSessionTemplate sqlSession, String profId) {
		return sqlSession.selectOne("profMapper.doListCount", profId);
	}

	public ArrayList<Student> selectFilteredStu(SqlSessionTemplate sqlSession, SearchStudent searchStudent) {
		return (ArrayList)sqlSession.selectList("profMapper.selectFilteredStu", searchStudent);
	}

	public int editLectReq(SqlSessionTemplate sqlSession, RequestedSubject reqSubject) {
		return sqlSession.insert("profMapper.editLectReq", reqSubject);
	}

	public int delLectReq(SqlSessionTemplate sqlSession, RequestedSubject reqSubject) {
		return sqlSession.insert("profMapper.delLectReq", reqSubject);
	}

	public Subject delSubInfo(SqlSessionTemplate sqlSession, Map map) {
		return sqlSession.selectOne("profMapper.delSubInfo", map);
	}

	public StudentOff detailOff(SqlSessionTemplate sqlSession, int applicationNo) {
		return sqlSession.selectOne("profMapper.detailOff", applicationNo);
	}

	public StudentDo detailDo(SqlSessionTemplate sqlSession, int applicationNo) {
		return sqlSession.selectOne("profMapper.detailDo", applicationNo);
	}

	public int profOffCheck(SqlSessionTemplate sqlSession, StudentStatus stuOff) {
		return sqlSession.update("profMapper.profOffCheck", stuOff);
	}

	public int profDoCheck(SqlSessionTemplate sqlSession, StudentStatus stuDo) {
		return sqlSession.update("profMapper.profDoCheck", stuDo);
	}

	public Consult detailConsult(SqlSessionTemplate sqlSession, String conNo) {
		return sqlSession.selectOne("profMapper.detailConsult", conNo);
	}

	public int profConCheck(SqlSessionTemplate sqlSession, Consult consult) {
		return sqlSession.update("profMapper.profConCheck", consult);
	}

	public Evaluation selectFilteredEval(SqlSessionTemplate sqlSession, Map map) {
		return sqlSession.selectOne("profMapper.selectFilteredEval", map);
	}

	public int profConComplete(SqlSessionTemplate sqlSession, ConsultStatus conStatus) {
		return sqlSession.update("profMapper.profConComplete", conStatus);
	}

	public int loadConsultCount(SqlSessionTemplate sqlSession, String profId) {
		return sqlSession.selectOne("profMapper.loadConsultCount", profId);
	}

	public int createDuplCheck(SqlSessionTemplate sqlSession, RequestedSubject reqSubject) {
		return sqlSession.selectOne("profMapper.createDuplCheck", reqSubject);
	}

	public int delDuplCheck(SqlSessionTemplate sqlSession, RequestedSubject reqSubject) {
		return sqlSession.selectOne("profMapper.delDuplCheck", reqSubject);
	}

	public int editDuplCheck(SqlSessionTemplate sqlSession, RequestedSubject reqSubject) {
		return sqlSession.selectOne("profMapper.editDuplCheck", reqSubject);
	}


}
