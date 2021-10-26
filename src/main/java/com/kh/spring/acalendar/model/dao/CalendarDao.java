package com.kh.spring.acalendar.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.acalendar.model.vo.Acalendar;
import com.kh.spring.acalendar.model.vo.SearchCondition;

@Repository
public class CalendarDao {

	public int insertCalendar(SqlSessionTemplate sqlsession, Acalendar ac) {
		
		return sqlsession.insert("calendarMapper.insertCalendar", ac);
	}


	public ArrayList<Acalendar> calendarList(SqlSessionTemplate sqlsession, SearchCondition sc) {
		
		return (ArrayList)sqlsession.selectList("calendarMapper.calendarList", sc);
	}


	public ArrayList<Acalendar> calendarEvents(SqlSessionTemplate sqlsession) {
		
		return (ArrayList)sqlsession.selectList("calendarMapper.calendarEvents");
	}

	public int deleteCalendar(SqlSessionTemplate sqlsession, String acId) {
		
		return  sqlsession.delete("calendarMapper.deleteCalendar", acId);
	}

	public ArrayList<String> selectYear(SqlSessionTemplate sqlsession) {
		
		return  (ArrayList)sqlsession.selectList("calendarMapper.selectYear");
	}




}
