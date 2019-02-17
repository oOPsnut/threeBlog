package com.threeblog.daoImpl;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.threeblog.common.Config;
import com.threeblog.common.IndustrySMS;
import com.threeblog.dao.UserDao;
import com.threeblog.domain.UserBean;
import com.threeblog.util.JDBCUtil;

public class UserDaoImpl implements UserDao{

	@Override
	public UserBean userLogin(UserBean user) throws SQLException {
		QueryRunner runner =new QueryRunner(JDBCUtil.getDataSource());
		String sql="select * from t_user where phone=? and password=?";
		return runner.query(sql, new BeanHandler<UserBean>(UserBean.class), user.getPhone(),user.getPassword());
	}

	@Override
	public boolean checkUserName(String username) throws SQLException {
		
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="select count(*) from t_user where username=?";
		Long result = (Long) runner.query(sql,new ScalarHandler(),username);
		return result>0;
	}

	@Override
	public boolean checkPhone(String phone) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="select count(*) from t_user where phone=?";
		Long result = (Long) runner.query(sql, new ScalarHandler(),phone);
		return result>0;
	}

	@Override
	public boolean userRegister(String id,String phone, String username, String password,Date register_time) throws SQLException {
		
		QueryRunner runner=new QueryRunner(JDBCUtil.getDataSource());
		String sql="insert into t_user(id,phone,username,password,register_time) values(?,?,?,?,?);";
		int result = runner.update(sql,id,phone,username,password,register_time);
		return result>0;
	}
	
	@Override
	public String sendCode(String phone, int code) throws SQLException {
		
		String result = IndustrySMS.execute(phone, code);
		return result;
	}

	@Override
	public boolean changePasswd(String phone, String password) throws SQLException {

		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		//UPDATE t_user SET PASSWORD='123456' WHERE phone='13642593642';
		String sql="update t_user set password=? where phone=?;";
		int result = runner.update(sql,password,phone);
		return result>0;
	}

	
	@Override
	public boolean changeLoginTime(String id, Date last_login_time)throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="update t_user set last_login_time=? where id=?";
		int result = runner.update(sql,last_login_time,id);
		return result>0;
	}

	@Override
	public boolean changeInfo(UserBean user) throws SQLException {
		QueryRunner runner= new QueryRunner(JDBCUtil.getDataSource());
		String sql=null;
		int result;
		if (user.getHead()!=null) {
			 sql="update t_user set sex=?,age=?,introduction=?,province=?,city=?,head=? where id=?";	
			 result = runner.update(sql, user.getSex(),user.getAge(),user.getIntroduction(),user.getProvince(),user.getCity(),user.getHead(),user.getId());
		} else {
			sql="update t_user set sex=?,age=?,introduction=?,province=?,city=? where id=?";
			result = runner.update(sql, user.getSex(),user.getAge(),user.getIntroduction(),user.getProvince(),user.getCity(),user.getId());
		}	
		return result>0;
	}

	@Override
	public UserBean findUserInfo(String id) throws SQLException {
		QueryRunner runner =new QueryRunner(JDBCUtil.getDataSource());
		String sql="select * from t_user where id=?";
		return runner.query(sql, new BeanHandler<UserBean>(UserBean.class),id);
	}

	@Override
	public boolean checkOldPasswd(String phone, String password) throws SQLException {
		QueryRunner runner =new QueryRunner(JDBCUtil.getDataSource());
		//SELECT * FROM t_user WHERE phone='12345678901' AND PASSWORD='0e02fdf3dd182ebd95c16f1f105a354f'
		String sql="SELECT count(*) FROM t_user WHERE phone=? AND PASSWORD=?";
		Long reslut = (Long)runner.query(sql, new ScalarHandler(),phone,password);
		return reslut>0;
	}

	@Override
	public Long CountTotalUsers() throws SQLException {
		QueryRunner runner =new QueryRunner(JDBCUtil.getDataSource());
		String sql="select count(id) as totalUser from t_user";
		Long count =(Long) runner.query(sql,new ScalarHandler());
		return count;
	}

	@Override
	public Long countTotalUserByYear(int currentYear) throws SQLException {
		QueryRunner runner =new QueryRunner(JDBCUtil.getDataSource());
		String sql="SELECT COUNT(id) AS totalUser FROM t_user WHERE register_time LIKE ?";
		Long count =(Long) runner.query(sql,new ScalarHandler(),currentYear+"%");
		return count;
	}

	@Override
	public List<UserBean> findLastLoginUser() throws SQLException {
		QueryRunner runner =new QueryRunner(JDBCUtil.getDataSource());
		String sql="SELECT * FROM t_user order by last_login_time DESC limit 20";
		return runner.query(sql,new BeanListHandler<UserBean>(UserBean.class));
		 
	}

	
	
}
