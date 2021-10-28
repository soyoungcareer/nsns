package com.kh.spring.facility.model.Service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.PageInfo;
import com.kh.spring.facility.model.dao.FacilityDao;
import com.kh.spring.facility.model.vo.allam;
import com.kh.spring.facility.model.vo.facility;
import com.kh.spring.facility.model.vo.facilitycheck;
import com.kh.spring.facility.model.vo.searchFac;

@Service
public class FacilityServiceImpl implements FacilityService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private FacilityDao fd;

	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		System.out.println("중간지점 확인");
		return fd.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<facility> selectList(PageInfo pi) {
		return fd.selectList(sqlSession, pi);
	}

	@Override
	public facility selectFacility(int no) {
		// TODO Auto-generated method stub
		System.out.println("서비스 넘 @@@@@@@@@@@@2" + no);
		return fd.selectFacility(sqlSession, no);
	}

	@Override
	public void insertFacility(facility f) {

		int result = fd.insertFacility(sqlSession, f);

	}

	@Override
	public int selectListCount(searchFac sf) {

		return fd.selectListCount(sqlSession, sf);
	}

	@Override
	public ArrayList<facility> selectList(searchFac sf, PageInfo pi) {
		// TODO Auto-generated method stub

		return fd.selectList(sqlSession, sf, pi);
	}

	@Override
	public void selectfacdel(int hiddenNo) {

		int result = fd.selectfacdel(sqlSession, hiddenNo);
	}

	@Override
	public int facApp(searchFac sf) {

		int result = fd.facApp(sqlSession, sf);

		return result;

	}

	@Override
	public int selectListAppCount() {
		// TODO Auto-generated method stub
		return fd.selectListAppCount(sqlSession);

	}

	@Override
	public ArrayList<facilitycheck> selectAppList(PageInfo pi) {
		// TODO Auto-generated method stub
		return fd.selectAppList(sqlSession, pi);
	}

	@Override
	public void facOk(int no) {

		int result = fd.facOk(sqlSession, no);
	

	}

	@Override
	public void facNo(int no, searchFac sf) {

		int result = fd.facNo(sqlSession, no);
		int result2;
		if(result > 0) {
			result2 = fd.allam(sqlSession,sf);
		}
	}


	@Override
	public int selectMyListCount(int id) {
		// TODO Auto-generated method stub
		
		int result = fd.selectMyListCount(sqlSession,id);
		
		return result;
	}

	@Override
	public ArrayList<facility> facMyPage(int id, PageInfo pi) {



		return  fd.facMyPage(sqlSession, id,pi);

	}

	@Override
	public void facHome(int no) {
		
		int result =  fd.facHome(sqlSession,no);
	}

	@Override
	public ArrayList<allam> selectallam(int id) {
		// TODO Auto-generated method stub
		return (ArrayList)fd.selectallam(sqlSession,id);
	}

	@Override
	public void delallam(int test) {
		
		int result = fd.delallam(sqlSession,test);
	}



}
