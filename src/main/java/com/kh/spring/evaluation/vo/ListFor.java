package com.kh.spring.evaluation.vo;

import java.io.Serializable;

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
public class ListFor implements Serializable{
	private int evalNum;
	private int lectNum;
	private int stuId;
	private int grade;
}
