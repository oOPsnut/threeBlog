package com.threeblog.dao;

import java.sql.SQLException;
import java.util.List;

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
	
	/**
	 * 通过用户id获取所有消息
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	List<MessageBean> findMessagesByUid(String uid)throws SQLException;
	
	/**
	 * 通过用户id获取所有未读消息（评论）
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	List<MessageBean> findnotReadReviewsMessagesByUid(String uid)throws SQLException;
	
	/**
	 * 通过用户id获取所有已读消息（评论）
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	List<MessageBean> findReadReviewsMessagesByUid(String uid)throws SQLException;
	
	/**
	 * 将未读改成已读
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	boolean Read(String id)throws SQLException;
	
	/**
	 *  通过用户id获取所有未读消息（点赞）
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	List<MessageBean> findnotReadZanMessagesByUid(String uid)throws SQLException;
	
	/**
	 *  通过用户id获取所有已读消息（点赞）
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	List<MessageBean> findReadZanMessagesByUid(String uid)throws SQLException;
	
	/**
	 * 通过用户id获取所有未读消息（收藏）
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	List<MessageBean> findnotReadFavorMessagesByUid(String uid)throws SQLException;
	
	/**
	 * 通过用户id获取所有已读消息（收藏）
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	List<MessageBean> findReadFavorMessagesByUid(String uid)throws SQLException;
}
