package com.threeblog.dao;

import java.sql.SQLException;

import com.threeblog.domain.CollectBean;

/***
 *  这是针对 收藏表 的数据访问
 * @author Liang
 *
 */
public interface CollectDao {

	/**
	 * 将文章收藏信息写进表
	 * @param collect
	 * @return
	 * @throws SQLException
	 */
	boolean addArticleCollect(CollectBean collect)throws SQLException;

	/**
	 * 通过收藏id找到收藏信息
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	CollectBean findArticleCollect(String id)throws SQLException;
	
	/**
	 * 通过收藏id更新收藏图标
	 * @param collect
	 * @return
	 * @throws SQLException
	 */
	boolean UpdateArticleCollect(CollectBean collect)throws SQLException;
	
	/**
	 * 通过用户id和文章id找到收藏信息
	 * @param uid
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	CollectBean findACollect(String uid,String id)throws SQLException;
}
