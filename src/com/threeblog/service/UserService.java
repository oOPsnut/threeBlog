package com.threeblog.service;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import com.threeblog.domain.AblumBean;
import com.threeblog.domain.FollowBean;
import com.threeblog.domain.MessageBean;
import com.threeblog.domain.ReportBean;
import com.threeblog.domain.UserBean;

/**
 * 这是针对于用户的业务处理规范
 * @author Liang
 *
 */
public interface UserService {

	/**
	 * 执行登录，并且返回该用户的所有信息
	 * 根据电话和密码来查找用户
	 */
	UserBean userLogin(UserBean user) throws SQLException;
	
	/**
	 * 注册
	 * @param phone
	 * @param username
	 * @param password
	 */
	boolean userRegister(String id,String phone, String username, String password,Date register_time)throws SQLException;
	
	/**
	 * 检测电话号是否已经注册
	 * @param phone
	 */
	boolean checkPhone(String phone)throws SQLException;
	
	/***
	 * 检测用户名是否使用
	 * @param username
	 * @return
	 * @throws SQLException
	 */
	boolean checkUserName(String username) throws SQLException;
	
	/***
	 * 发送验证码到电话服务
	 * @param phone
	 * @param code
	 * @throws SQLException
	 */
	String sendCode(String phone,int code) throws SQLException;
	
	/***
	 * 用户修改密码
	 * @param phone
	 * @param password
	 * @throws SQLException
	 */
	boolean changePasswd(String phone,String password)throws SQLException;
	
	/**
	 * 通过id修改对应登录时间
	 * @param id
	 * @param last_login_time
	 */
	boolean changeLoginTime(String id, Date last_login_time) throws SQLException;
	
	/**
	 * 通过id修改个人信息
	 * @param user
	 * @throws SQLException
	 */
	boolean changeInfo(UserBean user) throws SQLException;
	
	/**
	 * 通过id查询所有个人信息
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	UserBean findUserInfo(String id)throws SQLException;

	/**
	 * 添加消息
	 * @param message
	 * @throws SQLException
	 */
	void addMessage(MessageBean message)throws SQLException;
	
	/**
	 * 通过用户id查找关注数
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	Long countFollowing(String uid)throws SQLException;
	
	/**
	 * 通过用户id查找粉丝数
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	Long countFollower(String uid)throws SQLException;

	/**
	 * 通过用户电话和用户原密码检测原密码是否一致
	 * @param phone
	 * @param password
	 * @return
	 * @throws SQLException
	 */
	boolean checkOldPasswd(String phone, String password)throws SQLException;
	
	/**
	 * 通过用户id查找关注的用户
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	List<FollowBean> getFollowingsByUid(String uid)throws SQLException;
	
	/**
	 * 通过用户id查找粉丝
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	List<FollowBean> getFollowersByUid(String uid)throws SQLException;
	
	/**
	 * 判断两用户关注状态
	 * @param id1
	 * @param id2
	 * @return
	 * @throws SQLException
	 */
	boolean findFollowStatus(String id1,String id2)throws SQLException;

	/**
	 * 添加关注
	 * @param follow
	 * @return
	 * @throws SQLException
	 */
	boolean addFollow(FollowBean follow)throws SQLException;

	/**
	 * 取消关注
	 * @param following_id
	 * @param follower_id
	 * @return
	 */
	boolean cancelFollow(String following_id, String follower_id)throws SQLException;
	
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
	 * 通过用户id获取评论消息数目
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	Long countReviews(String uid)throws SQLException;
	
	/**
	 * 通过用户id获取关注消息数目
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	Long countFollows(String uid)throws SQLException;
	
	/**
	 * 通过用户id获取收藏消息数目
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	Long countCollects(String uid)throws SQLException;
	
	/**
	 * 通过用户id获取点赞消息数目
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	Long countZans(String uid)throws SQLException;
	
	/**
	 * 通过用户id获取所有消息
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	List<MessageBean> findMessagesByUid(String uid)throws SQLException;
	
	/**
	 * 通过用户id获取所有未读消息（评论）
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	List<MessageBean> findnotReadReviewsMessagesByUid(String uid)throws SQLException;
	
	/**
	 * 通过用户id获取所有已读消息（评论）
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	List<MessageBean> findReadReviewsMessagesByUid(String uid)throws SQLException;

	/**
	 * 将未读改成已读
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	boolean Read(String id)throws SQLException;
	
	/**
	 *  通过用户id获取所有未读消息（点赞）
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	List<MessageBean> findnotReadZanMessagesByUid(String uid)throws SQLException;
	
	/**
	 *  通过用户id获取所有已读消息（点赞）
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	List<MessageBean> findReadZanMessagesByUid(String uid)throws SQLException;
	
	/**
	 * 通过用户id获取所有未读消息（收藏）
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	List<MessageBean> findnotReadFavorMessagesByUid(String uid)throws SQLException;
	
	/**
	 * 通过用户id获取所有已读消息（收藏）
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	List<MessageBean> findReadFavorMessagesByUid(String uid)throws SQLException;
	
	/**
	 * 通过用户id获取所有未读消息（关注）
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	List<FollowBean> findnotReadFollowMessagesByUid(String uid)throws SQLException;
	
	/**
	 * 通过用户id获取所有已读消息（关注）
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	List<FollowBean> findReadFollowMessagesByUid(String uid)throws SQLException;

	/**
	 * 将未读改成已读(关注)
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	boolean fRead(String id)throws SQLException;
	
	/**
	 * 统计所有注册用户数
	 * @return
	 * @throws SQLException
	 */
	Long CountTotalUsers()throws SQLException;
	
	/**
	 * 全年新增用户数
	 * @param currentYear
	 * @return
	 * @throws SQLException
	 */
	Long countTotalUserByYear(int currentYear)throws SQLException;
	
	/**
	 * 查找最近登陆的20人
	 * @return
	 * @throws SQLException
	 */
	List<UserBean> findLastLoginUser()throws SQLException;
	
	/**
	 * 查找所有用户
	 * @return
	 * @throws SQLException
	 */
	List<UserBean> fingAllUser()throws SQLException;

	/**
	 * 更改用户头像（涉嫌违规图片）
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	boolean ChangeUserHead(String id)throws SQLException;
	
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

	/***
	 * 通过用户名模糊查找用户
	 * @param username
	 * @return
	 * @throws SQLException
	 */
	List<UserBean> SearchUser(String username) throws SQLException;
	
	/**
	 * 计算用户被举报次数
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	Long countBeReported(String uid)throws SQLException;
}
