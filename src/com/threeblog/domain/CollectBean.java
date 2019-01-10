package com.threeblog.domain;

import java.util.Date;

public class CollectBean {
	
	private String id;
	private String user_id;
	private String article_id;
	private String author_id;
	private Date collect_date;
	private String status;
	private String cpic;
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
	public Date getCollect_date() {
		return collect_date;
	}
	public void setCollect_date(Date collect_date) {
		this.collect_date = collect_date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCpic() {
		return cpic;
	}
	public void setCpic(String cpic) {
		this.cpic = cpic;
	}
	@Override
	public String toString() {
		return "CollectBean [id=" + id + ", user_id=" + user_id + ", article_id=" + article_id + ", author_id="
				+ author_id + ", collect_date=" + collect_date + ", status=" + status + ", cpic=" + cpic + "]";
	}
	public CollectBean(String id, String user_id, String article_id, String author_id, Date collect_date, String status,
			String cpic) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.article_id = article_id;
		this.author_id = author_id;
		this.collect_date = collect_date;
		this.status = status;
		this.cpic = cpic;
	}
	public CollectBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
