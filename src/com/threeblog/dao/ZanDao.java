package com.threeblog.dao;

import java.sql.SQLException;

import com.threeblog.domain.ZanBean;

/**
 * 这是针对 点赞表  的数据访问
 * @author Liang
 *
 */
public interface ZanDao {

	/**
	 *  将文章点赞信息写进表
	 * @param zan
	 * @return
	 * @throws SQLException
	 */
	boolean addArticleZan(ZanBean zan)throws SQLException;

	/**
	 * 通过赞id找到赞信息
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	ZanBean findArticleZan(String id) throws SQLException;
	
	/**
	 * 通过用户id和文章id找到赞信息
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	ZanBean findAZan(String uid ,String id)throws SQLException;
	
	/**
	 * 通过点赞id更新点赞图标
	 * @param zan
	 * @return
	 * @throws SQLException
	 */
	boolean UpdateArticleZan(ZanBean zan)throws SQLException;
	
	/**
	 * 添加留言点赞
	 * @param zanBean
	 * @return
	 * @throws SQLException
	 */
	boolean addCommentZan(ZanBean zanBean)throws SQLException;
	
	/**
	 * 取消留言点赞
	 * @param id
	 * @param type2
	 * @throws SQLException
	 */
	void cancelCommentZan(String id, String type2)throws SQLException;
	
	/**
	 * 添加留言回复点赞
	 * @param zanBean
	 * @return
	 * @throws SQLException
	 */
	boolean addAnswerZan(ZanBean zanBean)throws SQLException;
	
	/**
	 * 取消留言回复点赞
	 * @param id
	 * @param type2
	 * @throws SQLException
	 */
	void cancelAnswerZan(String id, String type2)throws SQLException;
}
