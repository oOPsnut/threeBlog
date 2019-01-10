package com.threeblog.domain;

import java.util.Date;

public class AdminBean {
	
	private String id;
	private String username;
	private String password;
	private String phone;
	private String license_code;
	private Date register_time;
	private Date last_login_time;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getLicense_code() {
		return license_code;
	}
	public void setLicense_code(String license_code) {
		this.license_code = license_code;
	}
	public Date getRegister_time() {
		return register_time;
	}
	public void setRegister_time(Date register_time) {
		this.register_time = register_time;
	}
	public Date getLast_login_time() {
		return last_login_time;
	}
	public void setLast_login_time(Date last_login_time) {
		this.last_login_time = last_login_time;
	}
	@Override
	public String toString() {
		return "AdminBean [id=" + id + ", username=" + username + ", password=" + password + ", phone=" + phone
				+ ", license_code=" + license_code + ", register_time=" + register_time + ", last_login_time="
				+ last_login_time + "]";
	}
	public AdminBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AdminBean(String id, String username, String password, String phone, String license_code, Date register_time,
			Date last_login_time) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.license_code = license_code;
		this.register_time = register_time;
		this.last_login_time = last_login_time;
	}
	
	
}
