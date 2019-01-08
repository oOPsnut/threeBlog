package com.threeblog.serviceImpl;

import java.sql.Date;
import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.threeblog.dao.UserDao;
import com.threeblog.daoImpl.UserDaoImpl;
import com.threeblog.domain.UserBean;
import com.threeblog.service.UserService;
import com.threeblog.util.JDBCUtil;

public class UserServiceImpl implements UserService{

	@Override
	public UserBean userLogin(UserBean user) throws SQLException {
		//实现登陆功能
		UserDao dao = new UserDaoImpl();
		UserBean userBean = dao.userLogin(user);
		return userBean;
	}

	@Override
	public boolean userRegister(String id,String phone, String username, String password,Date register_time) throws SQLException{
		//实现注册功能
		UserDao dao=new UserDaoImpl();
		boolean result = dao.userRegister(id,phone, username, password,register_time);
		return result;
	}

	@Override
	public boolean checkPhone(String phone) throws SQLException {
		//实现电话号码存在检测功能
		UserDao dao=new UserDaoImpl();
		boolean flag = dao.checkPhone(phone);
		return flag;
	}

	@Override
	public boolean checkUserName(String username) throws SQLException {
		//实现用户名存在检测功能
		UserDao dao=new UserDaoImpl();
		boolean flag = dao.checkUserName(username);
		return flag;
	}

	@Override
	public String sendCode(String phone, int code) throws SQLException {
		// 第三方电话短信服务
		UserDao dao=new UserDaoImpl();
		String result = dao.sendCode(phone, code);
		return result;
		
	}

	@Override
	public boolean changePasswd(String phone, String password) throws SQLException {
		//用户修改密码
		UserDao dao = new UserDaoImpl();
		boolean result = dao.changePasswd(phone,password);
		return result;
	}

	@Override
	public boolean changeLoginTime(String id, Date last_login_time) throws SQLException{
		//通过id改变登录时间
		UserDao dao = new UserDaoImpl();
		boolean result = dao.changeLoginTime(id,last_login_time);
		return result;
	}

	@Override
	public boolean changeInfo(UserBean user) throws SQLException {
		//通过id改变个人信息
		UserDao dao = new UserDaoImpl();
		boolean c=dao.changeInfo(user);
		return c;
	}

	@Override
	public UserBean findUserInfo(String id) throws SQLException {
		// 通过id查询所有个人信息
		UserDao dao=new UserDaoImpl();
		UserBean userBean = dao.findUserInfo(id);
		return userBean;
	}

}
