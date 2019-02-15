package com.threeblog.serviceImpl;

import java.sql.Date;
import java.sql.SQLException;

import com.threeblog.dao.AdminDao;
import com.threeblog.dao.UserDao;
import com.threeblog.daoImpl.AdminDaoImpl;
import com.threeblog.daoImpl.UserDaoImpl;
import com.threeblog.domain.AdminBean;
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

}
