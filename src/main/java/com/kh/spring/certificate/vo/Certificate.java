package com.kh.spring.certificate.vo;

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
public class Certificate {
	private int cerNo;
	private int stuId;
	private String Category;
	private String title;
	private String agency;
	private Date getDate;
	private String status;
}
