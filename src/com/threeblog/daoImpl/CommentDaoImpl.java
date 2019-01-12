package com.threeblog.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
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

}
