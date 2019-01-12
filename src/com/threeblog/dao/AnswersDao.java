package com.threeblog.dao;

import java.sql.SQLException;
import java.util.List;

import com.threeblog.domain.AnswerBean;

/**
 * 这是针对 文章评论的回复表 的数据访问
 * @author Liang
 *
 */
public interface AnswersDao {

	/**
	 * 通过评论id找到评论回答
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	List<AnswerBean> getAnswersFromComment_id(String id)throws SQLException;
}
