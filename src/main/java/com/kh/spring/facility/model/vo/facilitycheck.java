package com.kh.spring.facility.model.vo;

import java.sql.Date;

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
public class facilitycheck {
	
	private int facNo;
	private String stuId;
	private String facName;
	private String facContent;
	private String stuName;
	private String stuTitle;
	

	
}
