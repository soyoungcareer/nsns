package com.kh.spring.member.vo;

public class Admin {

	private String admId;
	private String admPwd;
	
	public Admin() {
		// TODO Auto-generated constructor stub
	}
	
	public Admin(String admId, String admPwd) {
		super();
		this.admId = admId;
		this.admPwd = admPwd;
	}

	public String getAdmId() {
		return admId;
	}

	public void setAdmId(String admId) {
		this.admId = admId;
	}

	public String getAdmPwd() {
		return admPwd;
	}

	public void setAdmPwd(String admPwd) {
		this.admPwd = admPwd;
	}

	@Override
	public String toString() {
		return "Admin [admId=" + admId + ", admPwd=" + admPwd + "]";
	}
	
}
