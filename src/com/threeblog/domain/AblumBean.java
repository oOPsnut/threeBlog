package com.threeblog.domain;

import java.util.Date;

public class AblumBean {

	private String id;
	private String user_id;
	private String photo;
	private Date upload_date;
	private String status;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public Date getUpload_date() {
		return upload_date;
	}
	public void setUpload_date(Date upload_date) {
		this.upload_date = upload_date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "AblumBean [id=" + id + ", user_id=" + user_id + ", photo=" + photo + ", upload_date=" + upload_date
				+ ", status=" + status + "]";
	}
	public AblumBean(String id, String user_id, String photo, Date upload_date, String status) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.photo = photo;
		this.upload_date = upload_date;
		this.status = status;
	}
	public AblumBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
