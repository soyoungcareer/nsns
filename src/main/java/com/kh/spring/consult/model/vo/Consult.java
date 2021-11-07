package com.kh.spring.consult.model.vo;

import java.util.Date;

import com.kh.spring.member.vo.Student;

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
public class Consult {

	private int conNo; //상담번호
	private String conCategory; // 구분 (일반, 진로)
	private Date conDate; // 희망날짜
	private String conReason; //상담사유
	private String rejectReason; //반려사유
	private String status; //상태값
	private int stuId; //학번
	
	private Student student;
	private ConsultStatus consultStatus;
	
}
