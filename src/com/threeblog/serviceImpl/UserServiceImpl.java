package com.threeblog.serviceImpl;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.threeblog.dao.AblumDao;
import com.threeblog.dao.FollowDao;
import com.threeblog.dao.MessageDao;
import com.threeblog.dao.ReportDao;
import com.threeblog.dao.UserDao;
import com.threeblog.daoImpl.AblumDaoImpl;
import com.threeblog.daoImpl.FollowDaoImpl;
import com.threeblog.daoImpl.MessageDaoImpl;
import com.threeblog.daoImpl.ReportDaoImpl;
import com.threeblog.daoImpl.UserDaoImpl;
import com.threeblog.domain.AblumBean;
import com.threeblog.domain.FollowBean;
import com.threeblog.domain.MessageBean;
import com.threeblog.domain.ReportBean;
import com.threeblog.domain.UserBean;
import com.threeblog.service.UserService;
import com.threeblog.util.JDBCUtil;

public class UserServiceImpl implements UserService{

	@Override
	public UserBean userLogin(UserBean user) throws SQLException {
		//实现登陆功能
		UserDao dao = new UserDaoImpl();
		UserBean userBean = dao.userLogin(user);
		return userBean;
	}

	@Override
	public boolean userRegister(String id,String phone, String username, String password,Date register_time) throws SQLException{
		//实现注册功能
		UserDao dao=new UserDaoImpl();
		boolean result = dao.userRegister(id,phone, username, password,register_time);
		return result;
	}

	@Override
	public boolean checkPhone(String phone) throws SQLException {
		//实现电话号码存在检测功能
		UserDao dao=new UserDaoImpl();
		boolean flag = dao.checkPhone(phone);
		return flag;
	}

	@Override
	public boolean checkUserName(String username) throws SQLException {
		//实现用户名存在检测功能
		UserDao dao=new UserDaoImpl();
		boolean flag = dao.checkUserName(username);
		return flag;
	}

	@Override
	public String sendCode(String phone, int code) throws SQLException {
		// 第三方电话短信服务
		UserDao dao=new UserDaoImpl();
		String result = dao.sendCode(phone, code);
		return result;
		
	}

	@Override
	public boolean changePasswd(String phone, String password) throws SQLException {
		//用户修改密码
		UserDao dao = new UserDaoImpl();
		boolean result = dao.changePasswd(phone,password);
		return result;
	}

	@Override
	public boolean changeLoginTime(String id, Date last_login_time) throws SQLException{
		//通过id改变登录时间
		UserDao dao = new UserDaoImpl();
		boolean result = dao.changeLoginTime(id,last_login_time);
		return result;
	}

	@Override
	public boolean changeInfo(UserBean user) throws SQLException {
		//通过id改变个人信息
		UserDao dao = new UserDaoImpl();
		boolean c=dao.changeInfo(user);
		return c;
	}

	@Override
	public UserBean findUserInfo(String id) throws SQLException {
		// 通过id查询所有个人信息
		UserDao dao=new UserDaoImpl();
		UserBean userBean = dao.findUserInfo(id);
		return userBean;
	}

	@Override
	public void addMessage(MessageBean message) throws SQLException {
		// 添加消息
		MessageDao dao= new MessageDaoImpl();
		dao.addMessage(message);
	}

	@Override
	public Long countFollowing(String uid) throws SQLException {
		// 通过用户id查找关注数
		FollowDao dao = new FollowDaoImpl();
		Long count = dao.countFollowing(uid);
		return count;
	}

	@Override
	public Long countFollower(String uid) throws SQLException {
		// 通过用户id查找粉丝数
		FollowDao dao = new FollowDaoImpl();
		Long count = dao.countFollower(uid);
		return count;
	}

	@Override
	public boolean checkOldPasswd(String phone, String password) throws SQLException {
		//通过用户电话和用户原密码检测原密码是否一致
		UserDao dao  = new UserDaoImpl();
		boolean result = dao.checkOldPasswd(phone, password);
		return result;
	}

	@Override
	public List<FollowBean> getFollowingsByUid(String uid) throws SQLException {
		// 通过用户id查找关注的用户
		FollowDao dao = new FollowDaoImpl();
		List<FollowBean> list=dao.getFollowingsByUid(uid);
		return list;
	}

	@Override
	public List<FollowBean> getFollowersByUid(String uid) throws SQLException {
		// 通过用户id查找粉丝
		FollowDao dao = new FollowDaoImpl();
		List<FollowBean> list=dao.getFollowersByUid(uid);
		return list;
	}

	@Override
	public boolean findFollowStatus(String id1, String id2) throws SQLException {
		// 判断两用户关注状态
		FollowDao dao = new FollowDaoImpl();
		boolean r = dao.findFollowStatus(id1, id2);
		return r;
	}

	@Override
	public boolean addFollow(FollowBean follow) throws SQLException {
		// 添加关注
		FollowDao dao = new FollowDaoImpl();
		boolean result = dao.addFollow(follow);
		return result;
	}

	@Override
	public boolean cancelFollow(String following_id, String follower_id)throws SQLException {
		// 取消关注
		FollowDao dao = new FollowDaoImpl();
		boolean result = dao.cancelFollow(following_id,follower_id);
		return result;
	}

	@Override
	public List<AblumBean> findUserPhotosByUid(String uid) throws SQLException {
		// 通过用户id，查找到所有相册图片信息，返回list 集合
		AblumDao dao = new AblumDaoImpl();
		List<AblumBean> list = dao.findUserPhotosByUid(uid);
		return list;
	}

	@Override
	public boolean addAblum(AblumBean ablum) throws SQLException {
		//  添加照片
		AblumDao dao = new AblumDaoImpl();
		boolean result = dao.addAblum(ablum);
		return result;
	}

	@Override
	public boolean deletePhoto(String id) throws SQLException {
		// 删除照片
		AblumDao dao = new AblumDaoImpl();
		boolean result = dao.deletePhoto(id);
		return result;
	}

	@Override
	public List<AblumBean> findPhotosByUidYear(String uid, int year) throws SQLException {
		// 通过用户id和年份查找此用户某年内的照片
		AblumDao dao = new AblumDaoImpl();
		List<AblumBean> list = dao.findPhotosByUidYear(uid, year);
		return list;
	}

	@Override
	public List<ReportBean> getMyIllegalsByUid(String uid) throws SQLException {
		// 通过用户id找到所有用户的违规情况
		ReportDao dao =new ReportDaoImpl();
		List<ReportBean> list = dao.getMyIllegalsByUid(uid);
		return list;
	}

	@Override
	public boolean ensureReport(String id) throws SQLException {
		// 确认举报信息
		ReportDao dao = new ReportDaoImpl();
		boolean b = dao.ensureReport(id);
		return b;
	}

	@Override
	public List<ReportBean> getMyReportsByUid(String uid) throws SQLException {
		// 通过用户id找到所有用户的举报情况
		ReportDao dao = new ReportDaoImpl();
		List<ReportBean> list = dao.getMyReportsByUid(uid);
		return list;
	}

	@Override
	public ReportBean getReportByRid(String rid) throws SQLException {
		// 通过举报id找到对应的举报信息
		ReportDao dao =new ReportDaoImpl();
		ReportBean reportBean = dao.getReportByRid(rid);
		return reportBean;
	}

	@Override
	public boolean feedback(String id, String feedback_reason,String status3) throws SQLException {
		// 添加反馈理由
		ReportDao dao =new ReportDaoImpl();
		boolean feedback = dao.feedback(id, feedback_reason,status3);
		return feedback;
	}

	@Override
	public Long countReviews(String uid) throws SQLException {
		// 通过用户id获取评论消息数目
		MessageDao dao = new MessageDaoImpl();
		Long count = dao.countReviews(uid);
		return count;
	}

	@Override
	public Long countFollows(String uid) throws SQLException {
		// 通过用户id获取关注消息数目
		FollowDao dao = new FollowDaoImpl();
		Long count = dao.countFollows(uid);
		return count;
	}

	@Override
	public Long countCollects(String uid) throws SQLException {
		// 通过用户id获取收藏消息数目
		MessageDao dao = new MessageDaoImpl();
		Long count = dao.countCollects(uid);
		return count;
	}

	@Override
	public Long countZans(String uid) throws SQLException {
		//通过用户id获取点赞消息数目
		MessageDao dao = new MessageDaoImpl();
		Long count = dao.countZans(uid);
		return count;
	}

	@Override
	public List<MessageBean> findMessagesByUid(String uid) throws SQLException {
		// 通过用户id获取所有消息
		MessageDao dao = new MessageDaoImpl();
		List<MessageBean> list = dao.findMessagesByUid(uid);
		return list;
	}

	@Override
	public boolean Read(String id) throws SQLException {
		// 将未读改成已读
		MessageDao dao = new MessageDaoImpl();
		boolean read = dao.Read(id);
		return read;
	}

	@Override
	public List<MessageBean> findnotReadReviewsMessagesByUid(String uid) throws SQLException {
		// 通过用户id获取所有未读消息（评论）
		MessageDao dao = new MessageDaoImpl();
		List<MessageBean> list = dao.findnotReadReviewsMessagesByUid(uid);
		return list;
	}

	@Override
	public List<MessageBean> findReadReviewsMessagesByUid(String uid) throws SQLException {
		// 通过用户id获取所有已读消息（评论）
		MessageDao dao = new MessageDaoImpl();
		List<MessageBean> list = dao.findReadReviewsMessagesByUid(uid);
		return list;
	}

	@Override
	public List<MessageBean> findnotReadZanMessagesByUid(String uid) throws SQLException {
		// 通过用户id获取所有未读消息（点赞）
		MessageDao dao = new MessageDaoImpl();
		List<MessageBean> list = dao.findnotReadZanMessagesByUid(uid);
		return list;
	}

	@Override
	public List<MessageBean> findReadZanMessagesByUid(String uid) throws SQLException {
		// 通过用户id获取所有未读消息（点赞）
		MessageDao dao = new MessageDaoImpl();
		List<MessageBean> list = dao.findReadZanMessagesByUid(uid);
		return list;
	}

	@Override
	public List<MessageBean> findnotReadFavorMessagesByUid(String uid) throws SQLException {
		// 通过用户id获取所有未读消息（收藏）
		MessageDao dao = new MessageDaoImpl();
		List<MessageBean> list = dao.findnotReadFavorMessagesByUid(uid);
		return list;
	}

	@Override
	public List<MessageBean> findReadFavorMessagesByUid(String uid) throws SQLException {
		// 通过用户id获取所有已读读消息（收藏）
		MessageDao dao = new MessageDaoImpl();
		List<MessageBean> list = dao.findReadFavorMessagesByUid(uid);
		return list;
	}

	@Override
	public List<FollowBean> findnotReadFollowMessagesByUid(String uid) throws SQLException {
		// 通过用户id获取所有未读消息（关注）
		FollowDao dao = new FollowDaoImpl();
		List<FollowBean> list = dao.findnotReadFollowMessagesByUid(uid);
		return list;
	}

	@Override
	public List<FollowBean> findReadFollowMessagesByUid(String uid) throws SQLException {
		// 通过用户id获取所有已读消息（关注）
		FollowDao dao = new FollowDaoImpl();
		List<FollowBean> list = dao.findReadFollowMessagesByUid(uid);
		return list;
	}

	@Override
	public boolean fRead(String id) throws SQLException {
		// 将未读改成已读(关注)
		FollowDao dao = new FollowDaoImpl();
		boolean fRead = dao.fRead(id);
		return fRead;
	}

	@Override
	public Long CountTotalUsers() throws SQLException {
		// 统计所有注册用户数
		UserDao  dao = new UserDaoImpl();
		Long count = dao.CountTotalUsers();
		return count;
	}

	@Override
	public Long countTotalUserByYear(int currentYear) throws SQLException {
		// 全年新增用户数
		UserDao dao = new UserDaoImpl();
		Long count = dao.countTotalUserByYear(currentYear);
		return count;
	}

	@Override
	public List<UserBean> findLastLoginUser() throws SQLException {
		// 查找最近登陆的20人
		UserDao dao = new UserDaoImpl();
		List<UserBean> list = dao.findLastLoginUser();
		return list;
	}

	@Override
	public List<UserBean> fingAllUser() throws SQLException {
		UserDao dao = new UserDaoImpl();
		List<UserBean> list = dao.fingAllUser();
		return list;
	}

	@Override
	public boolean ChangeUserHead(String id) throws SQLException {
		// 更改用户头像（涉嫌违规图片）
		UserDao dao = new UserDaoImpl();
		boolean head = dao.ChangeUserHead(id);
		return head;
	}

	@Override
	public List<AblumBean> findAllUserAblum() throws SQLException {
		// 按日期查找所有相册图片
		AblumDao dao = new AblumDaoImpl();
		List<AblumBean> list = dao.findAllUserAblum();
		return list;
	}

	@Override
	public boolean ChangePhoto(String id) throws SQLException {
		//更改用户相册（涉嫌违规图片）
		AblumDao dao = new AblumDaoImpl();
		boolean photo = dao.ChangePhoto(id);
		return photo;
	}

	@Override
	public List<UserBean> SearchUser(String username) throws SQLException {
		// 通过用户名模糊查找用户
		UserDao dao = new UserDaoImpl();
		List<UserBean> list = dao.SearchUser(username);
		return list;
	}

}
