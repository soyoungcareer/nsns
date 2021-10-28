package com.kh.spring.facility.model.Service;

import java.util.ArrayList;

import com.kh.spring.common.PageInfo;
import com.kh.spring.facility.model.vo.allam;
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

		void facOk(int no);

		void facNo(int no, searchFac sf);

		ArrayList<facility> facMyPage(int id, PageInfo pi);

		int selectMyListCount(int id);

		void facHome(int no);

		ArrayList<allam> selectallam(int id);

		void delallam(int test);


	


	}


