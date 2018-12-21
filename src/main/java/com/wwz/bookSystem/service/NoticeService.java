package com.wwz.bookSystem.service;

import java.util.List;

import com.wwz.bookSystem.pojo.Notice;

/**
 * 业务逻辑层，与NoticeMapper对应
 * @author ASUS
 *
 */
public interface NoticeService {

	//发布公告
	public void releaseNotice(Notice notice) throws Exception;
	
	//修改通知
	public void updateNotice(Notice notice) throws Exception;
	
	//删除通知
	public void deleteNotice(int id);
	
	//查询所有通知
	public List<Notice> selectAllNotice();
	
	//查看最新公告
	public Notice selectLatestNotice();
	
}
