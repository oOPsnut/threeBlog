package com.threeblog.daoImpl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.threeblog.dao.ReportDao;
import com.threeblog.domain.AblumBean;
import com.threeblog.domain.ReportBean;
import com.threeblog.util.JDBCUtil;

public class ReportDaoImpl implements ReportDao {

	@Override
	public boolean addArticleReport(ReportBean report) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="insert into t_report(id,username,type,content,simple_reason,all_reason,feedback_reason,url,author_id,user_id,content_id,add_time) values(?,?,?,?,?,?,?,?,?,?,?,?);";
		int result = runner.update(sql, report.getId(),report.getUsername(),report.getType(),report.getContent(),report.getSimple_reason(),report.getAll_reason(),report.getFeedback_reason(),report.getUrl(),report.getAuthor_id(),report.getUser_id(),report.getContent_id(),report.getAdd_time());  
		return result>0;
	}

	@Override
	public boolean addReviewsReport(ReportBean report) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="insert into t_report(id,username,type,content,simple_reason,all_reason,feedback_reason,url,author_id,user_id,content_id,add_time) values(?,?,?,?,?,?,?,?,?,?,?,?);";
		int result = runner.update(sql, report.getId(),report.getUsername(),report.getType(),report.getContent(),report.getSimple_reason(),report.getAll_reason(),report.getFeedback_reason(),report.getUrl(),report.getAuthor_id(),report.getUser_id(),report.getContent_id(),report.getAdd_time());  
		return result>0;
	}

	@Override
	public List<ReportBean> getMyIllegalsByUid(String uid) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		//author_id:被举报者id   user_id:举报者id
		String sql="select * from t_report where author_id=? order by add_time DESC";
		return  runner.query(sql, new BeanListHandler<ReportBean>(ReportBean.class),uid);	
	}

	@Override
	public boolean ensureReport(String id) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="update t_report set status3='已确定' where id=?";
		int result = runner.update(sql,id);
		return result>0;
	}

	@Override
	public List<ReportBean> getMyReportsByUid(String uid) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		//author_id:被举报者id   user_id:举报者id
		String sql="select * from t_report where user_id=? order by add_time DESC";
		return  runner.query(sql, new BeanListHandler<ReportBean>(ReportBean.class),uid);	
	}

	@Override
	public ReportBean getReportByRid(String rid) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="select * from t_report where id=? ";
		return  runner.query(sql, new BeanHandler<ReportBean>(ReportBean.class),rid);
	}

	@Override
	public boolean feedback(String id, String feedback_reason, String status3) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="update t_report set feedback_reason=? , status3=? where id=?;";
		int result = runner.update(sql,feedback_reason,status3,id);  
		return result>0;
	}
	

}
