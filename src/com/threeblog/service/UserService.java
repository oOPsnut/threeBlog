package com.threeblog.service;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import com.threeblog.domain.AblumBean;
import com.threeblog.domain.FollowBean;
import com.threeblog.domain.MessageBean;
import com.threeblog.domain.UserBean;

/**
 * 这是针对于用户的业务处理规范
 * @author Liang
 *
 */
public interface UserService {

	/**
	 * 执行登录，并且返回该用户的所有信息
	 * 根据电话和密码来查找用户
	 */
	UserBean userLogin(UserBean user) throws SQLException;
	
	/**
	 * 注册
	 * @param phone
	 * @param username
	 * @param password
	 */
	boolean userRegister(String id,String phone, String username, String password,Date register_time)throws SQLException;
	
	/**
	 * 检测电话号是否已经注册
	 * @param phone
	 */
	boolean checkPhone(String phone)throws SQLException;
	
	/***
	 * 检测用户名是否使用
	 * @param username
	 * @return
	 * @throws SQLException
	 */
	boolean checkUserName(String username) throws SQLException;
	
	/***
	 * 发送验证码到电话服务
	 * @param phone
	 * @param code
	 * @throws SQLException
	 */
	String sendCode(String phone,int code) throws SQLException;
	
	/***
	 * 用户修改密码
	 * @param phone
	 * @param password
	 * @throws SQLException
	 */
	boolean changePasswd(String phone,String password)throws SQLException;
	
	/**
	 * 通过id修改对应登录时间
	 * @param id
	 * @param last_login_time
	 */
	boolean changeLoginTime(String id, Date last_login_time) throws SQLException;
	
	/**
	 * 通过id修改个人信息
	 * @param user
	 * @throws SQLException
	 */
	boolean changeInfo(UserBean user) throws SQLException;
	
	/**
	 * 通过id查询所有个人信息
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	UserBean findUserInfo(String id)throws SQLException;

	/**
	 * 添加消息
	 * @param message
	 * @throws SQLException
	 */
	void addMessage(MessageBean message)throws SQLException;
	
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
	 * 通过用户电话和用户原密码检测原密码是否一致
	 * @param phone
	 * @param password
	 * @return
	 * @throws SQLException
	 */
	boolean checkOldPasswd(String phone, String password)throws SQLException;
	
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
	 * 通过用户id，查找到所有相册图片信息，返回list 集合
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	List<AblumBean> findUserPhotosByUid(String uid)throws SQLException;
	
	/**
	 * 添加照片
	 * @param ablum
	 * @return
	 * @throws SQLException
	 */
	boolean addAblum(AblumBean ablum)throws SQLException;
}
