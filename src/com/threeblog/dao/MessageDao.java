package com.threeblog.dao;

import java.sql.SQLException;

import com.threeblog.domain.MessageBean;

/**
 *  这是针对 消息表 的数据访问
 * @author Liang
 *
 */
public interface MessageDao {

	/**
	 * 添加消息
	 * @param message
	 * @throws SQLException
	 */
	void addMessage(MessageBean message)throws SQLException;
	
	/**
	 * 通过用户id获取评论消息数目
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	Long countReviews(String uid)throws SQLException;
	
	/**
	 * 通过用户id获取关注消息数目
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	Long countFollows(String uid)throws SQLException;
	
	/**
	 * 通过用户id获取收藏消息数目
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	Long countCollects(String uid)throws SQLException;
	
	/**
	 * 通过用户id获取点赞消息数目
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	Long countZans(String uid)throws SQLException;
}
