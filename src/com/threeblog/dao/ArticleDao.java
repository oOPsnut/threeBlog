package com.threeblog.dao;

import java.sql.SQLException;
import java.util.Date;

import com.threeblog.domain.ArticleBean;
import com.threeblog.domain.ArticleTypeBean;
import com.threeblog.domain.ZanBean;

/**
 * 这是针对 文章表 和 文章类型表 的数据访问
 * @author Liang
 */
public interface ArticleDao {
	
	/**
	 * 执行发表文章操作
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
	 * @throws SQLException
	 */
	boolean addArticleType(ArticleTypeBean articleType)throws SQLException;
	
	/**
	 * 通过文章id查找对应的文章
	 * @param id
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
	 * 通过文字id更新文章点击数
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
	 * 通过文章id更新文章收藏数
	 * @param id
	 * @throws SQLException
	 */
	void updateCollectNumByAId(String id,int collect_num)throws SQLException;

	
	
}
