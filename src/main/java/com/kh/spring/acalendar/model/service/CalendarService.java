package com.kh.spring.acalendar.model.service;

import java.util.ArrayList;

import com.kh.spring.acalendar.model.vo.Acalendar;

public interface CalendarService {

	void insertCalendar(Acalendar ac);

	ArrayList<Acalendar> calendarList(String op);

	ArrayList<Acalendar> calendarEvents();

	void deleteCalendar(String acId);

}
