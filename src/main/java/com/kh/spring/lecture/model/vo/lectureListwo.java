package com.kh.spring.lecture.model.vo;

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
public class lectureListwo {

	private int subCode;
	private String subTtile;
	private int subCridit;
	private String profId;
	private int subYear;
	private String profName;
	
}
