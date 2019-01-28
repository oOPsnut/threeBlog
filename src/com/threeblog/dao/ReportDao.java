package com.threeblog.dao;

import java.sql.SQLException;
import java.util.List;

import com.threeblog.domain.ReportBean;

/**
 * 这是针对  举报表 的数据访问
 * @author Liang
 *
 */
public interface ReportDao {

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
	
	/**
	 * 通过用户id找到所有用户的违规情况
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	List<ReportBean> getMyIllegalsByUid(String uid)throws SQLException;
	
	/**
	 * 确认举报信息
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	boolean ensureReport(String id)throws SQLException;
	
	/**
	 * 通过用户id找到所有用户的举报情况
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	List<ReportBean> getMyReportsByUid(String uid)throws SQLException;
}
