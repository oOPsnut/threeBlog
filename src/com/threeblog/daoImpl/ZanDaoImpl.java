package com.threeblog.daoImpl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.threeblog.dao.ZanDao;
import com.threeblog.domain.ArticleBean;
import com.threeblog.domain.ZanBean;
import com.threeblog.util.JDBCUtil;

public class ZanDaoImpl implements ZanDao {

	@Override
	public boolean addArticleZan(ZanBean zan) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="insert into t_zan(id,type,receiver_id,sender_id,article_id,text,add_time,zpic) values(?,?,?,?,?,?,?,?);";
		int result = runner.update(sql, zan.getId(),zan.getType(),zan.getReceiver_id(),zan.getSender_id(),zan.getArticle_id(),zan.getText(),zan.getAdd_time(),zan.getZpic());  
		return result>0;
	}

	@Override
	public ZanBean findArticleZan(String id) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="select * from t_zan where id = ?";
		return runner.query(sql, new BeanHandler<ZanBean>(ZanBean.class),id);
	}

	@Override
	public ZanBean findAZan(String uid, String id) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="select * from t_zan where sender_id = ? and article_id=?";
		return runner.query(sql, new BeanHandler<ZanBean>(ZanBean.class),uid,id);
	}
	
	//方法1：更新赞图标
/*	@Override
	public boolean UpdateArticleZan(ZanBean zan) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="update t_zan set zpic=? , type=? where id=?";
		int result = runner.update(sql,zan.getZpic(),zan.getType(),zan.getId());  
		return result>0;
	}*/
	//方法2：真删除点赞信息
	@Override
	public boolean UpdateArticleZan(ZanBean zan) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="delete from t_zan where id=?";
		int result = runner.update(sql,zan.getId());  
		return result>0;
	}
	
	@Override
	public boolean addCommentZan(ZanBean zanBean) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="insert into t_zan(id,type,receiver_id,sender_id,article_id,text,add_time) values(?,?,?,?,?,?,?);";
		int result = runner.update(sql,zanBean.getId(),zanBean.getType(),zanBean.getReceiver_id(),zanBean.getSender_id(),zanBean.getArticle_id(),zanBean.getText(),zanBean.getAdd_time());  
		return result>0;
	}

	@Override
	public void cancelCommentZan(String id, String type2) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="update t_zan set type=? where id= ?";
		runner.update(sql,type2,id);		
	}

	@Override
	public boolean addAnswerZan(ZanBean zanBean) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="insert into t_zan(id,type,receiver_id,sender_id,article_id,text,add_time) values(?,?,?,?,?,?,?);";
		int result = runner.update(sql,zanBean.getId(),zanBean.getType(),zanBean.getReceiver_id(),zanBean.getSender_id(),zanBean.getArticle_id(),zanBean.getText(),zanBean.getAdd_time());  
		return result>0;
	}

	@Override
	public void cancelAnswerZan(String id, String type2) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="update t_zan set type=? where id= ?";
		runner.update(sql,type2,id);	
	}
}
