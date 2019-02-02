package com.threeblog.daoImpl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.threeblog.dao.FollowDao;
import com.threeblog.domain.ArticleBean;
import com.threeblog.domain.FollowBean;
import com.threeblog.util.JDBCUtil;

public class FollowDaoImpl implements FollowDao {

	@Override
	public Long countFollowing(String uid) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="SELECT COUNT(following_id) AS followingNum FROM t_follow WHERE following_id=?";
		Long count =(Long) runner.query(sql,new ScalarHandler(),uid);
		return count;
	}

	@Override
	public Long countFollower(String uid) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="SELECT COUNT(follower_id) AS followerNum FROM t_follow WHERE follower_id=?";
		Long count =(Long) runner.query(sql,new ScalarHandler(),uid);
		return count;
	}

	@Override
	public List<FollowBean> getFollowingsByUid(String uid) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="SELECT * FROM t_follow WHERE following_id=? ORDER BY follow_date DESC";
		return runner.query(sql,new BeanListHandler<FollowBean>(FollowBean.class),uid);
	}

	@Override
	public List<FollowBean> getFollowersByUid(String uid) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="SELECT * FROM t_follow WHERE follower_id=? ORDER BY follow_date DESC";
		return runner.query(sql,new BeanListHandler<FollowBean>(FollowBean.class),uid);
	}

	@Override
	public boolean findFollowStatus(String id1, String id2) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="select count(*) from t_follow where following_id=? and follower_id=?;";
		Long result = (Long)runner.query(sql,new ScalarHandler(), id1,id2);
		return result>0;
	}

	@Override
	public boolean addFollow(FollowBean follow) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		//following_id :关注者， follower_id: 被关注者
		String sql="insert into t_follow(id,following_id,follower_id,follow_date) values(?,?,?,?);";
		int result = runner.update(sql, follow.getId(),follow.getFollowing_id(),follow.getFollower_id(),follow.getFollow_date());  
		return result>0;
	}

	@Override
	public boolean cancelFollow(String following_id, String follower_id)throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="delete from t_follow where following_id=? and follower_id=?";
		int result = runner.update(sql,following_id,follower_id);
		return result>0;
	}
	
	@Override
	public Long countFollows(String uid) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		//following_id :关注者， follower_id: 被关注者
		String sql="select COUNT(follower_id) AS Fid from t_follow where follower_id=? and status='未读'";
		Long count =(Long) runner.query(sql,new ScalarHandler(),uid);
		return count;
	}

}
