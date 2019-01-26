package com.threeblog.daoImpl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.threeblog.dao.AblumDao;
import com.threeblog.domain.AblumBean;
import com.threeblog.util.JDBCUtil;

public class AblumDaoImpl implements AblumDao {

	@Override
	public List<AblumBean> findUserPhotosByUid(String uid) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="select * from t_ablum where user_id=? and status='正常'";
		return  runner.query(sql, new BeanListHandler<AblumBean>(AblumBean.class),uid);		
	}

	@Override
	public boolean addAblum(AblumBean ablum) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="insert into t_ablum(id,user_id,photo,upload_date) values(?,?,?,?)";
		int result = runner.update(sql,ablum.getId(),ablum.getUser_id(),ablum.getPhoto(),ablum.getUpload_date());
		return result>0;
	}

}
