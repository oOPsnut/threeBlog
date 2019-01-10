package com.threeblog.serviceImpl;

import java.sql.SQLException;
import java.util.Date;

import com.threeblog.dao.ArticleDao;
import com.threeblog.dao.ZanDao;
import com.threeblog.daoImpl.ArticleDaoImpl;
import com.threeblog.daoImpl.ZanDaoImpl;
import com.threeblog.domain.ArticleBean;
import com.threeblog.domain.ArticleTypeBean;
import com.threeblog.domain.ZanBean;
import com.threeblog.service.ArticleService;

public class ArticleServiceImpl implements ArticleService {

	
	@Override
	public boolean addArticle(ArticleBean article) throws SQLException {
		// 发表文章
		ArticleDao dao = new ArticleDaoImpl();
		boolean result = dao.addArticle(article);
		return result;
	}

	@Override
	public ArticleBean findArticle(String id) throws SQLException {
		// 查找文章
		ArticleDao dao = new ArticleDaoImpl();
		ArticleBean articleBean = dao.findArticle(id);
		return articleBean;
	}

	@Override
	public boolean addArticleType(ArticleTypeBean articleType) throws SQLException {
		//发表文章，将文章类型写进表中
		ArticleDao dao = new ArticleDaoImpl();
		boolean result = dao.addArticleType(articleType);
		return result;
	}

	@Override
	public ArticleTypeBean findArticleType(String id2) throws SQLException {
		// 通过类型id，找到文章类型
		ArticleDao dao = new ArticleDaoImpl();
		ArticleTypeBean atBean = dao.findArticleType(id2);
		return atBean;
	}

	@Override
	public void updateClickNumByAId(String id,int click_num) throws SQLException {
		// 通过文字id更新文章点击数
		ArticleDao dao = new ArticleDaoImpl();
		dao.updateClickNumByAId(id,click_num);		
	}

	@Override
	public ArticleBean findLastAId( String author_id, Date pub_time) throws SQLException {
		//  通过作者id和文章时间查上一篇的id
		ArticleDao dao = new ArticleDaoImpl();
		ArticleBean last_aBean = dao.findLastAId(author_id,pub_time);
		return last_aBean;
	}

	@Override
	public ArticleBean findNextAId(String author_id, Date pub_time) throws SQLException {
		//  通过作者id和文章时间查下一篇的id
		ArticleDao dao = new ArticleDaoImpl();
		ArticleBean next_aBean = dao.findNextAId(author_id,pub_time);
		return next_aBean;
	}

	@Override
	public void updateLikedNumByAId(String id, int liked_num) throws SQLException {
		// 通过文章id更新文章喜欢数
		ArticleDao dao = new ArticleDaoImpl();
		dao.updateLikedNumByAId(id,liked_num);			
	}

	@Override
	public boolean addArticleZan(ZanBean zan) throws SQLException {
		//将文章点赞信息写进表
		ZanDao dao = new ZanDaoImpl();
		boolean result = dao.addArticleZan(zan);
		return result;
	}

	@Override
	public ZanBean findArticleZan(String id) throws SQLException {
		// 通过赞id找到赞信息
		ZanDao dao = new ZanDaoImpl();
		ZanBean zBean = dao.findArticleZan(id);
		return zBean;
	}

	@Override
	public ZanBean findAZan(String uid, String id) throws SQLException {
		//通过用户id和文章id找到赞信息
		ZanDao dao = new ZanDaoImpl();
		ZanBean zBean = dao.findAZan(uid,id);
		return zBean;
	}

	@Override
	public boolean UpdateArticleZan(ZanBean zan) throws SQLException {
		// 通过点赞id更新点赞图标
		ZanDao dao = new ZanDaoImpl();
		boolean result = dao.UpdateArticleZan(zan);
		return result;
	}
}
