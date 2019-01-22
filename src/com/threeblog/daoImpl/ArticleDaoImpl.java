package com.threeblog.daoImpl;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.threeblog.dao.ArticleDao;
import com.threeblog.domain.ArticleBean;
import com.threeblog.domain.ArticleTypeBean;
import com.threeblog.domain.CommentBean;
import com.threeblog.domain.UserBean;
import com.threeblog.domain.ZanBean;
import com.threeblog.util.JDBCUtil;


public class ArticleDaoImpl implements ArticleDao {
	
	@Override
	public boolean addArticle(ArticleBean article) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="insert into t_article(id,author_id,author,cover,title,introduction,label,text,allpic,publish_date,click_num,liked_num,collect_num,comment_num) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
		int result = runner.update(sql, article.getId(),article.getAuthor_id(),article.getAuthor(),article.getCover(),article.getTitle(),article.getIntroduction(),article.getLabel(),article.getText(),article.getAllpic(),article.getPublish_date(),article.getClick_num(),article.getLiked_num(),article.getCollect_num(),article.getComment_num());  
		return result>0;
	}
	
	@Override
	public ArticleBean findArticle(String id) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="select * from t_article where id = ?";
		return runner.query(sql, new BeanHandler<ArticleBean>(ArticleBean.class),id);
	}

	@Override
	public boolean addArticleType(ArticleTypeBean articleType) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="insert into t_articletype values(?,?,?,?);";
		int result = runner.update(sql, articleType.getId(),articleType.getAuthor_id(),articleType.getArticle_id(),articleType.getArticle_type());
		return result>0;
	}

	@Override
	public ArticleTypeBean findArticleType(String id2) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="select * from t_articletype where id = ?";
		return runner.query(sql, new BeanHandler<ArticleTypeBean>(ArticleTypeBean.class),id2);
	}

	@Override
	public void updateClickNumByAId(String id,int click_num) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="update t_article set click_num=? where id=?;";
		runner.update(sql,click_num,id);
	}

	@Override
	public ArticleBean findLastAId(String author_id, Date pub_time) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		//SELECT * FROM t_article WHERE publish_date<'2019-01-09 22:10:20' AND author_id='72C5BA19E0C1431BA25D74E9B0D47647' ORDER BY publish_date DESC LIMIT 1
		String sql="select * from t_article where publish_date < ? and author_id = ? order by publish_date DESC limit 1 ";
		return runner.query(sql, new BeanHandler<ArticleBean>(ArticleBean.class) ,pub_time,author_id);
	}

	@Override
	public ArticleBean findNextAId( String author_id, Date pub_time) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="select * from t_article where publish_date > ? and author_id = ? order by publish_date ASC limit 1";
		return runner.query(sql, new BeanHandler<ArticleBean>(ArticleBean.class) ,pub_time,author_id);
	}

	@Override
	public void updateLikedNumByAId(String id, int liked_num) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="update t_article set liked_num=? where id=?;";
		runner.update(sql,liked_num,id);
		
	}

	@Override
	public void updateCollectNumByAId(String id, int collect_num) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="update t_article set collect_num=? where id=?;";
		runner.update(sql,collect_num,id);
	}

	@Override
	public void updateCommentNumByAId(String article_id, int comment_num) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="update t_article set comment_num=? where id=?;";
		runner.update(sql,comment_num,article_id);
	}

	@Override
	public Long countArticles(String uid) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="SELECT COUNT(author_id) AS pubArticleNum FROM t_article WHERE author_id=?";
		Long count =(Long) runner.query(sql,new ScalarHandler(),uid);
		return count;
	}

	@Override
	public Long countMArticles(String uid, String type) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="SELECT COUNT(article_type) AS MArticleNum FROM t_articletype WHERE author_id=? AND article_type=?";
		Long count =(Long) runner.query(sql,new ScalarHandler(),uid,type);
		return count;
	}

	@Override
	public Long countGArticles(String uid, String type) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="SELECT COUNT(article_type) AS GArticleNum FROM t_articletype WHERE author_id=? AND article_type=?";
		Long count =(Long) runner.query(sql,new ScalarHandler(),uid,type);
		return count;
	}

	@Override
	public Long countZArticles(String uid, String type) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="SELECT COUNT(article_type) AS ZArticleNum FROM t_articletype WHERE author_id=? AND article_type=?";
		Long count =(Long) runner.query(sql,new ScalarHandler(),uid,type);
		return count;
	}

	@Override
	public Long countXArticles(String uid, String type) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="SELECT COUNT(article_type) AS XArticleNum FROM t_articletype WHERE author_id=? AND article_type=?";
		Long count =(Long) runner.query(sql,new ScalarHandler(),uid,type);
		return count;
	}

	@Override
	public Long countYArticles(String uid, String type) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="SELECT COUNT(article_type) AS YArticleNum FROM t_articletype WHERE author_id=? AND article_type=?";
		Long count =(Long) runner.query(sql,new ScalarHandler(),uid,type);
		return count;
	}

	@Override
	public Long countLArticles(String uid, String type) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="SELECT COUNT(article_type) AS LArticleNum FROM t_articletype WHERE author_id=? AND article_type=?";
		Long count =(Long) runner.query(sql,new ScalarHandler(),uid,type);
		return count;
	}

	@Override
	public Long countSArticles(String uid, String type) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="SELECT COUNT(article_type) AS SArticleNum FROM t_articletype WHERE author_id=? AND article_type=?";
		Long count =(Long) runner.query(sql,new ScalarHandler(),uid,type);
		return count;
	}

	@Override
	public Long countQArticles(String uid, String type) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="SELECT COUNT(article_type) AS QArticleNum FROM t_articletype WHERE author_id=? AND article_type=?";
		Long count =(Long) runner.query(sql,new ScalarHandler(),uid,type);
		return count;
	}

	@Override
	public Long countKArticles(String uid, String type) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="SELECT COUNT(article_type) AS KArticleNum FROM t_articletype WHERE author_id=? AND article_type=?";
		Long count =(Long) runner.query(sql,new ScalarHandler(),uid,type);
		return count;
	}

	@Override
	public Long countTArticles(String uid, String type) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="SELECT COUNT(article_type) AS TArticleNum FROM t_articletype WHERE author_id=? AND article_type=?";
		Long count =(Long) runner.query(sql,new ScalarHandler(),uid,type);
		return count;
	}

	@Override
	public List<ArticleBean> getArticlesByUid(String uid) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		String sql="select * from t_article where author_id=? order by publish_date DESC";
		return runner.query(sql,new BeanListHandler<ArticleBean>(ArticleBean.class),uid);
	}

	@Override
	public boolean deleteArticle(String id) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		String sql = "delete from t_article where id=? and status='正常'";
		int result = runner.update(sql, id);
		return result>0;
	}

	@Override
	public ArticleTypeBean getArticleTypeByAid(String id) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		String sql="select * from t_articletype where article_id = ?";
		return runner.query(sql, new BeanHandler<ArticleTypeBean>(ArticleTypeBean.class),id);
	}

	@Override
	public boolean deleteArticleType(String id) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		String sql = "delete from t_articletype where article_id=?";
		int result = runner.update(sql, id);
		return result>0;
	}

	@Override
	public List getAYearsfrom(String uid) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		String sql="SELECT YEAR(publish_date) AS YEAR FROM t_article WHERE author_id = ? ORDER BY publish_date DESC";
		return runner.query(sql, new ArrayListHandler(),uid);
	}



	

}
