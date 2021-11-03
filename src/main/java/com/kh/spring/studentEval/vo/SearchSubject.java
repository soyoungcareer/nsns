package com.kh.spring.studentEval.vo;

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
public class SearchSubject {
	
	private int con1;
	private int con2;
	private String keyword;
	private String profId; 
}
