package com.kh.spring.acalendar.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.acalendar.model.dao.CalendarDao;
import com.kh.spring.acalendar.model.vo.Acalendar;
import com.kh.spring.common.exception.CommException;

@Service
public class CalendarServiceImpl implements CalendarService {
	
	@Autowired
	private SqlSessionTemplate sqlsession;	

	@Autowired
	private CalendarDao calendarDao;	
	
	//이벤트 불러오기
	@Override
	public ArrayList<Acalendar> calendarEvents() {
		return calendarDao.calendarEvents(sqlsession);
	}

	//학사일정 insert
	@Override
	public void insertCalendar(Acalendar ac) { 
		
		int result = calendarDao.insertCalendar(sqlsession,ac);
		
		if(result < 0) {
			throw new CommException("일정 등록 실패");
		}
	}

	//학사일정 리스트 가져오기
	@Override
	public ArrayList<Acalendar> calendarList(String op) {
		return calendarDao.calendarList(sqlsession, op);
	}

	//학사일정 삭제
	@Override
	public void deleteCalendar(String acId) {
		
		int result =  calendarDao.deleteCalendar(sqlsession, acId);
		
		if(result < 0) {
			throw new CommException("일정 등록 실패");
		}
		
	}

	

}
