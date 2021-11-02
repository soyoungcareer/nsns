package com.kh.spring.board.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Board {

	
	private int no;
	private int stuId;
	private String title;
	private String content;
	private int like;
	private int isee;
	private Date date;
	private int rowNo;
}
