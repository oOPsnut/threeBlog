package com.threeblog.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

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

	/**
	 * 通过文章id更新文章评论数
	 * @param article_id
	 * @param comment_num
	 */
	void updateCommentNumByAId(String article_id, int comment_num)throws SQLException;
	
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
	 * 查找热门标签
	 * @return
	 * @throws SQLException
	 */
	List<Object[]> findHotLabels()throws SQLException;

	/**
	 * 查找热门博文(限制10-15条)
	 * @return
	 * @throws SQLException
	 */
	List<ArticleBean> findHotArticles()throws SQLException;
	
	/**
	 *查找提示搜索关键词（标题/标签）
	 * @param word
	 * @return
	 * @throws SQLException
	 */
	List<ArticleBean> findSearchKey(String word)throws SQLException;
	
	/**
	 * 根据关键词（标题/标签）查找文章(无限制)（可给限制20左右，但需要分页）
	 * @param word
	 * @return
	 * @throws SQLException
	 */
	List<ArticleBean> fingAllAboutWord(String word)throws SQLException;
	
	/**
	 * 查找文章封面
	 * @return
	 * @throws SQLException
	 */
	List<ArticleBean> findArticleCover()throws SQLException;
	
	/**
	 * 查找热门博文(全部)
	 * @return
	 * @throws SQLException
	 */
	List<ArticleBean> findHotestArticle()throws SQLException;
	
	/**
	 * 查找最新博文(全部)
	 * @return
	 * @throws SQLException
	 */
	List<ArticleBean> findNewestArticle()throws SQLException;

	/**
	 * 加载更多热门博文
	 * @param offset
	 * @param size
	 * @param alt
	 * @return
	 * @throws SQLException
	 */
	List<ArticleBean> loadMore(int offset, int size,String alt)throws SQLException;
	
	/**
	 * 根据类型查找博文（全部）
	 * @param type
	 * @return
	 * @throws SQLException
	 */
	List<ArticleBean> findArticleByType(String type)throws SQLException;
	
	/**
	 * 总博文数
	 * @return
	 * @throws SQLException
	 */
	Long countTotalArticles()throws SQLException;
	
	/**
	 * 总博文浏览量
	 * @return
	 * @throws SQLException
	 */
	Object countTotalClickNum()throws SQLException;
	
	/**
	 * 全年新增博文数
	 * @param currentYear
	 * @return
	 * @throws SQLException
	 */
	Long countTotalArticlesByYear(int currentYear)throws SQLException;
	
	/**
	 * 查找所有文章信息，包括封面（需要其中的封面）
	 * @return
	 * @throws SQLException
	 */
	List<ArticleBean> findAllACover()throws SQLException;
	
	/**
	 * 更改文章封面（涉嫌违规图片）
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	boolean ChangeACover(String id)throws SQLException;
	
	/**
	 * 屏蔽文章
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	boolean HideArticle(String id) throws SQLException;
	
	/**
	 * 通过文章类型找到所有对应文章
	 * @param article_type
	 * @return
	 * @throws SQLException
	 */
	List<ArticleBean> findAllArticleByType(String article_type) throws SQLException;
	
	/**
	 * 文章反馈（通过）
	 * @param cid
	 * @return
	 * @throws SQLException
	 */
	boolean PassRenewArticle(String cid)throws SQLException;
	
	/**
	 * 查找到最火热的五篇文章。（评+浏+赞+藏）总数最大
	 * @return
	 * @throws SQLException
	 */
	List<ArticleBean> findAllHotArticles()throws SQLException;
	
	/**
	 * 查找到被举报的博文
	 * @return
	 * @throws SQLException
	 */
	List<ArticleBean> findBeReportedArticle()throws SQLException;
}
