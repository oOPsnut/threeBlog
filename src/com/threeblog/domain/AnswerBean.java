package com.threeblog.domain;

import java.sql.Timestamp;
import java.util.Date;

public class AnswerBean {
	
	private String id;
	private String comment_id;
	private String author_id;
	private String text;
	private Date add_time;
	private int zan;
	private String status;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getComment_id() {
		return comment_id;
	}
	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}
	public String getAuthor_id() {
		return author_id;
	}
	public void setAuthor_id(String author_id) {
		this.author_id = author_id;
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
	public int getZan() {
		return zan;
	}
	public void setZan(int zan) {
		this.zan = zan;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "AnswerBean [id=" + id + ", comment_id=" + comment_id + ", author_id=" + author_id + ", text=" + text
				+ ", add_time=" + add_time + ", zan=" + zan + ", status=" + status + "]";
	}
	public AnswerBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AnswerBean(String id, String comment_id, String author_id, String text, Date add_time, int zan,
			String status) {
		super();
		this.id = id;
		this.comment_id = comment_id;
		this.author_id = author_id;
		this.text = text;
		this.add_time = add_time;
		this.zan = zan;
		this.status = status;
	}
	
	
}
