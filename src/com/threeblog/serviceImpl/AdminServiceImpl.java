package com.threeblog.serviceImpl;

import java.util.Date;
import java.util.List;
import java.sql.SQLException;

import com.threeblog.dao.AdminDao;
import com.threeblog.dao.NoticeDao;
import com.threeblog.dao.ReportDao;
import com.threeblog.dao.UserDao;
import com.threeblog.daoImpl.AdminDaoImpl;
import com.threeblog.daoImpl.NoticeDaoImpl;
import com.threeblog.daoImpl.ReportDaoImpl;
import com.threeblog.daoImpl.UserDaoImpl;
import com.threeblog.domain.AdminBean;
import com.threeblog.domain.NoticeBean;
import com.threeblog.domain.ReportBean;
import com.threeblog.service.AdminService;

public class AdminServiceImpl implements AdminService {

	@Override
	public boolean checkPhone(String phone) throws SQLException {
		//实现电话号码存在检测功能
		AdminDao dao=new AdminDaoImpl();
		boolean flag = dao.checkPhone(phone);
		return flag;
	}

	@Override
	public boolean checkUserName(String username) throws SQLException {
		//实现用户名存在检测功能
		AdminDao dao=new AdminDaoImpl();
		boolean flag = dao.checkUserName(username);
		return flag;
	}

	@Override
	public boolean CheckLicenseCode(String phone, String license_code) throws SQLException {
		// 检测授权码是否正确
		AdminDao dao = new AdminDaoImpl();
		boolean flag = dao.CheckLicenseCode(phone, license_code);
		return flag;
	}

	@Override
	public boolean AdminRegister(String phone, String username, String password, Date register_time)throws SQLException {
		// 注册
		AdminDao dao = new AdminDaoImpl();
		boolean flag = dao.AdminRegister(phone, username, password, register_time);
		return flag;
	}

	@Override
	public AdminBean AdminLogin(AdminBean admin) throws SQLException {
		// 登录
		AdminDao dao = new AdminDaoImpl();
		AdminBean adminBean = dao.AdminLogin(admin);
		return adminBean;
	}

	@Override
	public void changeLoginTime(String id, Date last_login_time) throws SQLException {
		// 更新登陆时间
		AdminDao dao = new AdminDaoImpl();
		dao.changeLoginTime(id, last_login_time);
	}

	@Override
	public boolean changePasswd(String phone, String password) throws SQLException {
		// 修改密码（忘记密码）
		AdminDao dao = new AdminDaoImpl();
		boolean flag = dao.changePasswd(phone, password);
		return flag;
	}

	@Override
	public boolean addNotice(NoticeBean notice) throws SQLException {
		// 新增公告
		NoticeDao dao  = new NoticeDaoImpl();
		boolean result = dao.addNotice(notice);
		return result;
	}

	@Override
	public NoticeBean fingNoticeById(String id) throws SQLException {
		// 通过id查找对应公告
		NoticeDao dao = new NoticeDaoImpl();
		NoticeBean noticeBean = dao.fingNoticeById(id);
		return noticeBean;
	}

	@Override
	public NoticeBean findLatelyNotice() throws SQLException {
		// 查找到最新一篇
		NoticeDao dao= new NoticeDaoImpl();
		NoticeBean notice = dao.findLatelyNotice();
		return notice;
	}

	@Override
	public NoticeBean findLastNoticeByPubDate(Date pDate) throws SQLException {
		// 查找上一篇公告
		NoticeDao dao = new NoticeDaoImpl();
		NoticeBean noticeBean = dao.findLastNoticeByPubDate(pDate);
		return noticeBean;
	}

	@Override
	public NoticeBean findNextNoticeByPubDate(Date pDate) throws SQLException {
		// 查找下一篇公告
		NoticeDao dao = new NoticeDaoImpl();
		NoticeBean noticeBean = dao.findNextNoticeByPubDate(pDate);
		return noticeBean;
	}

	@Override
	public List<NoticeBean> findAllNotice() throws SQLException {
		// 查找所有公告
		NoticeDao dao = new NoticeDaoImpl();
		List<NoticeBean> list = dao.findAllNotice();
		return list;
	}

	@Override
	public boolean deleteNotice(String id) throws SQLException {
		// 删除公告
		NoticeDao dao = new NoticeDaoImpl();
		boolean notice = dao.deleteNotice(id);
		return notice;
	}

	@Override
	public AdminBean findAdminByAUsername(String admin_username) throws SQLException {
		// 通过管理员名字找到管理员信息
		AdminDao dao = new AdminDaoImpl();
		AdminBean adminBean = dao.findAdminByAUsername(admin_username);
		return adminBean;
	}

	@Override
	public boolean limitUser(String username, Date ban_time) throws SQLException {
		//限制用户（封号）
		UserDao dao = new UserDaoImpl();
		boolean result = dao.limitUser(username, ban_time);
		return result;
	}

	@Override
	public boolean checkPasswd(String id, String password) throws SQLException {
		// 检查密码是否正确（添加管理员）
		AdminDao dao = new AdminDaoImpl();
		boolean checkPasswd = dao.checkPasswd(id, password);
		return checkPasswd;
	}

	@Override
	public boolean checkAdminPhone(String phone) throws SQLException {
		// 检查手机号是否使用过（添加管理员）
		AdminDao dao = new AdminDaoImpl();
		boolean adminPhone = dao.checkAdminPhone(phone);
		return adminPhone;
	}

	@Override
	public boolean addAdmin(AdminBean admin) throws SQLException {
		// 添加管理员
		AdminDao dao = new AdminDaoImpl();
		boolean addAdmin = dao.addAdmin(admin);
		return addAdmin;
	}

	@Override
	public List<AdminBean> findAllAdmin() throws SQLException {
		// 查找所有管理员
		AdminDao dao = new AdminDaoImpl();
		List<AdminBean> list = dao.findAllAdmin();
		return list;
	}

	@Override
	public boolean DeleteAdmin(String id) throws SQLException {
		// 删除管理员
		AdminDao dao = new AdminDaoImpl();
		boolean admin = dao.DeleteAdmin(id);
		return admin;
	}

	@Override
	public List<ReportBean> findAllReport() throws SQLException {
		// 查找所有举报信息
		ReportDao dao = new ReportDaoImpl();
		List<ReportBean> list = dao.findAllReport();
		return list;
	}

	@Override
	public List<ReportBean> findAllReportMessage() throws SQLException {
		// 查找所有举报信息(举报消息)
		ReportDao dao = new ReportDaoImpl();
		List<ReportBean> list = dao.findAllReportMessage();
		return list;
	}

	@Override
	public List<ReportBean> findAllRenewMessage() throws SQLException {
		// 查找所有举报信息(反馈消息)
		ReportDao dao = new ReportDaoImpl();
		List<ReportBean> list = dao.findAllRenewMessage();
		return list;
	}

	@Override
	public Long countReports() throws SQLException {
		// 计算消息数目（举报消息）
		ReportDao dao  = new ReportDaoImpl();
		Long reports = dao.countReports();
		return reports;
	}

	@Override
	public Long countRenews() throws SQLException {
		// 计算消息数目（反馈消息）
		ReportDao dao = new ReportDaoImpl();
		Long renews = dao.countRenews();
		return renews;
	}

	@Override
	public boolean ReadReport(String id,Date notice_time) throws SQLException {
		// 更新举报消息（已阅）
		ReportDao dao = new ReportDaoImpl();
		boolean report = dao.ReadReport(id,notice_time);
		return report;
	}

	@Override
	public boolean changeReport(String rid,Date notice_time) throws SQLException {
		// 更新举报消息（屏蔽）
		ReportDao dao = new ReportDaoImpl();
		boolean report = dao.changeReport(rid,notice_time);
		return report;
	}

}
