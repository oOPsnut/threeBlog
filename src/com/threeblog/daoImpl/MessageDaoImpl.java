package com.threeblog.daoImpl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;

import com.threeblog.dao.MessageDao;
import com.threeblog.domain.MessageBean;
import com.threeblog.util.JDBCUtil;

public class MessageDaoImpl implements MessageDao {

	@Override
	public void addMessage(MessageBean message) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		String sql="insert into t_message(id,type,receiver_id,answer_id,article_id,text1,text2,add_time) values(?,?,?,?,?,?,?,?);";
		runner.update(sql, message.getId(),message.getType(),message.getReceiver_id(),message.getAnswer_id(),message.getArticle_id(),message.getText1(),message.getText2(),message.getAdd_time());
	}

	@Override
	public Long countReviews(String uid) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		String sql="select count(type) as Rtype from t_message where receiver_id=? and status='未读' and type like '%留言%' ";
		return null;
	}

	@Override
	public Long countFollows(String uid) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Long countCollects(String uid) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Long countZans(String uid) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
