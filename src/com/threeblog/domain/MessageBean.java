package com.threeblog.domain;

import java.util.Date;

public class MessageBean {

	private String id;
	private String type;
	private String receiver_id;
	private String answer_id;
	private String article_id;
	private String text1;
	private String text2;
	private Date add_time;
	private String status;
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
	public String getAnswer_id() {
		return answer_id;
	}
	public void setAnswer_id(String answer_id) {
		this.answer_id = answer_id;
	}
	public String getArticle_id() {
		return article_id;
	}
	public void setArticle_id(String article_id) {
		this.article_id = article_id;
	}
	public String getText1() {
		return text1;
	}
	public void setText1(String text1) {
		this.text1 = text1;
	}
	public String getText2() {
		return text2;
	}
	public void setText2(String text2) {
		this.text2 = text2;
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
	@Override
	public String toString() {
		return "MessageBean [id=" + id + ", type=" + type + ", receiver_id=" + receiver_id + ", answer_id=" + answer_id
				+ ", article_id=" + article_id + ", text1=" + text1 + ", text2=" + text2 + ", add_time=" + add_time
				+ ", status=" + status + "]";
	}
	public MessageBean(String id, String type, String receiver_id, String answer_id, String article_id, String text1,
			String text2, Date add_time, String status) {
		super();
		this.id = id;
		this.type = type;
		this.receiver_id = receiver_id;
		this.answer_id = answer_id;
		this.article_id = article_id;
		this.text1 = text1;
		this.text2 = text2;
		this.add_time = add_time;
		this.status = status;
	}
	public MessageBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
