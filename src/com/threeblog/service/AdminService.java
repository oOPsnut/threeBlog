package com.threeblog.service;

import java.util.Date;
import java.util.List;
import java.sql.SQLException;

import com.threeblog.domain.AdminBean;
import com.threeblog.domain.NoticeBean;
import com.threeblog.domain.ReportBean;

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

	/**
	 * 删除公告
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	boolean deleteNotice(String id)throws SQLException;

	/**
	 * 通过管理员名字找到管理员信息
	 * @param admin_username
	 * @return
	 * @throws SQLException
	 */
	AdminBean findAdminByAUsername(String admin_username) throws SQLException;

	/**
	 * 限制用户（封号）
	 * @param username
	 * @param ban_time
	 * @return
	 * @throws SQLException
	 */
	boolean limitUser(String username, Date ban_time)throws SQLException;

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
	
	/**
	 * 查找所有举报信息
	 * @return
	 * @throws SQLException
	 */
	List<ReportBean> findAllReport()throws SQLException;
	
	/**
	 * 查找所有举报信息(举报消息)
	 * @return
	 * @throws SQLException
	 */
	List<ReportBean> findAllReportMessage()throws SQLException;
	
	/**
	 * 查找所有举报信息(反馈消息)
	 * @return
	 * @throws SQLException
	 */
	List<ReportBean> findAllRenewMessage()throws SQLException;
	
	/**
	 * 计算消息数目（举报消息）
	 * @return
	 * @throws SQLException
	 */
	Long countReports()throws SQLException;
	
	/**
	 * 计算消息数目（反馈消息）
	 * @return
	 * @throws SQLException
	 */
	Long countRenews()throws SQLException;

	/**
	 * 更新举报消息（已阅）
	 * @param id
	 * @param notice_time
	 * @return
	 * @throws SQLException
	 */
	boolean ReadReport(String id,Date notice_time)throws SQLException;

	/**
	 * 更新举报消息（屏蔽）
	 * @param rid
	 * @param notice_time
	 * @return
	 * @throws SQLException
	 */
	boolean changeReport(String rid,Date notice_time)throws SQLException;

	/**
	 * 更新举报消息（反馈通过）
	 * @param rid
	 * @param notice_time
	 * @return
	 * @throws SQLException
	 */
	boolean PassRenew(String rid, Date notice_time)throws SQLException;

	/**
	 * 更新举报消息（反馈不通过）
	 * @param id
	 * @param notice_time
	 * @return
	 * @throws SQLException
	 */
	boolean NotPassRenew(String id, Date notice_time)throws SQLException;
	
	/**
	 * 计算目标的被举报数
	 * @param cid
	 * @return
	 * @throws SQLException
	 */
	Long countArticleReportByCid(String cid)throws SQLException;
}
