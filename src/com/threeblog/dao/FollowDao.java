package com.threeblog.dao;

import java.sql.SQLException;
import java.util.List;

import com.threeblog.domain.FollowBean;
import com.threeblog.domain.MessageBean;

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
	
	/**
	 * 通过用户id查找关注的用户
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	List<FollowBean> getFollowingsByUid(String uid)throws SQLException;
	
	/**
	 * 通过用户id查找粉丝
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	List<FollowBean> getFollowersByUid(String uid)throws SQLException;
	
	/**
	 * 判断两用户关注状态
	 * @param id1
	 * @param id2
	 * @return
	 * @throws SQLException
	 */
	boolean findFollowStatus(String id1,String id2)throws SQLException;
	
	/**
	 * 添加关注
	 * @param follow
	 * @return
	 * @throws SQLException
	 */
	boolean addFollow(FollowBean follow)throws SQLException;
	
	/**
	 * 取消关注
	 * @param following_id
	 * @param follower_id
	 * @return
	 */
	boolean cancelFollow(String following_id, String follower_id)throws SQLException;
	
	/**
	 * 通过用户id获取关注消息数目
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	Long countFollows(String uid)throws SQLException;
	
	/**
	 * 通过用户id获取所有未读消息（关注）
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	List<FollowBean> findnotReadFollowMessagesByUid(String uid)throws SQLException;
	
	/**
	 * 通过用户id获取所有已读消息（关注）
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	List<FollowBean> findReadFollowMessagesByUid(String uid)throws SQLException;
	
	/**
	 * 将未读改成已读(关注)
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	boolean fRead(String id)throws SQLException;
}
