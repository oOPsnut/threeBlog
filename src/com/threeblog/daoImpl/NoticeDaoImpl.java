package com.threeblog.daoImpl;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.threeblog.dao.NoticeDao;
import com.threeblog.domain.NoticeBean;
import com.threeblog.util.JDBCUtil;

public class NoticeDaoImpl implements NoticeDao {

	@Override
	public boolean addNotice(NoticeBean notice) throws SQLException {
		QueryRunner runner=new QueryRunner(JDBCUtil.getDataSource());
		String sql="insert into t_notice(id,admin_id,admin_username,photo,title,type,content,publish_date) values(?,?,?,?,?,?,?,?);";
		int result = runner.update(sql,notice.getId(),notice.getAdmin_id(),notice.getAdmin_username(),notice.getPhoto(),notice.getTitle(),notice.getType(),notice.getContent(),notice.getPublish_date());
		return result>0;
	}

	@Override
	public NoticeBean fingNoticeById(String id) throws SQLException {
		QueryRunner runner=new QueryRunner(JDBCUtil.getDataSource());
		String sql="select * from t_notice where id=?";
		return runner.query(sql, new BeanHandler<NoticeBean>(NoticeBean.class),id);
		 
	}

	@Override
	public NoticeBean findLatelyNotice() throws SQLException {
		QueryRunner runner=new QueryRunner(JDBCUtil.getDataSource());
		String sql="select * from t_notice order by publish_date DESC";
		return runner.query(sql, new BeanHandler<NoticeBean>(NoticeBean.class));
	}

	@Override
	public NoticeBean findLastNoticeByPubDate(Date pDate) throws SQLException {
		QueryRunner runner=new QueryRunner(JDBCUtil.getDataSource());
		String sql="SELECT * FROM t_notice WHERE publish_date < ? ORDER BY publish_date DESC LIMIT 1";
		return runner.query(sql, new BeanHandler<NoticeBean>(NoticeBean.class),pDate);
	}

	@Override
	public NoticeBean findNextNoticeByPubDate(Date pDate) throws SQLException {
		QueryRunner runner=new QueryRunner(JDBCUtil.getDataSource());
		String sql="SELECT * FROM t_notice WHERE publish_date > ? ORDER BY publish_date ASC LIMIT 1";
		return runner.query(sql, new BeanHandler<NoticeBean>(NoticeBean.class),pDate);
	}

	@Override
	public List<NoticeBean> findAllNotice() throws SQLException {
		QueryRunner runner=new QueryRunner(JDBCUtil.getDataSource());
		String sql="SELECT * FROM t_notice  ORDER BY publish_date DESC";
		return runner.query(sql, new BeanListHandler<NoticeBean>(NoticeBean.class));
	}

	@Override
	public boolean deleteNotice(String id) throws SQLException {
		QueryRunner runner=new QueryRunner(JDBCUtil.getDataSource());
		String sql="delete from t_notice where id=?";
		int result = runner.update(sql,id);
		return result>0;
	}

	
}
