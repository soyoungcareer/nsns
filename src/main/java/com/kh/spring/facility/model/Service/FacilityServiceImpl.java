package com.kh.spring.facility.model.Service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.facility.model.dao.FacilityDao;
import com.kh.spring.facility.model.vo.PageInfoo;
import com.kh.spring.facility.model.vo.facility;

@Service
public class FacilityServiceImpl implements FacilityService  {

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
	public ArrayList<facility> selectList(PageInfoo pi) {
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
		System.out.println("ASDASDASDAGdfgjffiejgiewjfiwjfwiewgheuirfejewohfeowlk");
		
		int result = fd.insertFacility(sqlSession,f);
		
		
		
	}



	



}
