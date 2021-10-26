package com.kh.spring.acalendar.model.service;

import java.util.ArrayList;

import com.kh.spring.acalendar.model.vo.Acalendar;
import com.kh.spring.acalendar.model.vo.SearchCondition;

public interface CalendarService {

	void insertCalendar(Acalendar ac);

	ArrayList<Acalendar> calendarList(SearchCondition sc);

	ArrayList<Acalendar> calendarEvents();

	void deleteCalendar(String acId);

	ArrayList<String> selectYear();



	

}
