package com.threeblog.service;

import java.util.Date;
import java.util.List;
import java.sql.SQLException;

import com.threeblog.domain.AdminBean;
import com.threeblog.domain.NoticeBean;

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

	/**
	 * 修改密码（忘记密码）
	 * @param phone
	 * @param password
	 * @return
	 * @throws SQLException
	 */
	boolean changePasswd(String phone, String password)throws SQLException;

	/**
	 * 新增公告
	 * @param notice
	 * @return
	 * @throws SQLException
	 */
	boolean addNotice(NoticeBean notice)throws SQLException;
	
	/**
	 * 通过id查找对应公告
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	NoticeBean fingNoticeById(String id)throws SQLException;
	
	/**
	 * 查找到最新一篇
	 * @return
	 * @throws SQLException
	 */
	NoticeBean findLatelyNotice()throws SQLException;
	
	/**
	 * 查找上一篇公告
	 * @param pDate
	 * @return
	 * @throws SQLException
	 */
	NoticeBean findLastNoticeByPubDate(Date pDate)throws SQLException;
	
	/**
	 * 查找下一篇公告
	 * @param pDate
	 * @return
	 * @throws SQLException
	 */
	NoticeBean findNextNoticeByPubDate(Date pDate)throws SQLException;

	/**
	 * 查找所有公告
	 * @return
	 * @throws SQLException
	 */
	List<NoticeBean> findAllNotice()throws SQLException;
}
