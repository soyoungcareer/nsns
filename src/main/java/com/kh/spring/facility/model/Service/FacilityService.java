package com.kh.spring.facility.model.Service;

import java.util.ArrayList;

import com.kh.spring.common.PageInfo;
import com.kh.spring.facility.model.vo.facility;
import com.kh.spring.facility.model.vo.facilitycheck;
import com.kh.spring.facility.model.vo.searchFac;

public interface FacilityService {

	int selectListCount();

	ArrayList<facility> selectList(PageInfo pi);

	facility selectFacility(int no);

	void insertFacility(facility f);

	int selectListCount(searchFac sf);

	ArrayList<facility> selectList(searchFac sf, PageInfo pi);

	void selectfacdel(int hiddenNo);

	 int facApp(searchFac sf);

		int selectListAppCount();

		ArrayList<facilitycheck> selectAppList(PageInfo pi);

	


	}


