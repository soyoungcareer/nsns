package com.kh.spring.lectRegister.vo;

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
public class Attachment {
	private int lectAtNum;
	private String subCode;
	private String originName;
	private String changeName;
	private String status;
}
