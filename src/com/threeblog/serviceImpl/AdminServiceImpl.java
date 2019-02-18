package com.threeblog.serviceImpl;

import java.util.Date;
import java.util.List;
import java.sql.SQLException;

import com.threeblog.dao.AdminDao;
import com.threeblog.dao.NoticeDao;
import com.threeblog.dao.UserDao;
import com.threeblog.daoImpl.AdminDaoImpl;
import com.threeblog.daoImpl.NoticeDaoImpl;
import com.threeblog.daoImpl.UserDaoImpl;
import com.threeblog.domain.AdminBean;
import com.threeblog.domain.NoticeBean;
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

}
