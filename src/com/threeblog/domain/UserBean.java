package com.threeblog.domain;

import java.util.Date;;
/**
 * 这是用户封装的对象bean
 * @author Liang
 *
 */
public class UserBean {

	private String id;
	private String username;
	private String password;
	private int age;
	private String sex;
	private String phone;
	private String introduction;
	private String head;
	private String province;
	private String city;
	private Date register_time;
	private Date last_login_time;
	private Date ban_time;
	
	private  String album;

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

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getHead() {
		return head;
	}

	public void setHead(String head) {
		this.head = head;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
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

	public Date getBan_time() {
		return ban_time;
	}

	public void setBan_time(Date ban_time) {
		this.ban_time = ban_time;
	}

	public String getAlbum() {
		return album;
	}

	public void setAlbum(String album) {
		this.album = album;
	}
	
	 public UserBean() {
		// TODO Auto-generated constructor stub
	}
		
	 
	public UserBean(String id, String username, String password, int age, String sex, String phone, String introduction,
			String head, String province, String city, Date register_time, Date last_login_time, Date ban_time,
			String album) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.age = age;
		this.sex = sex;
		this.phone = phone;
		this.introduction = introduction;
		this.head = head;
		this.province = province;
		this.city = city;
		this.register_time = register_time;
		this.last_login_time = last_login_time;
		this.ban_time = ban_time;
		this.album = album;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", age=" + age + ", sex=" + sex
				+ ", phone=" + phone + ", introduction=" + introduction + ", head=" + head + ", province=" + province
				+ ", city=" + city + ", register_time=" + register_time + ", last_login_time=" + last_login_time
				+ ", ban_time=" + ban_time + ", album=" + album + "]";
	}
	
	
}
