package com.kh.spring.major.vo;

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
public class Subject {
	
	private String subCode; //과목코드
	private String subTitle; //과목이름
	private int deptCode; //학과코드
	private int subDivs; //과목분류 (1:전공/2:교양)
	private String profId; //교번
	private int subCredit; //학점
	private int subClass; //강의실
	private String subTime; //강의시간
	private int subType; //강의형태(1:집체/2:온라인)
	private int subYear; //학년도
	private int subSmst; //학기
	private String status; //상태값
	private String originName; //파일원본명
	private String changeName; //파일수정명
	private String deptTitle; // 학과명
	private String profName; // 교수명


	
	public Subject() {
		// TODO Auto-generated constructor stub
	}

	public Subject(String subCode, String subTitle, int deptCode, int subDivs, String profId, int subCredit,
			int subClass, String subTime, int subType, int subYear, int subSmst, String status, String originName, String changeName) {

		super();
		this.subCode = subCode;
		this.subTitle = subTitle;
		this.deptCode = deptCode;
		this.subDivs = subDivs;
		this.profId = profId;
		this.subCredit = subCredit;
		this.subClass = subClass;
		this.subTime = subTime;
		this.subType = subType;
		this.subYear = subYear;
		this.subSmst = subSmst;
		this.status = status;
		this.originName = originName;
		this.changeName = changeName;
	}
	
	
	
	public String getProfName() {
		return profName;


	}
  
  public String getDeptTitle() {
		return deptTitle;
	}

	public void setDeptTitle(String deptTitle) {
		this.deptTitle = deptTitle;
	}
  
	public void setProfName(String profName) {
		this.profName = profName;
	}
	
	public String getSubCode() {
		return subCode;
	}

	public void setSubCode(String subCode) {
		this.subCode = subCode;
	}

	public String getSubTitle() {
		return subTitle;
	}

	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}

	public int getDeptCode() {
		return deptCode;
	}

	public void setDeptCode(int deptCode) {
		this.deptCode = deptCode;
	}

	public int getSubDivs() {
		return subDivs;
	}

	public void setSubDivs(int subDivs) {
		this.subDivs = subDivs;
	}

	public String getProfId() {
		return profId;
	}

	public void setProfId(String profId) {
		this.profId = profId;
	}

	public int getSubCredit() {
		return subCredit;
	}

	public void setSubCredit(int subCredit) {
		this.subCredit = subCredit;
	}

	public int getSubClass() {
		return subClass;
	}

	public void setSubClass(int subClass) {
		this.subClass = subClass;
	}

	public String getSubTime() {
		return subTime;
	}

	public void setSubTime(String subTime) {
		this.subTime = subTime;
	}

	public int getSubType() {
		return subType;
	}

	public void setSubType(int subType) {
		this.subType = subType;
	}

	public int getSubYear() {
		return subYear;
	}

	public void setSubYear(int subYear) {
		this.subYear = subYear;
	}

	public int getSubSmst() {
		return subSmst;
	}

	public void setSubSmst(int subSmst) {
		this.subSmst = subSmst;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}


	@Override
	public String toString() {
		return "Subject [subCode=" + subCode + ", subTitle=" + subTitle + ", deptCode=" + deptCode + ", subDivs="
				+ subDivs + ", profId=" + profId + ", subCredit=" + subCredit + ", subClass=" + subClass + ", subTime="
				+ subTime + ", subType=" + subType + ", subYear=" + subYear + ", subSmst=" + subSmst + ", status="
				+ status +", originName="+ originName +", changeName="+ changeName + "]";
	}
	

	
}
