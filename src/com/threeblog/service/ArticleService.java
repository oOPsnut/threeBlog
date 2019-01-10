package com.threeblog.service;

import java.sql.SQLException;
import java.util.Date;

import com.threeblog.domain.ArticleBean;
import com.threeblog.domain.ArticleTypeBean;
import com.threeblog.domain.CollectBean;
import com.threeblog.domain.ZanBean;

/**
 * 这是针对用户文章的业务处理规范
 * @author Liang
 *
 */
public interface ArticleService {

	/**
	 * 执行文章发表
	 * 返回是否发表成功
	 * @param article
	 * @return
	 * @throws SQLException
	 */
	boolean addArticle(ArticleBean article)throws SQLException;
	
	/**
	 * 执行文章发表，将文章类类型写进表里
	 * @param articleType
	 * @return
	 */
	boolean addArticleType(ArticleTypeBean articleType) throws SQLException;
	
	/**
	 * 通过文章id查询对应文章
	 * @param article
	 * @return
	 * @throws SQLException
	 */
	ArticleBean findArticle(String id)throws SQLException;
	
	/**
	 * 通过类型id查询文章类型
	 * @param id2
	 * @return
	 * @throws SQLException
	 */
	ArticleTypeBean findArticleType(String id2) throws SQLException;
	
	/**
	 * 通过文章id更新文章点击数
	 * @param id
	 * @throws SQLException
	 */
	void updateClickNumByAId(String id,int click_num)throws SQLException;
	
	/***
	 * 通过作者id和文章时间查上一篇的id
	 * @param id
	 * @param pub_time
	 * @return
	 * @throws SQLException
	 */
	ArticleBean findLastAId(String author_id, Date pub_time)throws SQLException;
	
	/***
	 * 通过作者id和文章时间查下一篇的id
	 * @param id
	 * @param pub_time
	 * @return
	 * @throws SQLException
	 */
	ArticleBean findNextAId(String author_id, Date pub_time)throws SQLException;
	
	/**
	 * 通过文章id更新文章喜欢数
	 * @param id
	 * @throws SQLException
	 */
	void updateLikedNumByAId(String id,int liked_num)throws SQLException;
	
	/**
	 * 将文章点赞信息写进表
	 * @param zan
	 * @return
	 * @throws SQLException
	 */
	boolean addArticleZan(ZanBean zan)throws SQLException;
	
	/**
	 * 通过赞id找到赞信息
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	ZanBean findArticleZan(String id)throws SQLException;
	
	/**
	 * 通过用户id和文章id找到赞信息
	 * @param uid id
	 * @return
	 * @throws SQLException
	 */
	ZanBean findAZan(String uid ,String id)throws SQLException;

	/**
	 * 通过点赞id更新点赞图标
	 * @param zan
	 * @return
	 * @throws SQLException
	 */
	boolean UpdateArticleZan(ZanBean zan)throws SQLException;
	
	/**
	 * 通过文章id更新文章收藏数
	 * @param id
	 * @throws SQLException
	 */
	void updateCollectNumByAId(String id,int collect_num)throws SQLException;

	/**
	 * 将文章收藏信息写进表
	 * @param collect
	 * @return
	 * @throws SQLException
	 */
	boolean addArticleCollect(CollectBean collect)throws SQLException;

	/**
	 * 通过收藏id找到收藏信息
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	CollectBean findArticleCollect(String id)throws SQLException;

	/**
	 * 通过收藏id更新收藏图标
	 * @param collect
	 * @return
	 * @throws SQLException
	 */
	boolean UpdateArticleCollect(CollectBean collect)throws SQLException;
	
	/**
	 * 通过用户id和文章id找到收藏信息
	 * @param uid
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	CollectBean findACollect(String uid,String id)throws SQLException;

}
