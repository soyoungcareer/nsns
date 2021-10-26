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
public class facility {
	
	private int facNo;
	private String stuId;
	private String facName;
	private String facStatus;
	private String facReason;
	private Date facPeriod;
	private Date facDate;
	private String fileBName;
	private String fileFName;
	private String fac_cat;
	private long facban;
	private String facbancheck;

}
