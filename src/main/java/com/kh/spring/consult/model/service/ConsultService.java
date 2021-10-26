package com.kh.spring.consult.model.service;

import java.util.ArrayList;

import com.kh.spring.consult.model.vo.Consult;
import com.kh.spring.consult.model.vo.ConsultStatus;

public interface ConsultService {

	ArrayList<ConsultStatus> conProList(String userId);

	Consult selectConsult(int conNo);

	int selectConsultCount(String stuId);

	void insertConsult(Consult con);

	void deleteCon(int conNo);

}
