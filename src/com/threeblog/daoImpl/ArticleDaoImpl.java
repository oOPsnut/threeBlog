package com.threeblog.daoImpl;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.sun.org.apache.bcel.internal.generic.NEW;
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
		String sql="select * from t_articletype where article_id = ?";
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
		String sql="select * from t_article where author_id=?  order by publish_date DESC";
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

	@Override
	public Long countAByYears(String uid, String start, String end) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		//SELECT COUNT(publish_date) AS y2019 FROM t_article WHERE publish_date LIKE '2018%' AND author_id='72C5BA19E0C1431BA25D74E9B0D47647'
		String sql="SELECT COUNT(publish_date) AS year FROM t_article WHERE publish_date >=? AND publish_date <= ? AND author_id=? ";
		Long count =(Long) runner.query(sql,new ScalarHandler(),start,end,uid);
		return count;
	}

	@Override
	public ArticleBean getFirstArticlesByUid(String id) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		//select * from t_article where publish_date>'2019-01-01 00:00:00' and publish_date<'2019-12-31 23:59:59' and author_id='72C5BA19E0C1431BA25D74E9B0D47647'
		//select * from t_article where publish_date like '2019%' and author_id='72C5BA19E0C1431BA25D74E9B0D47647'
		String sql="select * from t_article where author_id=? order by publish_date ASC limit 1";
		return runner.query(sql,new BeanHandler<ArticleBean>(ArticleBean.class),id);
	}

	@Override
	public List<Object[]> findHotLabels() throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		//SELECT label AS labels,COUNT(*) AS number FROM t_article GROUP BY label  LIMIT 10
		//上面是返回有数数的，下面是没有数数的。
		String sql="SELECT label AS labels FROM t_article GROUP BY label  LIMIT 10";
		return runner.query(sql,new ArrayListHandler());
	}

	@Override
	public List<ArticleBean> findHotArticles() throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());		
		String sql="SELECT * FROM t_article order BY click_num DESC  LIMIT 15";
		return runner.query(sql,new BeanListHandler<ArticleBean>(ArticleBean.class));
	}

	@Override
	public List<ArticleBean> findSearchKey(String word) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());		
		String sql="SELECT * FROM t_article WHERE label LIKE ? OR title LIKE ? order by publish_date DESC LIMIT 5 ";
		return runner.query(sql,new BeanListHandler<ArticleBean>(ArticleBean.class),word+"%",word+"%");
	}

	@Override
	public List<ArticleBean> fingAllAboutWord(String word) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());		
		String sql="SELECT * FROM t_article WHERE label LIKE ? OR title LIKE ? order by publish_date DESC";
		return runner.query(sql,new BeanListHandler<ArticleBean>(ArticleBean.class),word+"%",word+"%");
	}

	@Override
	public List<ArticleBean> findArticleCover() throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());		
		String sql="SELECT * FROM t_article where status!='屏蔽' order by publish_date DESC";
		return runner.query(sql,new BeanListHandler<ArticleBean>(ArticleBean.class));
	}

	@Override
	public List<ArticleBean> findHotestArticle() throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());		
		String sql="SELECT * FROM t_article where status!='屏蔽' order by click_num DESC limit 5";
		return runner.query(sql,new BeanListHandler<ArticleBean>(ArticleBean.class));
	}

	@Override
	public List<ArticleBean> findNewestArticle() throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());		
		String sql="SELECT * FROM t_article where status!='屏蔽' order by publish_date DESC limit 5";
		return runner.query(sql,new BeanListHandler<ArticleBean>(ArticleBean.class));
	}

	@Override
	public List<ArticleBean> loadMore(int offset, int size,String alt) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		String sql=null;
		//System.out.println(alt);
		if (alt.equals("hot")) {
			sql="SELECT * FROM t_article WHERE STATUS!='屏蔽' ORDER BY click_num DESC LIMIT ? , ?";			
		} else if(alt.equals("new")){
			sql="SELECT * FROM t_article WHERE STATUS!='屏蔽' ORDER BY publish_date DESC LIMIT ? , ?";	
		}else if(alt.equals("mix")){
			sql="SELECT * FROM t_article WHERE STATUS!='屏蔽' and id IN(SELECT article_id FROM t_articletype WHERE article_type='杂乱无章') ORDER BY publish_date DESC LIMIT ? , ?";	
		}else if(alt.equals("fun")){
			sql="SELECT * FROM t_article WHERE STATUS!='屏蔽' and id IN(SELECT article_id FROM t_articletype WHERE article_type='休闲娱乐') ORDER BY publish_date DESC LIMIT ? , ?";	
		}else if(alt.equals("game")){
			sql="SELECT * FROM t_article WHERE STATUS!='屏蔽' and id IN(SELECT article_id FROM t_articletype WHERE article_type='游戏漫画') ORDER BY publish_date DESC LIMIT ? , ?";	
		}else if(alt.equals("travel")){
			sql="SELECT * FROM t_article WHERE STATUS!='屏蔽' and id IN(SELECT article_id FROM t_articletype WHERE article_type='旅游摄影') ORDER BY publish_date DESC LIMIT ? , ?";	
		}else if(alt.equals("fashion")){
			sql="SELECT * FROM t_article WHERE STATUS!='屏蔽' and id IN(SELECT article_id FROM t_articletype WHERE article_type='时尚美食') ORDER BY publish_date DESC LIMIT ? , ?";	
		}else if(alt.equals("school")){
			sql="SELECT * FROM t_article WHERE STATUS!='屏蔽' and id IN(SELECT article_id FROM t_articletype WHERE article_type='校园青春') ORDER BY publish_date DESC LIMIT ? , ?";	
		}else if(alt.equals("media")){
			sql="SELECT * FROM t_article WHERE STATUS!='屏蔽' and id IN(SELECT article_id FROM t_articletype WHERE article_type='媒体科技') ORDER BY publish_date DESC LIMIT ? , ?";	
		}else if(alt.equals("sports")){
			sql="SELECT * FROM t_article WHERE STATUS!='屏蔽' and id IN(SELECT article_id FROM t_articletype WHERE article_type='体育健康') ORDER BY publish_date DESC LIMIT ? , ?";	
		}
		return runner.query(sql,new BeanListHandler<ArticleBean>(ArticleBean.class),offset,size);
	}

	@Override
	public List<ArticleBean> findArticleByType(String type) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());		
		String sql="SELECT * FROM t_article where status!='屏蔽' and id IN(SELECT article_id FROM t_articletype WHERE article_type=?) order by publish_date DESC limit 5";
		return runner.query(sql,new BeanListHandler<ArticleBean>(ArticleBean.class),type);
	}

	@Override
	public Long countTotalArticles() throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		String sql="SELECT COUNT(id) AS id FROM t_article ";
		Long count =(Long) runner.query(sql,new ScalarHandler());
		return count;
	}

	@Override
	public Object countTotalClickNum() throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		String sql="SELECT SUM(click_num)  FROM t_article ";
		Object count = runner.query(sql,new ScalarHandler());
		return count;
	}

	@Override
	public Long countTotalArticlesByYear(int currentYear) throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="SELECT COUNT(id) AS id FROM t_article WHERE publish_date LIKE ?";
		Long count =(Long) runner.query(sql,new ScalarHandler(),currentYear+"%");
		return count;
	}

	@Override
	public List<ArticleBean> findAllACover() throws SQLException {
		QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
		String sql="select * from t_article order by publish_date DESC";
		return runner.query(sql, new BeanListHandler<ArticleBean>(ArticleBean.class));
	}

	@Override
	public boolean ChangeACover(String id) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		String sql = "update t_article set cover='/ThreeBlog_V1.0/image/articlecover/illegal_pic3.jpg' where id=?;";
		int result = runner.update(sql, id);
		return result>0;
	}

	@Override
	public boolean HideArticle(String id) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		String sql = "update t_article set status='屏蔽' where id=?;";
		int result = runner.update(sql, id);
		return result>0;
	}

	@Override
	public List<ArticleBean> findAllArticleByType(String article_type) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());		
		String sql="SELECT * FROM t_article where  id IN(SELECT article_id FROM t_articletype WHERE article_type=?) order by publish_date DESC ";
		return runner.query(sql,new BeanListHandler<ArticleBean>(ArticleBean.class),article_type);
	}

	@Override
	public boolean PassRenewArticle(String cid) throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());
		String sql = "update t_article set status='正常' where id=?;";
		int result = runner.update(sql, cid);
		return result>0;
	}

	@Override
	public List<ArticleBean> findAllHotArticles() throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());		
		String sql="SELECT * FROM t_article WHERE STATUS!='屏蔽' ORDER BY click_num+liked_num+collect_num+comment_num DESC LIMIT 5";
		return runner.query(sql,new BeanListHandler<ArticleBean>(ArticleBean.class));
	}

	@Override
	public List<ArticleBean> findBeReportedArticle() throws SQLException {
		QueryRunner runner  = new QueryRunner(JDBCUtil.getDataSource());		
		String sql="SELECT * FROM t_article WHERE id IN(SELECT content_id FROM t_report ORDER BY add_time DESC) ";
		return runner.query(sql,new BeanListHandler<ArticleBean>(ArticleBean.class));
	}



	

}
