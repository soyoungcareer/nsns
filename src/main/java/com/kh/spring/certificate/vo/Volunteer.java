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
public class Volunteer {
	private int volNo;
	private int stuId;
	private String volTitle;
	private Date startDate;
	private Date endDate;
	private int volTime;
	private String status;
}
