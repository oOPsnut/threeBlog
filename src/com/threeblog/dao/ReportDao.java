package com.threeblog.dao;

import java.sql.SQLException;
import java.util.Date;
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
	
	/**
	 * 通过举报id找到对应的举报信息
	 * @param rid
	 * @return
	 * @throws SQLException
	 */
	ReportBean getReportByRid(String rid)throws SQLException;
	
	/**
	 * 添加反馈理由
	 * @param id
	 * @param feedback_reason
	 * @param status3
	 * @return
	 * @throws SQLException
	 */
	boolean feedback(String id, String feedback_reason,String status3)throws SQLException;
	
	/**
	 * 查找所有举报信息
	 * @return
	 * @throws SQLException
	 */
	List<ReportBean> findAllReport()throws SQLException;
	
	/**
	 * 查找所有举报信息(举报消息)
	 * @return
	 * @throws SQLException
	 */
	List<ReportBean> findAllReportMessage()throws SQLException;
	
	/**
	 * 查找所有举报信息(反馈消息)
	 * @return
	 * @throws SQLException
	 */
	List<ReportBean> findAllRenewMessage()throws SQLException;
	
	/**
	 * 计算消息数目（举报消息）
	 * @return
	 * @throws SQLException
	 */
	Long countReports()throws SQLException;
	
	/**
	 * 计算消息数目（反馈消息）
	 * @return
	 * @throws SQLException
	 */
	Long countRenews()throws SQLException;
	
	/**
	 * 更新举报消息（已阅）
	 * @param id
	 * @param notice_time
	 * @return
	 * @throws SQLException
	 */
	boolean ReadReport(String id,Date notice_time)throws SQLException;
	
	/**
	 * 更新举报消息（屏蔽）
	 * @param rid
	 * @param notice_time
	 * @return
	 * @throws SQLException
	 */
	boolean changeReport(String rid,Date notice_time)throws SQLException;
}
