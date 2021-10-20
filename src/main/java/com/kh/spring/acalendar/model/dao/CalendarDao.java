package com.kh.spring.acalendar.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.acalendar.model.vo.Acalendar;

@Repository
public class CalendarDao {

	public int insertCalendar(SqlSessionTemplate sqlsession, Acalendar ac) {
		
		return sqlsession.insert("calendarMapper.insertCalendar", ac);
	}

	public ArrayList<Acalendar> calendarList(SqlSessionTemplate sqlsession, String op) {
		
		return (ArrayList)sqlsession.selectList("calendarMapper.calendarList", op);
	}

	public ArrayList<Acalendar> calendarEvents(SqlSessionTemplate sqlsession) {
		
		return (ArrayList)sqlsession.selectList("calendarMapper.calendarEvents");
	}

	public int deleteCalendar(SqlSessionTemplate sqlsession, String acId) {
		
		return  sqlsession.delete("calendarMapper.deleteCalendar", acId);
	}


}
