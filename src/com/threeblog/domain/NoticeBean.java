package com.threeblog.domain;

import java.util.Date;

/**
 * 这是公告信息封装的对象bean
 * @author Liang
 *
 */
public class NoticeBean {

	private String id;
	private String admin_id;
	private String admin_username;
	private String photo;
	private String title;
	private String type;
	private String content;
	private Date publish_date;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_username() {
		return admin_username;
	}
	public void setAdmin_username(String admin_username) {
		this.admin_username = admin_username;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getPublish_date() {
		return publish_date;
	}
	public void setPublish_date(Date publish_date) {
		this.publish_date = publish_date;
	}
	@Override
	public String toString() {
		return "NoticeBean [id=" + id + ", admin_id=" + admin_id + ", admin_username=" + admin_username + ", photo="
				+ photo + ", title=" + title + ", type=" + type + ", content=" + content + ", publish_date="
				+ publish_date + "]";
	}
	public NoticeBean(String id, String admin_id, String admin_username, String photo, String title, String type,
			String content, Date publish_date) {
		super();
		this.id = id;
		this.admin_id = admin_id;
		this.admin_username = admin_username;
		this.photo = photo;
		this.title = title;
		this.type = type;
		this.content = content;
		this.publish_date = publish_date;
	}
	public NoticeBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
