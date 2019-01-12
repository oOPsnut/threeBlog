package com.threeblog.daoImpl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

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

}
