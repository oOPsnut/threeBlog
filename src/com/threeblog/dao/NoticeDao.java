package com.threeblog.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import com.threeblog.domain.NoticeBean;

/**
 * 这是针对 公告表 的数据访问
 * @author Liang
 *
 */
public interface NoticeDao {

	/**
	 * 新增公告
	 * @param notice
	 * @return
	 * @throws SQLException
	 */
	boolean addNotice(NoticeBean notice)throws SQLException;
	
	/**
	 * 通过id查找对应公告
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	NoticeBean fingNoticeById(String id)throws SQLException;
	
	/**
	 * 查找到最新一篇
	 * @return
	 * @throws SQLException
	 */
	NoticeBean findLatelyNotice()throws SQLException;
	
	/**
	 * 查找上一篇公告
	 * @param pDate
	 * @return
	 * @throws SQLException
	 */
	NoticeBean findLastNoticeByPubDate(Date pDate)throws SQLException;
	
	/**
	 * 查找下一篇公告
	 * @param pDate
	 * @return
	 * @throws SQLException
	 */
	NoticeBean findNextNoticeByPubDate(Date pDate)throws SQLException;
	
	/**
	 * 查找所有公告
	 * @return
	 * @throws SQLException
	 */
	List<NoticeBean> findAllNotice()throws SQLException;
	
	/**
	 * 删除公告
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	boolean deleteNotice(String id)throws SQLException;
}
