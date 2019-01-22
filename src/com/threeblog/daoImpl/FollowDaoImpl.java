package com.threeblog.daoImpl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.threeblog.dao.FollowDao;
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

}
