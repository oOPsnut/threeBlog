package com.threeblog.dao;

import java.util.Date;
import java.util.List;
import java.sql.SQLException;

import com.threeblog.domain.AdminBean;

/**
 * 这是针对 管理员表 的数据访问
 * @author Liang
 *
 */
public interface AdminDao {
	
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
	
	/**
	 * 修改密码（忘记密码）
	 * @param phone
	 * @param password
	 * @return
	 * @throws SQLException
	 */
	boolean changePasswd(String phone, String password)throws SQLException;

	/**
	 * 通过管理员名字找到管理员信息
	 * @param admin_username
	 * @return
	 * @throws SQLException
	 */
	AdminBean findAdminByAUsername(String admin_username) throws SQLException;
	
	/**
	 * 检查密码是否正确（添加管理员）
	 * @param id
	 * @param password
	 * @return
	 * @throws SQLException
	 */
	boolean checkPasswd(String id, String password)throws SQLException;
	
	/**
	 * 检查手机号是否使用过（添加管理员）
	 * @param phone
	 * @return
	 * @throws SQLException
	 */
	boolean checkAdminPhone(String phone) throws SQLException;
	
	/**
	 * 添加管理员
	 * @param admin
	 * @return
	 * @throws SQLException
	 */
	boolean addAdmin(AdminBean admin)throws SQLException;
	
	/**
	 * 查找所有管理员
	 * @return
	 * @throws SQLException
	 */
	List<AdminBean> findAllAdmin()throws SQLException;
	
	/**
	 * 删除管理员
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	boolean DeleteAdmin(String id)throws SQLException;
}
