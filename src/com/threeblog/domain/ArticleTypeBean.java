package com.threeblog.domain;

public class ArticleTypeBean {
	
	private String id;
	private String author_id;
	private String article_id;
	private String article_type;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAuthor_id() {
		return author_id;
	}
	public void setAuthor_id(String author_id) {
		this.author_id = author_id;
	}
	public String getArticle_id() {
		return article_id;
	}
	public void setArticle_id(String article_id) {
		this.article_id = article_id;
	}
	public String getArticle_type() {
		return article_type;
	}
	public void setArticle_type(String article_type) {
		this.article_type = article_type;
	}
	@Override
	public String toString() {
		return "ArticleTypeBean [id=" + id + ", author_id=" + author_id + ", article_id=" + article_id
				+ ", article_type=" + article_type + "]";
	}
	public ArticleTypeBean(String id, String author_id, String article_id, String article_type) {
		super();
		this.id = id;
		this.author_id = author_id;
		this.article_id = article_id;
		this.article_type = article_type;
	}
	public ArticleTypeBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
