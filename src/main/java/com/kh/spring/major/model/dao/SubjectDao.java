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
		// TODO Auto-generated method stub
		return sqlSession.selectOne("majorMapper.subjectModifyListCount");
	}

	public ArrayList<RequestedSubject> subjectModifyList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("majorMapper.subjectModifyList", null, rowBounds);
	}

	public RequestedSubject selectSubjectModify(SqlSessionTemplate sqlSession, int sno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("majorMapper.selectSubjectModify", sno);
	}
	
	public int createSubject(SqlSessionTemplate sqlSession, Subject sub) {
		// TODO Auto-generated method stub
		return sqlSession.insert("majorMapper.createSubject", sub);
	}

	public int createRequestSubject(SqlSessionTemplate sqlSession, RequestedSubject reqSub) {
		// TODO Auto-generated method stub
		return sqlSession.update("majorMapper.createRequestSubject", reqSub);
	}

}
