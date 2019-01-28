package com.threeblog.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.threeblog.domain.AnswerBean;
import com.threeblog.domain.ArticleBean;
import com.threeblog.domain.ArticleTypeBean;
import com.threeblog.domain.CollectBean;
import com.threeblog.domain.CommentBean;
import com.threeblog.domain.ReportBean;
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

	/**
	 * 通过文章id找到留言
	 * @param aid
	 * @return
	 * @throws SQLException
	 */
	List<CommentBean> getCommentsFromArticle_id(String aid)throws SQLException;
	
	/**
	 * 通过留言id找到留言回答
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	List<AnswerBean> getAnswersFromComment_id(String id)throws SQLException;

	/**
	 * 通过文章id，更新留言数目
	 * @param article_id
	 * @param comment_num
	 */
	void updateCommentNumByAId(String article_id, int comment_num)throws SQLException;

	/**
	 * 将文章留言写进表
	 * @param comment
	 */
	boolean addArticleComment(CommentBean comment)throws SQLException;

	/**
	 * 将文章留言回复写进表
	 * @param answer
	 * @return
	 * @throws SQLException
	 */
	boolean addArticleCommentAnswer(AnswerBean answer)throws SQLException;

	/**
	 * 通过文章留言id获得留言信息
	 * @param comment_id
	 * @return
	 * @throws SQLException
	 */
	CommentBean getCommentFromComment_id(String comment_id)throws SQLException;

	/**
	 * 通过文章留言回复id获得留言回复信息
	 * @param answer_id
	 * @return
	 * @throws SQLException
	 */
	AnswerBean getAnswertFromAnswer_id(String answer_id)throws SQLException;

	/**
	 * 通过文章留言id删除对应留言信息
	 * @param comment_id
	 * @return
	 * @throws SQLException
	 */
	boolean deleteArticleComment(String comment_id)throws SQLException;

	/**
	 * 通过文章留言id查看此留言下有多少条回复
	 * @param comment_id
	 * @return
	 * @throws SQLException
	 */
	Long findCommentAnswerNum(String comment_id)throws SQLException;

	/**
	 * 通过文章留言id删除留言下的回复
	 * @param comment_id
	 * @throws SQLException
	 */
	boolean deleteArticleCommentAnswer(String comment_id)throws SQLException;

	/**
	 * 通过文章留言回复id删除回复
	 * @param answer_id
	 * @return
	 * @throws SQLException
	 */
	boolean deleteArticleAnswer(String answer_id)throws SQLException;

	/***
	 * 通过文章留言id更新点赞数目
	 * @param comment_id
	 * @param zan
	 * @return
	 * @throws SQLException
	 */
	boolean UpdateCommentZan(String comment_id, int zan)throws SQLException;

	/**
	 * 添加留言点赞
	 * @param zanBean
	 * @return
	 * @throws SQLException
	 */
	boolean addCommentZan(ZanBean zanBean)throws SQLException;

	/**
	 * 取消留言点赞
	 * @param id
	 * @param type2
	 * @throws SQLException
	 */
	void cancelCommentZan(String id, String type2)throws SQLException;

	/**
	 * 通过文章留言回复id更新点赞数目
	 * @param answer_id
	 * @param zan
	 * @return
	 * @throws SQLException
	 */
	boolean UpdateAnswerZan(String answer_id, int zan)throws SQLException;

	/**
	 * 添加留言回复点赞
	 * @param zanBean
	 * @return
	 * @throws SQLException
	 */
	boolean addAnswerZan(ZanBean zanBean)throws SQLException;

	/**
	 * 取消留言回复点赞
	 * @param id
	 * @param type2
	 * @throws SQLException
	 */
	void cancelAnswerZan(String id, String type2)throws SQLException;
	
	/**
	 * 通过用户id，统计发表的博文数
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	Long countArticles(String uid)throws SQLException;
	
	/**
	 * 通过用户id，统计发表的类型是默认分类的 博文数
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	Long countMArticles(String uid,String type)throws SQLException;
	/**
	 * 通过用户id，统计发表的类型是个人心情的 博文数
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	Long countGArticles(String uid,String type)throws SQLException;
	/**
	 * 通过用户id，统计发表的类型是杂乱无章的 博文数
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	Long countZArticles(String uid,String type)throws SQLException;
	/**
	 * 通过用户id，统计发表的类型是休闲娱乐的 博文数
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	Long countXArticles(String uid,String type)throws SQLException;
	/**
	 * 通过用户id，统计发表的类型是游戏漫画的 博文数
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	Long countYArticles(String uid,String type)throws SQLException;
	/**
	 * 通过用户id，统计发表的类型是旅游摄影的 博文数
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	Long countLArticles(String uid,String type)throws SQLException;
	/**
	 * 通过用户id，统计发表的类型是时尚美食的 博文数
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	Long countSArticles(String uid,String type)throws SQLException;
	/**
	 * 通过用户id，统计发表的类型是校园青春的 博文数
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	Long countQArticles(String uid,String type)throws SQLException;
	/**
	 * 通过用户id，统计发表的类型是媒体科技的 博文数
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	Long countKArticles(String uid,String type)throws SQLException;
	/**
	 * 通过用户id，统计发表的类型是体育健康的 博文数
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	Long countTArticles(String uid,String type)throws SQLException;
	
	/**
	 * 通过用户id查找所有用户文章
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	List<ArticleBean> getArticlesByUid(String uid)throws SQLException;

	/**
	 * 通过文章id删除文章
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	boolean deleteArticle(String id)throws SQLException;
	
	/**
	 * 通过文章id找到对应文章类型
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	ArticleTypeBean getArticleTypeByAid(String id)throws SQLException;

	/**
	 * 通过文章id删除文章类型
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	boolean deleteArticleType(String id)throws SQLException;
	
	/**
	 * 通过用户id查找该用户文章发布的年
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	List getAYearsfrom(String uid)throws SQLException;
	
	/**
	 * 通过作者id和时间找到某个时间范围文章数
	 * @param uid
	 * @param start
	 * @param end
	 * @return
	 * @throws SQLException
	 */
	Long countAByYears(String uid,String start,String end)throws SQLException;
	
	/**
	 * 通过用户id找到用户第一篇文章
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	ArticleBean getFirstArticlesByUid(String id)throws SQLException;
	
	/**
	 * 通过用户id找到改用户所有收藏信息
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	List<CollectBean> getCollectByUid(String uid)throws SQLException;

	/**
	 * 添加文章举报信息
	 * @param report
	 * @return
	 * @throws SQLException
	 */
	boolean addArticleReport(ReportBean report)throws SQLException;

	/**
	 * 添加留言/回复举报信息
	 * @param report
	 * @return
	 * @throws SQLException
	 */
	boolean addReviewsReport(ReportBean report)throws SQLException;

	
}
