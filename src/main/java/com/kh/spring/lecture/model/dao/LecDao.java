package com.kh.spring.lecture.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.facility.model.vo.searchFac;
import com.kh.spring.lecture.model.vo.Reply;
import com.kh.spring.lecture.model.vo.lecture;
import com.kh.spring.lecture.model.vo.lectureList;

@Repository
public class LecDao {

	public ArrayList<lecture> selectList(SqlSessionTemplate sqlSession, int id) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("lectureMapper.selectList", id);
	}

	public ArrayList<lectureList> lecPageSub(SqlSessionTemplate sqlSession, int no) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("lectureMapper.selectlegPageSub", no);
	}

	public lectureList lecPageFinal(SqlSessionTemplate sqlSession, int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("lectureMapper.selectlecPageFinal", no);
	}

	public Object lecinsert(SqlSessionTemplate sqlSession, lectureList l) {
		return sqlSession.selectOne("lectureMapper.lecinsert",l);
	}

	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int bno) {
		return (ArrayList)sqlSession.selectList("lectureMapper.selectReplyList", bno);
		
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
	
		return sqlSession.insert("lectureMapper.insertReply" ,r);

	}

	public int insertTime(SqlSessionTemplate sqlSession, searchFac sf) {
		// TODO Auto-generated method stub
		return sqlSession.update("lectureMapper.insertTime",sf);
	}

	

}
