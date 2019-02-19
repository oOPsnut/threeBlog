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
	
	/**
	 * 删除照片
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	boolean deletePhoto(String id)throws SQLException;
	
	/**
	 * 通过用户id和年份查找此用户某年内的照片
	 * @param uid
	 * @param year
	 * @return
	 * @throws SQLException
	 */
	List<AblumBean> findPhotosByUidYear(String uid,int year)throws SQLException;
	
	/**
	 * 按日期查找所有相册图片
	 * @return
	 * @throws SQLException
	 */
	List<AblumBean> findAllUserAblum()throws SQLException;
	
	/**
	 * 更改用户相册（涉嫌违规图片）
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	boolean ChangePhoto(String id) throws SQLException;
}
