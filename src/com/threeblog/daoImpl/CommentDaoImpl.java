package com.threeblog.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.sun.org.apache.bcel.internal.generic.NEW;
import com.threeblog.dao.CommentDao;
import com.threeblog.domain.CommentBean;
import com.threeblog.util.JDBCUtil;

public class CommentDaoImpl implements CommentDao {

	@Override
	public List<CommentBean> getCommentsFromArticle_id(String aid) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		String sql="select * from t_comment where article_id=? order by add_time DESC";
		return runner.query(sql,new BeanListHandler<CommentBean>(CommentBean.class),aid);
	}

	@Override
	public boolean addArticleComment(CommentBean comment) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		String sql="insert into t_comment(id,article_id,author_id,text,add_time,zan) values(?,?,?,?,?,?);";
		int result = runner.update(sql, comment.getId(),comment.getArticle_id(),comment.getAuthor_id(),comment.getText(),comment.getAdd_time(),comment.getZan());
		return result>0;
	}

	@Override
	public CommentBean getCommentFromComment_id(String comment_id) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		String sql="select * from t_comment where id=?";
		return runner.query(sql,new BeanHandler<CommentBean>(CommentBean.class),comment_id);
	}

	@Override
	public boolean deleteArticleComment(String comment_id) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		String sql="delete from t_comment where id=? and status='正常'";
		int result = runner.update(sql,comment_id);
		return result>0;
	}

	@Override
	public boolean UpdateCommentZan(String comment_id, int zan) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		String sql="update t_comment set zan=? where id=?";
		int result = runner.update(sql,zan,comment_id);
		return result>0;
	}

	@Override
	public boolean HideComment(String cid) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		String sql="update t_comment set status='屏蔽' where id=?";
		int result = runner.update(sql,cid);
		return result>0;
	}

	@Override
	public boolean PassRenewComment(String cid) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		String sql="update t_comment set status='正常' where id=?";
		int result = runner.update(sql,cid);
		return result>0;
	}

}
