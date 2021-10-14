package com.kh.spring.major.vo;

public class Department {

	private int deptCode;
	private String deptTitle;
	
	public Department() {
		// TODO Auto-generated constructor stub
	}

	public Department(int deptCode, String deptTitle) {
		super();
		this.deptCode = deptCode;
		this.deptTitle = deptTitle;
	}

	public int getDeptCode() {
		return deptCode;
	}

	public void setDeptCode(int deptCode) {
		this.deptCode = deptCode;
	}

	public String getDeptTitle() {
		return deptTitle;
	}

	public void setDeptTitle(String deptTitle) {
		this.deptTitle = deptTitle;
	}

	@Override
	public String toString() {
		return "Department [deptCode=" + deptCode + ", deptTitle=" + deptTitle + "]";
	}
	
}
