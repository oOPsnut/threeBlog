package com.threeblog.domain;

import java.util.Date;

public class CommentBean {

	private String id;
	private String article_id;
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
	public String getArticle_id() {
		return article_id;
	}
	public void setArticle_id(String article_id) {
		this.article_id = article_id;
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
		return "CommentBean [id=" + id + ", article_id=" + article_id + ", author_id=" + author_id + ", text=" + text
				+ ", add_time=" + add_time + ", zan=" + zan + ", status=" + status + "]";
	}
	public CommentBean(String id, String article_id, String author_id, String text, Date add_time, int zan,
			String status) {
		super();
		this.id = id;
		this.article_id = article_id;
		this.author_id = author_id;
		this.text = text;
		this.add_time = add_time;
		this.zan = zan;
		this.status = status;
	}
	public CommentBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
