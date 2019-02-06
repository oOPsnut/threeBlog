package com.threeblog.daoImpl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.threeblog.dao.MessageDao;
import com.threeblog.domain.FollowBean;
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
		String sql="select count(type) as Rtype from t_message where receiver_id=? and answer_id!=? and status='未读' and (type='文章留言' OR type='留言回复') ";
		Long count =(Long) runner.query(sql,new ScalarHandler(),uid,uid);
		return count;
	}

	@Override
	public Long countCollects(String uid) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		String sql="select count(type) as Ctype from t_message where receiver_id=? and answer_id!=? and status='未读' and type='文章收藏'";
		Long count =(Long) runner.query(sql,new ScalarHandler(),uid,uid);
		return count;
	}

	@Override
	public Long countZans(String uid) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		String sql="select count(type) as Ztype from t_message where receiver_id=? and answer_id!=? and status='未读' and (type='文章点赞' OR type='留言点赞') ";
		Long count =(Long) runner.query(sql,new ScalarHandler(),uid,uid);
		return count;
	}

	@Override
	public List<MessageBean> findMessagesByUid(String uid) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		//接受消息者:receiver_id  发送消息者:answer_id
 		String sql="SELECT * FROM t_message WHERE receiver_id=? and answer_id!=? ORDER BY add_time DESC";
		return runner.query(sql,new BeanListHandler<MessageBean>(MessageBean.class),uid,uid);
	}

	@Override
	public boolean Read(String id) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		String sql="update t_message set status='已读' where id=?";
		int result = runner.update(sql,id);
		return result>0;
	}

	@Override
	public List<MessageBean> findnotReadReviewsMessagesByUid(String uid) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		//接受消息者:receiver_id  发送消息者:answer_id
 		String sql="SELECT * FROM t_message WHERE receiver_id=? and answer_id!=? and status='未读' and (type='文章留言' or type='留言回复') ORDER BY add_time DESC";
		return runner.query(sql,new BeanListHandler<MessageBean>(MessageBean.class),uid,uid);
	}

	@Override
	public List<MessageBean> findReadReviewsMessagesByUid(String uid) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		//接受消息者:receiver_id  发送消息者:answer_id
 		String sql="SELECT * FROM t_message WHERE receiver_id=? and answer_id!=? and  status='已读' and (type='文章留言' or type='留言回复') ORDER BY add_time DESC";
		return runner.query(sql,new BeanListHandler<MessageBean>(MessageBean.class),uid,uid);
	}

	@Override
	public List<MessageBean> findnotReadZanMessagesByUid(String uid) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		//接受消息者:receiver_id  发送消息者:answer_id
 		String sql="SELECT * FROM t_message WHERE receiver_id=? and answer_id!=? and  status='未读' and (type='文章点赞' OR type='留言点赞') ORDER BY add_time DESC";
		return runner.query(sql,new BeanListHandler<MessageBean>(MessageBean.class),uid,uid);
	}

	@Override
	public List<MessageBean> findReadZanMessagesByUid(String uid) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		//接受消息者:receiver_id  发送消息者:answer_id
 		String sql="SELECT * FROM t_message WHERE receiver_id=? and answer_id!=? and  status='已读' and (type='文章点赞' OR type='留言点赞') ORDER BY add_time DESC";
		return runner.query(sql,new BeanListHandler<MessageBean>(MessageBean.class),uid,uid);
	}

	@Override
	public List<MessageBean> findnotReadFavorMessagesByUid(String uid) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		//接受消息者:receiver_id  发送消息者:answer_id
 		String sql="SELECT * FROM t_message WHERE receiver_id=? and answer_id!=? and  status='未读' and type='文章收藏'  ORDER BY add_time DESC";
		return runner.query(sql,new BeanListHandler<MessageBean>(MessageBean.class),uid,uid);
	}

	@Override
	public List<MessageBean> findReadFavorMessagesByUid(String uid) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		//接受消息者:receiver_id  发送消息者:answer_id
 		String sql="SELECT * FROM t_message WHERE receiver_id=? and answer_id!=? and  status='已读' and type='文章收藏'  ORDER BY add_time DESC";
		return runner.query(sql,new BeanListHandler<MessageBean>(MessageBean.class),uid,uid);
	}

}
