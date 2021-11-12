package com.kh.spring.major.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.common.PageInfo;
import com.kh.spring.major.vo.RequestedSubject;
import com.kh.spring.major.vo.Subject;

@Repository
public class SubjectDao {

	public int subjectModifyListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("majorMapper.subjectModifyListCount");
	}

	public ArrayList<RequestedSubject> subjectModifyList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("majorMapper.subjectModifyList", null, rowBounds);
	}

	public RequestedSubject selectSubjectModify(SqlSessionTemplate sqlSession, int sno) {
		
		return sqlSession.selectOne("majorMapper.selectSubjectModify", sno);
	}
	
	public int createSubject(SqlSessionTemplate sqlSession, Subject sub) {
		
		return sqlSession.insert("majorMapper.createSubject", sub);
	}

	public int createRequestSubject(SqlSessionTemplate sqlSession, RequestedSubject reqSub) {
		
		return sqlSession.update("majorMapper.createRequestSubject", reqSub);
	}

	public int modifySubject(SqlSessionTemplate sqlSession, Subject sub) {
		
		return sqlSession.update("majorMapper.modifySubject", sub);
	}

	public int modifyRequestedSubject(SqlSessionTemplate sqlSession, RequestedSubject reqSub) {
		
		return sqlSession.update("majorMapper.modifyRequestedSubject", reqSub);
	}

	public int deleteSubject(SqlSessionTemplate sqlSession, Subject sub) {
		
		return sqlSession.update("majorMapper.deleteSubject", sub);
	}

	public int deleteRequestedSubject(SqlSessionTemplate sqlSession, RequestedSubject reqSub) {
		
		return sqlSession.update("majorMapper.deleteRequestedSubject", reqSub);
	}

	public int subAllListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("majorMapper.subAllListCount");
	}

	public ArrayList<Subject> subAllList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("majorMapper.subAllList", null, rowBounds);
	}

}
