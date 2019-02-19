package com.threeblog.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.threeblog.dao.AnswersDao;
import com.threeblog.dao.ArticleDao;
import com.threeblog.dao.CollectDao;
import com.threeblog.dao.CommentDao;
import com.threeblog.dao.ReportDao;
import com.threeblog.dao.ZanDao;
import com.threeblog.daoImpl.AnswersDaoImpl;
import com.threeblog.daoImpl.ArticleDaoImpl;
import com.threeblog.daoImpl.CollectDaoImpl;
import com.threeblog.daoImpl.CommentDaoImpl;
import com.threeblog.daoImpl.ReportDaoImpl;
import com.threeblog.daoImpl.ZanDaoImpl;
import com.threeblog.domain.AnswerBean;
import com.threeblog.domain.ArticleBean;
import com.threeblog.domain.ArticleTypeBean;
import com.threeblog.domain.CollectBean;
import com.threeblog.domain.CommentBean;
import com.threeblog.domain.ReportBean;
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
		//System.out.println(atBean);
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

	@Override
	public void updateCollectNumByAId(String id, int collect_num) throws SQLException {
		// 通过文章id更新文章喜欢数
		ArticleDao dao = new ArticleDaoImpl();
		dao.updateCollectNumByAId(id,collect_num);	
	}

	@Override
	public boolean addArticleCollect(CollectBean collect) throws SQLException {
		//将文章点赞信息写进表
		CollectDao dao = new CollectDaoImpl();
		boolean result = dao.addArticleCollect(collect);
		return result;
	}

	@Override
	public CollectBean findArticleCollect(String id) throws SQLException {
		// 通过收藏id找到收藏信息
		CollectDao dao = new CollectDaoImpl();
		CollectBean cBean = dao.findArticleCollect(id);
		return cBean;
	}

	@Override
	public boolean UpdateArticleCollect(CollectBean collect) throws SQLException {
		// 通过点赞id更新点赞图标
		CollectDao dao = new CollectDaoImpl();
		boolean result = dao.UpdateArticleCollect(collect);
		return result;
	}

	@Override
	public CollectBean findACollect(String uid, String id) throws SQLException {
		//通过用户id和文章id找到收藏信息
		CollectDao dao = new CollectDaoImpl();
		CollectBean cBean = dao.findACollect(uid,id);
		return cBean;
	}

	@Override
	public List<CommentBean> getCommentsFromArticle_id(String aid) throws SQLException {
		// 通过文章id找到留言
		CommentDao dao = new CommentDaoImpl();
		List<CommentBean> comments=dao.getCommentsFromArticle_id(aid);
		return comments;
	}

	@Override
	public List<AnswerBean> getAnswersFromComment_id(String id) throws SQLException {
		// 通过评论id找到留言回答
		AnswersDao dao = new AnswersDaoImpl();
		List<AnswerBean> answers=dao.getAnswersFromComment_id(id);
		return answers;
	}

	@Override
	public void updateCommentNumByAId(String article_id, int comment_num) throws SQLException {
		// 通过文章id，更新留言数目
		ArticleDao dao = new ArticleDaoImpl();
		dao.updateCommentNumByAId(article_id,comment_num);
		
	}

	@Override
	public boolean addArticleComment(CommentBean comment) throws SQLException {
		// 将文章留言写进表
		CommentDao dao=new CommentDaoImpl();
		boolean result = dao.addArticleComment(comment);
		return result;
		
	}

	@Override
	public boolean addArticleCommentAnswer(AnswerBean answer) throws SQLException {
		// 将文章留言回复写进表
		AnswersDao dao = new AnswersDaoImpl();
		boolean result = dao.addArticleCommentAnswer(answer);
		return result;
	}

	@Override
	public CommentBean getCommentFromComment_id(String comment_id) throws SQLException {
		// 通过文章留言id获得留言信息
		CommentDao dao = new CommentDaoImpl();
		CommentBean comment = dao.getCommentFromComment_id(comment_id);
		return comment;
	}

	@Override
	public AnswerBean getAnswertFromAnswer_id(String answer_id) throws SQLException {
		// 通过文章留言回复id获得留言回复信息
		AnswersDao dao=new AnswersDaoImpl();
		AnswerBean answer = dao.getAnswertFromAnswer_id(answer_id);
		return answer;
	}

	@Override
	public boolean deleteArticleComment(String comment_id) throws SQLException {
		// 通过文章留言id删除对应留言信息
		CommentDao dao = new CommentDaoImpl();
		boolean result = dao.deleteArticleComment(comment_id);
		return result;
	}

	@Override
	public Long findCommentAnswerNum(String comment_id) throws SQLException {
		// 通过文章留言id查看此留言下有多少条回复
		AnswersDao dao=new AnswersDaoImpl();
		Long count = dao.findCommentAnswerNum(comment_id);
		return count;
	}

	@Override
	public boolean deleteArticleCommentAnswer(String comment_id) throws SQLException {
		// 通过文章留言id删除留言下的回复
		AnswersDao dao=new AnswersDaoImpl();
		boolean result = dao.deleteArticleCommentAnswer(comment_id);
		return result;
	}

	@Override
	public boolean deleteArticleAnswer(String answer_id) throws SQLException {
		// 通过文章留言回复id删除回复
		AnswersDao dao=new AnswersDaoImpl();
		boolean result = dao.deleteArticleAnswer(answer_id);
		return result;
	}

	@Override
	public boolean UpdateCommentZan(String comment_id, int zan) throws SQLException {
		// 通过文章留言id更新点赞数目
		CommentDao dao = new CommentDaoImpl();
		boolean result = dao.UpdateCommentZan(comment_id, zan);
		return result;
	}

	@Override
	public boolean addCommentZan(ZanBean zanBean) throws SQLException {
		// 添加留言点赞
		ZanDao dao=new ZanDaoImpl();
		boolean result = dao.addCommentZan(zanBean);
		return result;
	}

	@Override
	public void cancelCommentZan(String id, String type2) throws SQLException {
		// 取消留言点赞
		ZanDao dao=new ZanDaoImpl();
		dao.cancelCommentZan(id, type2);		
	}

	@Override
	public boolean UpdateAnswerZan(String answer_id, int zan) throws SQLException {
		// 通过文章留言回复id更新点赞数目
		AnswersDao dao = new AnswersDaoImpl();
		boolean result = dao.UpdateAnswerZan(answer_id, zan);
		return result;
	}

	@Override
	public boolean addAnswerZan(ZanBean zanBean) throws SQLException {
		// 添加留言回复点赞
		ZanDao dao=new ZanDaoImpl();
		boolean result = dao.addAnswerZan(zanBean);
		return result;
	}

	@Override
	public void cancelAnswerZan(String id, String type2) throws SQLException {
		// 取消留言回复点赞
		ZanDao dao=new ZanDaoImpl();
		dao.cancelAnswerZan(id, type2);				
	}

	@Override
	public Long countArticles(String uid) throws SQLException {
		// 通过用户id，统计发表的博文数
		ArticleDao dao =new ArticleDaoImpl();
		Long count = dao.countArticles(uid);
		return count;
	}

	@Override
	public Long countMArticles(String uid,String type) throws SQLException {
		// 通过用户id，统计发表的类型是默认分类的 博文数
		ArticleDao dao =new ArticleDaoImpl();
		Long count = dao.countMArticles(uid,type);
		return count;
	}

	@Override
	public Long countGArticles(String uid,String type) throws SQLException {
		//通过用户id，统计发表的类型是个人心情的 博文数
		ArticleDao dao =new ArticleDaoImpl();
		Long count = dao.countGArticles(uid,type);
		return count;
	}

	@Override
	public Long countZArticles(String uid,String type) throws SQLException {
		// 通过用户id，统计发表的类型是杂乱无章的 博文数
		ArticleDao dao =new ArticleDaoImpl();
		Long count = dao.countZArticles(uid,type);
		return count;
	}

	@Override
	public Long countXArticles(String uid,String type) throws SQLException {
		// 通过用户id，统计发表的类型是休闲娱乐的 博文数
		ArticleDao dao =new ArticleDaoImpl();
		Long count = dao.countXArticles(uid,type);
		return count;
	}

	@Override
	public Long countYArticles(String uid,String type) throws SQLException {
		// 通过用户id，统计发表的类型是游戏漫画的 博文数
		ArticleDao dao =new ArticleDaoImpl();
		Long count = dao.countYArticles(uid,type);
		return count;
	}

	@Override
	public Long countLArticles(String uid,String type) throws SQLException {
		// 通过用户id，统计发表的类型是旅游摄影的 博文数
		ArticleDao dao =new ArticleDaoImpl();
		Long count = dao.countLArticles(uid,type);
		return count;
	}

	@Override
	public Long countSArticles(String uid,String type) throws SQLException {
		//通过用户id，统计发表的类型是时尚美食的 博文数
		ArticleDao dao =new ArticleDaoImpl();
		Long count = dao.countSArticles(uid,type);
		return count;
	}

	@Override
	public Long countQArticles(String uid,String type) throws SQLException {
		// 通过用户id，统计发表的类型是校园青春的 博文数
		ArticleDao dao =new ArticleDaoImpl();
		Long count = dao.countQArticles(uid,type);
		return count;
	}

	@Override
	public Long countKArticles(String uid,String type) throws SQLException {
		//通过用户id，统计发表的类型是媒体科技的 博文数
		ArticleDao dao =new ArticleDaoImpl();
		Long count = dao.countKArticles(uid,type);
		return count;
	}

	@Override
	public Long countTArticles(String uid,String type) throws SQLException {
		//通过用户id，统计发表的类型是体育健康的 博文数
		ArticleDao dao =new ArticleDaoImpl();
		Long count = dao.countTArticles(uid,type);
		return count;
	}

	@Override
	public List<ArticleBean> getArticlesByUid(String uid) throws SQLException {
		// 通过用户id查找所有用户文章
		ArticleDao dao = new ArticleDaoImpl();
		List<ArticleBean> list = dao.getArticlesByUid(uid);
		return list;
	}

	@Override
	public boolean deleteArticle(String id) throws SQLException {
		// 通过文章id删除文章
		ArticleDao dao = new ArticleDaoImpl();
		boolean result = dao.deleteArticle(id);
		return result;
	}

	@Override
	public ArticleTypeBean getArticleTypeByAid(String id) throws SQLException {
		//  通过文章id找到对应文章类型
		ArticleDao dao = new ArticleDaoImpl();
		ArticleTypeBean atBean = dao.getArticleTypeByAid(id);
		return atBean;
	}

	@Override
	public boolean deleteArticleType(String id) throws SQLException {
		// 通过文章id删除文章类型
		ArticleDao dao = new ArticleDaoImpl();
		boolean r = dao.deleteArticleType(id);
		return r;
	}

	@Override
	public List getAYearsfrom(String uid) throws SQLException {
		// 通过用户id查找该用户文章发布的年
		ArticleDao dao = new ArticleDaoImpl();
		List list = dao.getAYearsfrom(uid);
		return list;
	}

	@Override
	public Long countAByYears(String uid, String start, String end) throws SQLException {
		// 通过作者id和时间找到某个时间范围文章数
		ArticleDao dao = new ArticleDaoImpl();
		Long count = dao.countAByYears(uid, start, end);
		return count;
	}

	@Override
	public ArticleBean getFirstArticlesByUid(String id) throws SQLException {
		// 通过用户id找到用户第一篇文章
		ArticleDao dao = new ArticleDaoImpl();
		ArticleBean aBean = dao.getFirstArticlesByUid(id);
		return aBean;
	}

	@Override
	public List<CollectBean> getCollectByUid(String uid) throws SQLException {
		// 通过用户id找到改用户所有收藏信息
		CollectDao dao =new CollectDaoImpl();
		List<CollectBean> list = dao.getCollectByUid(uid);
		return list;
	}

	@Override
	public boolean addArticleReport(ReportBean report) throws SQLException {
		// 添加文章举报信息
		ReportDao dao = new ReportDaoImpl();
		boolean result = dao.addArticleReport(report);
		return result;
	}

	@Override
	public boolean addReviewsReport(ReportBean report) throws SQLException {
		// 添加留言/回复举报信息
		ReportDao dao = new ReportDaoImpl();
		boolean result = dao.addReviewsReport(report);
		return result;
	}

	@Override
	public List<Object[]> findHotLabels() throws SQLException {
		// 查找热门标签
		ArticleDao dao = new ArticleDaoImpl();
		List<Object[]> list = dao.findHotLabels();
		return list;
	}

	@Override
	public List<ArticleBean> findHotArticles() throws SQLException {
		// 查找热门博文(限制10-15条)
		ArticleDao dao = new ArticleDaoImpl();
		List<ArticleBean> articles = dao.findHotArticles();
		return articles;
	}

	@Override
	public List<ArticleBean> findSearchKey(String word) throws SQLException {
		//  查找提示搜索关键词（标题/标签）
		ArticleDao dao = new ArticleDaoImpl();
		List<ArticleBean> articles = dao.findSearchKey(word);
		return articles;
	}

	@Override
	public List<ArticleBean> fingAllAboutWord(String word) throws SQLException {
		// 根据关键词（标题/标签）查找文章(无限制)（可给限制20左右，但需要分页）
		ArticleDao dao = new ArticleDaoImpl();
		List<ArticleBean> articles = dao.fingAllAboutWord(word);
		return articles;
	}

	@Override
	public List<ArticleBean> findArticleCover() throws SQLException {
		// 查找文章封面
		ArticleDao dao = new ArticleDaoImpl();
		List<ArticleBean> articles = dao.findArticleCover();
		return articles;
	}

	@Override
	public List<ArticleBean> findHotestArticle() throws SQLException {
		// 查找热门博文(全部)
		ArticleDao dao = new ArticleDaoImpl();
		List<ArticleBean> articles = dao.findHotestArticle();
		return articles;
	}

	@Override
	public List<ArticleBean> findNewestArticle() throws SQLException {
		// 查找最新博文(全部)
		ArticleDao dao = new ArticleDaoImpl();
		List<ArticleBean> articles = dao.findNewestArticle();
		return articles;
	}

	@Override
	public List<ArticleBean> loadMore(int offset, int size,String alt)throws SQLException {
		// 加载更多热门博文
		//System.out.println(alt);
		ArticleDao dao = new ArticleDaoImpl();
		List<ArticleBean> articles = dao.loadMore(offset, size,alt);
		return articles;
	}

	@Override
	public List<ArticleBean> findArticleByType(String type) throws SQLException {
		// 根据类型查找博文（全部）
		ArticleDao dao = new ArticleDaoImpl();
		List<ArticleBean> articles = dao.findArticleByType(type);
		return articles;
	}

	@Override
	public Long countTotalArticles() throws SQLException {
		// 总博文数
		ArticleDao dao = new ArticleDaoImpl();
		Long totalArticles = dao.countTotalArticles();
		return totalArticles;
	}

	@Override
	public Object  countTotalClickNum() throws SQLException {
		// 总博文浏览量
		ArticleDao dao = new ArticleDaoImpl();
		Object totalClickNum = dao.countTotalClickNum();
		return totalClickNum;
	}

	@Override
	public Long countTotalArticlesByYear(int currentYear) throws SQLException {
		// 全年新增博文数
		ArticleDao dao = new ArticleDaoImpl();
		Long count = dao.countTotalArticlesByYear(currentYear);
		return count;
	}

	@Override
	public List<ArticleBean> findAllACover() throws SQLException {
		// 查找所有文章信息，包括封面（需要其中的封面）
		ArticleDao dao = new ArticleDaoImpl();
		List<ArticleBean> list = dao.findAllACover();
		return list;
	}

	@Override
	public boolean ChangeACover(String id) throws SQLException {
		// 更改文章封面（涉嫌违规图片）
		ArticleDao dao = new ArticleDaoImpl();
		boolean aCover = dao.ChangeACover(id);
		return aCover;
	}

	
	
}
