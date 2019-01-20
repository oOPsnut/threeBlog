package com.threeblog.daoImpl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.threeblog.dao.AnswersDao;
import com.threeblog.domain.AnswerBean;
import com.threeblog.domain.CommentBean;
import com.threeblog.util.JDBCUtil;

public class AnswersDaoImpl implements AnswersDao {

	@Override
	public List<AnswerBean> getAnswersFromComment_id(String id) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		String sql="select * from t_answer where comment_id=? order by add_time DESC";
		return runner.query(sql,new BeanListHandler<AnswerBean>(AnswerBean.class),id);
	}

	@Override
	public boolean addArticleCommentAnswer(AnswerBean answer) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		String sql="insert into t_answer(id,comment_id,author_id,text,add_time,zan) values(?,?,?,?,?,?);";
		int result = runner.update(sql, answer.getId(),answer.getComment_id(),answer.getAuthor_id(),answer.getText(),answer.getAdd_time(),answer.getZan());
		return result>0;
	}

	@Override
	public AnswerBean getAnswertFromAnswer_id(String answer_id) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		String sql="select * from t_answer where id=?";
		return runner.query(sql,new BeanHandler<AnswerBean>(AnswerBean.class),answer_id);
	}

	@Override
	public Long findCommentAnswerNum(String comment_id) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		String sql="SELECT COUNT(comment_id) AS commentNum FROM t_answer WHERE comment_id=?";
		Long count =(Long) runner.query(sql,new ScalarHandler(),comment_id);
		return count;
	}

	@Override
	public boolean deleteArticleCommentAnswer(String comment_id) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		String sql="delete from t_answer where comment_id=? ";
		int result = runner.update(sql,comment_id);
		return result>0;
	}

	@Override
	public boolean deleteArticleAnswer(String answer_id) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		String sql="delete from t_answer where id=? ";
		int result = runner.update(sql,answer_id);
		return result>0;
	}

	@Override
	public boolean UpdateAnswerZan(String answer_id, int zan) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		String sql="update t_answer set zan=? where id=?";
		int result = runner.update(sql,zan,answer_id);
		return result>0;
	}

}
