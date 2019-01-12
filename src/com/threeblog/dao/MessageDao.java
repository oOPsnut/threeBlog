package com.threeblog.dao;

import java.sql.SQLException;

import com.threeblog.domain.MessageBean;

/**
 *  这是针对 消息表 的数据访问
 * @author Liang
 *
 */
public interface MessageDao {

	/**
	 * 添加消息
	 * @param message
	 * @throws SQLException
	 */
	void addMessage(MessageBean message)throws SQLException;
}
