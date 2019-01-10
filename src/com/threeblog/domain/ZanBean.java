package com.threeblog.domain;

import java.util.Date;

public class ZanBean {
	
	private String id;
	private String type;
	private String receiver_id;
	private String sender_id;
	private String article_id;
	private String text;
	private Date add_time;
	private String status;
	private String zpic;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getReceiver_id() {
		return receiver_id;
	}
	public void setReceiver_id(String receiver_id) {
		this.receiver_id = receiver_id;
	}
	public String getSender_id() {
		return sender_id;
	}
	public void setSender_id(String sender_id) {
		this.sender_id = sender_id;
	}
	public String getArticle_id() {
		return article_id;
	}
	public void setArticle_id(String article_id) {
		this.article_id = article_id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Date getAdd_time() {
		return add_time;
	}
	public void setAdd_time(Date add_time) {
		this.add_time = add_time;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getZpic() {
		return zpic;
	}
	public void setZpic(String zpic) {
		this.zpic = zpic;
	}
	@Override
	public String toString() {
		return "ZanBean [id=" + id + ", type=" + type + ", receiver_id=" + receiver_id + ", sender_id=" + sender_id
				+ ", article_id=" + article_id + ", text=" + text + ", add_time=" + add_time + ", status=" + status
				+ ", zpic=" + zpic + "]";
	}
	public ZanBean(String id, String type, String receiver_id, String sender_id, String article_id, String text,
			Date add_time, String status, String zpic) {
		super();
		this.id = id;
		this.type = type;
		this.receiver_id = receiver_id;
		this.sender_id = sender_id;
		this.article_id = article_id;
		this.text = text;
		this.add_time = add_time;
		this.status = status;
		this.zpic = zpic;
	}
	public ZanBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
