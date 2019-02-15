package com.threeblog.service;

import java.sql.Date;
import java.sql.SQLException;

import com.threeblog.domain.AdminBean;

/**
 * 这是针对于管理员的业务处理规范
 * @author Liang
 *
 */
public interface AdminService {
	
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
	
	/**
	 * 检测授权码是否正确
	 * @param phone
	 * @param license_code
	 * @return
	 * @throws SQLException
	 */
	boolean CheckLicenseCode(String phone, String license_code)throws SQLException;

	/**
	 * 注册
	 * @param phone
	 * @param username
	 * @param password
	 * @param register_time
	 * @return
	 * @throws SQLException
	 */
	boolean AdminRegister(String phone, String username, String password, Date register_time)throws SQLException;

	/**
	 * 登录
	 * @param admin
	 * @return
	 * @throws SQLException
	 */
	AdminBean AdminLogin(AdminBean admin)throws SQLException;

	/**
	 * 更新登陆时间
	 * @param id
	 * @param last_login_time
	 * @throws SQLException
	 */
	void changeLoginTime(String id, Date last_login_time)throws SQLException;

}
