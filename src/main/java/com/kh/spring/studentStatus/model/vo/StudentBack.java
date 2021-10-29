package com.kh.spring.studentStatus.model.vo;

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
public class StudentBack {
	
	private int BoardNo;
	private String title;
	private String content;
	private String originName;
	private String changeName;

}
