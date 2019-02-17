package com.threeblog.daoImpl;

import java.sql.Date;
import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.threeblog.dao.AdminDao;
import com.threeblog.domain.AdminBean;
import com.threeblog.util.JDBCUtil;

public class AdminDaoImpl implements AdminDao {

	@Override
	public boolean checkPhone(String phone) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="select count(*) from t_admin where phone=?";
		Long result = (Long) runner.query(sql, new ScalarHandler(),phone);
		//System.out.println(result);
		return result>0;
	}

	@Override
	public boolean checkUserName(String username) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="select count(*) from t_admin where username=?";
		Long result = (Long) runner.query(sql,new ScalarHandler(),username);
		return result>0;
	}

	@Override
	public boolean CheckLicenseCode(String phone, String license_code) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="select count(*) from t_admin where phone=? and license_code=?";
		Long result = (Long) runner.query(sql,new ScalarHandler(),phone,license_code);
		return result>0;
	}

	@Override
	public boolean AdminRegister(String phone, String username, String password, Date register_time)throws SQLException {
		QueryRunner runner=new QueryRunner(JDBCUtil.getDataSource());
		String sql="update t_admin set username=?,password=?,register_time=? where phone=?";
		int result = runner.update(sql,username,password,register_time,phone);
		return result>0;
	}

	@Override
	public AdminBean AdminLogin(AdminBean admin) throws SQLException {
		QueryRunner runner =new QueryRunner(JDBCUtil.getDataSource());
		String sql="select * from t_admin where phone=? and password=?";
		return runner.query(sql, new BeanHandler<AdminBean>(AdminBean.class), admin.getPhone(),admin.getPassword());
	}

	@Override
	public void changeLoginTime(String id, Date last_login_time) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="update t_admin set last_login_time=? where id=?";
		runner.update(sql,last_login_time,id);
		
	}

	@Override
	public boolean changePasswd(String phone, String password) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		//UPDATE t_user SET PASSWORD='123456' WHERE phone='13642593642';
		String sql="update t_admin set password=? where phone=?;";
		int result = runner.update(sql,password,phone);
		return result>0;
	}


}
