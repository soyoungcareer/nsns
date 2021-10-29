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
	private String category;
	private String title;
	private String agency;
	private String day;
	private Date getDate;
	private String status;
	
}
