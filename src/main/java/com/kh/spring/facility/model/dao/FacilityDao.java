package com.kh.spring.facility.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.common.PageInfo;
import com.kh.spring.facility.model.vo.facility;
import com.kh.spring.facility.model.vo.facilitycheck;
import com.kh.spring.facility.model.vo.searchFac;

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

		return sqlSession.selectOne("facilityMapper.selectFacility", no);

	}

	public int insertFacility(SqlSessionTemplate sqlSession, facility f) {
		// TODO Auto-generated method stub
		return sqlSession.insert("facilityMapper.inserFacility", f);
	}

	public int selectListCount(SqlSessionTemplate sqlSession, searchFac sf) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("facilityMapper.selectListCountse", sf);
	}

	public ArrayList<facility> selectList(SqlSessionTemplate sqlSession, searchFac sf, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("facilityMapper.selectListse", sf, rowBounds);
	}

	public int selectfacdel(SqlSessionTemplate sqlSession, int hiddenNo) {

		return sqlSession.delete("facilityMapper.deleteFac", hiddenNo);
	}

	public int facApp(SqlSessionTemplate sqlSession, searchFac sf) {

		return sqlSession.update("facilityMapper.facApp", sf);
	}

	public int selectListAppCount(SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("facilityMapper.selectListAppCount");
	}

	public ArrayList<facilitycheck> selectAppList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("facilityMapper.selectAppList", null, rowBounds);
	}

}
