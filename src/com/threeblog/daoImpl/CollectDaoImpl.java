package com.threeblog.daoImpl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.threeblog.dao.CollectDao;
import com.threeblog.domain.CollectBean;
import com.threeblog.domain.ZanBean;
import com.threeblog.util.JDBCUtil;

public class CollectDaoImpl implements CollectDao {

	@Override
	public boolean addArticleCollect(CollectBean collect) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="insert into t_collect(id,user_id,article_id,author_id,collect_date,cpic) values(?,?,?,?,?,?);";
		int result = runner.update(sql,collect.getId(),collect.getUser_id(),collect.getArticle_id(),collect.getAuthor_id(),collect.getCollect_date(),collect.getCpic());  
		return result>0;
	}

	@Override
	public CollectBean findArticleCollect(String id) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="select * from t_collect where id = ?";
		return runner.query(sql, new BeanHandler<CollectBean>(CollectBean.class),id);
	}
	
	//方法1：更新收藏图标
//	@Override
//	public boolean UpdateArticleCollect(CollectBean collect) throws SQLException {
//		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
//		String sql="update t_collect set cpic=? where id=?";
//		int result = runner.update(sql,collect.getCpic(),collect.getId());  
//		System.out.println(result);
//		return result>0;
//	}
	//方法2：直接删除
	@Override
	public boolean UpdateArticleCollect(CollectBean collect) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="delete from t_collect where id=?";
		int result = runner.update(sql,collect.getId());  
		return result>0;
	}

	@Override
	public CollectBean findACollect(String uid, String id) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="select * from t_collect where user_id = ? and article_id=?";
		return runner.query(sql, new BeanHandler<CollectBean>(CollectBean.class),uid,id);
	}

}
