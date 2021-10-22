package com.kh.spring.facility.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.facility.model.vo.facility;

@Repository
public class FacilityDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		System.out.println("중간지점 2");
		return sqlSession.selectOne("facilityMapper.selectListCount");
		}

	public ArrayList<facility> selectList(SqlSessionTemplate sqlSession, com.kh.spring.common.PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("facilityMapper.selectList", null, rowBounds);
	}

	public facility selectFacility(SqlSessionTemplate sqlSession, int no) {
		// TODO Auto-generated method stub

		return sqlSession.selectOne("facilityMapper.selectFacility",no);

	}

	public int insertFacility(SqlSessionTemplate sqlSession, facility f) {
		// TODO Auto-generated method stub
		return sqlSession.insert("facilityMapper.inserFacility", f);
	}

 



}
