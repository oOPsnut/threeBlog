package com.threeblog.dao;

import java.sql.SQLException;

/**
 * 这是针对  关注表  的数据操作
 * @author Liang
 *
 */
public interface FollowDao {

	/**
	 * 通过用户id查找关注数
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	Long countFollowing(String uid)throws SQLException;
	
	/**
	 * 通过用户id查找粉丝数
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	Long countFollower(String uid)throws SQLException;
}
