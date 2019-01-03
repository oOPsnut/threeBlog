package com.threeblog.service;

import java.sql.Date;
import java.sql.SQLException;

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
	boolean userRegister(String phone, String username, String password,Date register_time)throws SQLException;
	
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
	boolean changeLoginTime(int id, Date last_login_time) throws SQLException;
	
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
	UserBean findUserInfo(int id)throws SQLException;
}
