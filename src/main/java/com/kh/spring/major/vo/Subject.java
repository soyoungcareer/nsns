package com.kh.spring.major.vo;

public class Subject {
	
	private String subCode;
	private String subTitle;
	private int deptCode;
	private int subDivs;
	private String profId;
	private int subCredit;
	private int subClass;
	private int subTime;
	private int subType;
	private int subYear;
	private int subSmst;
	private String status;
	
	public Subject() {
		// TODO Auto-generated constructor stub
	}

	public Subject(String subCode, String subTitle, int deptCode, int subDivs, String profId, int subCredit,
			int subClass, int subTime, int subType, int subYear, int subSmst, String status) {
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

	public int getSubTime() {
		return subTime;
	}

	public void setSubTime(int subTime) {
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

	@Override
	public String toString() {
		return "Subject [subCode=" + subCode + ", subTitle=" + subTitle + ", deptCode=" + deptCode + ", subDivs="
				+ subDivs + ", profId=" + profId + ", subCredit=" + subCredit + ", subClass=" + subClass + ", subTime="
				+ subTime + ", subType=" + subType + ", subYear=" + subYear + ", subSmst=" + subSmst + ", status="
				+ status + "]";
	}

}
