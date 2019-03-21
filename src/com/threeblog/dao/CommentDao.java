package com.threeblog.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.threeblog.domain.CommentBean;

/**
 * 这是针对 文章留言表 的数据访问
 * @author Liang
 *
 */
public interface CommentDao {

	/**
	 * 通过文章id找到留言
	 * @param aid
	 * @return
	 * @throws SQLException
	 */
	List<CommentBean> getCommentsFromArticle_id(String aid)throws SQLException;
	
	/**
	 * 将文章留言写进表
	 * @param comment
	 */
	boolean addArticleComment(CommentBean comment)throws SQLException;
	
	/**
	 * 通过文章留言id获得留言信息
	 * @param comment_id
	 * @return
	 * @throws SQLException
	 */
	CommentBean getCommentFromComment_id(String comment_id)throws SQLException;
	
	/**
	 * 通过文章留言id删除对应留言信息
	 * @param comment_id
	 * @return
	 * @throws SQLException
	 */
	boolean deleteArticleComment(String comment_id)throws SQLException;
	
	/***
	 * 通过文章留言id更新点赞数目
	 * @param comment_id
	 * @param zan
	 * @return
	 * @throws SQLException
	 */
	boolean UpdateCommentZan(String comment_id, int zan)throws SQLException;
	
	/**
	 * 屏蔽留言
	 * @param cid
	 * @return
	 * @throws SQLException
	 */
	boolean HideComment(String cid)throws SQLException;
	
	/**
	 * 留言反馈（通过）
	 * @param cid
	 * @return
	 * @throws SQLException
	 */
	boolean PassRenewComment(String cid)throws SQLException;
	
	/**
	 * 计算某用户的评论数
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	Long countComment(String uid)throws SQLException;
}
