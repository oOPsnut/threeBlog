package com.threeblog.dao;

import java.sql.SQLException;
import java.util.List;

import com.threeblog.domain.AnswerBean;

/**
 * 这是针对 文章留言的回复表 的数据访问
 * @author Liang
 *
 */
public interface AnswersDao {

	/**
	 * 通过留言id找到留言回答
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	List<AnswerBean> getAnswersFromComment_id(String id)throws SQLException;
	
	/**
	 * 将文章留言回复写进表
	 * @param answer
	 * @return
	 * @throws SQLException
	 */
	boolean addArticleCommentAnswer(AnswerBean answer)throws SQLException;
	
	/**
	 * 通过文章留言回复id获得留言回复信息
	 * @param answer_id
	 * @return
	 * @throws SQLException
	 */
	AnswerBean getAnswertFromAnswer_id(String answer_id)throws SQLException;
	
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
	
	/**
	 * 通过文章留言回复id更新点赞数目
	 * @param answer_id
	 * @param zan
	 * @return
	 * @throws SQLException
	 */
	boolean UpdateAnswerZan(String answer_id, int zan)throws SQLException;
	
	/**
	 * 屏蔽回复
	 * @param cid
	 * @return
	 * @throws SQLException
	 */
	boolean HideAnswer(String cid)throws SQLException;
	
	/**
	 * 回复反馈（通过）
	 * @param cid
	 * @return
	 * @throws SQLException
	 */
	boolean PassRenewAnswer(String cid)throws SQLException;
	
	/**
	 * 计算某用户的回复数
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	Long countAnswer(String uid)throws SQLException;
}
