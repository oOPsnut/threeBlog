package com.threeblog.dao;

import java.sql.SQLException;
import java.util.List;

import com.threeblog.domain.AblumBean;

/**
 * 这是针对 相册表 的数据访问
 * @author Liang
 *
 */
public interface AblumDao {

	/**
	 * 通过用户id，查找到所有相册图片信息，返回list 集合
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	List<AblumBean> findUserPhotosByUid(String uid)throws SQLException;
	
	/**
	 * 添加照片
	 * @param ablum
	 * @return
	 * @throws SQLException
	 */
	boolean addAblum(AblumBean ablum)throws SQLException;
}
