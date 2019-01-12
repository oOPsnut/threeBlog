package com.threeblog.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.threeblog.domain.CommentBean;

/**
 * 这是针对 文章评论表 的数据访问
 * @author Liang
 *
 */
public interface CommentDao {

	/**
	 * 通过文章id找到评论
	 * @param aid
	 * @return
	 * @throws SQLException
	 */
	List<CommentBean> getCommentsFromArticle_id(String aid)throws SQLException;
	
	/**
	 * 将文章评论写进表
	 * @param comment
	 */
	boolean addArticleComment(CommentBean comment)throws SQLException;
}
