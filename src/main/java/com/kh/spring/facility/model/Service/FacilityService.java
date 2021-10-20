package com.kh.spring.facility.model.Service;

import java.util.ArrayList;

import com.kh.spring.facility.model.vo.facility;
import com.kh.spring.notice.vo.PageInfo;

public interface FacilityService {

	int selectListCount();

	ArrayList<facility> selectList(PageInfo pi);

	facility selectFacility(int no);

	void insertFacility(facility f);



	}

