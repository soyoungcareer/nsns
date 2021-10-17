package com.kh.spring.acalendar.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString 
public class Acalendar { //학사일정

	private int acId; //학사아이디
	private String title; //제목
	private Date start; //시작일자
	private Date end; //마지막일자
	private String backgroundColor; // 배경색
}
