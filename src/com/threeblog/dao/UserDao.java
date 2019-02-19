package com.threeblog.dao;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import com.threeblog.domain.UserBean;

/**
 * 这是针对用户表的数据访问
 */
public interface UserDao {
	
	/**
	 * 执行登录，并且返回该用户的所有信息
	 * 根据电话和密码来查找用户
	 */
	UserBean userLogin(UserBean user) throws SQLException;
	
	/**
	 * 用于检测用户名是否存在
	 * @param username
	 * @return true ：存在，false： 不存在
	 */
	boolean checkUserName(String username) throws SQLException;
	
	/**
	 * 用于检测手机号是否注册过
	 * @param phone
	 * @return
	 * @throws SQLException
	 */
	boolean checkPhone(String phone) throws SQLException;
	
	/**
	 * 用户注册
	 * @param phone
	 * @param username
	 * @param password
	 */
	boolean userRegister(String id,String phone, String username, String password,Date register_time) throws SQLException;
	
	/**
	 * 用于调用第三方短信服务
	 * @param phone
	 * @param code
	 * @throws SQLException
	 */
	String sendCode(String phone , int code) throws SQLException;
	
	/**
	 * 用于修改密码
	 * @param phone
	 * @param password
	 * @throws SQLException
	 */
	boolean changePasswd(String phone, String password)throws SQLException;
	
	
	/**
	 * 通过id改变登录时间
	 * @param id
	 * @param last_login_time
	 */
	boolean changeLoginTime(String id, Date last_login_time) throws SQLException;
	
	/**
	 * 通过id改变个人信息
	 * @param user
	 * @return
	 * @throws SQLException
	 */
	boolean changeInfo(UserBean user)throws SQLException;
	
	/**
	 * 通过id查询所有个人信息
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	UserBean findUserInfo(String id)throws SQLException;
	
	/**
	 * 通过用户电话和用户原密码检测原密码是否一致
	 * @param phone
	 * @param password
	 * @return
	 * @throws SQLException
	 */
	boolean checkOldPasswd(String phone, String password)throws SQLException;
	
	/**
	 * 统计所有注册用户数
	 * @return
	 * @throws SQLException
	 */
	Long CountTotalUsers()throws SQLException;
	
	/**
	 * 全年新增用户数
	 * @param currentYear
	 * @return
	 * @throws SQLException
	 */
	Long countTotalUserByYear(int currentYear)throws SQLException;
	
	/**
	 * 查找最近登陆的20人
	 * @return
	 * @throws SQLException
	 */
	List<UserBean> findLastLoginUser()throws SQLException;
	
	/**
	 * 限制用户（封号）
	 * @param username
	 * @param ban_time
	 * @return
	 * @throws SQLException
	 */
	boolean limitUser(String username, java.util.Date ban_time)throws SQLException;
	
	/**
	 * 查找所有用户
	 * @return
	 * @throws SQLException
	 */
	List<UserBean> fingAllUser()throws SQLException;
	
	/**
	 * 更改用户头像（涉嫌违规图片）
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	boolean ChangeUserHead(String id)throws SQLException;
}
