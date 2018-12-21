package com.wwz.bookSystem.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wwz.bookSystem.pojo.Notice;

/**
 * 对公告表notice进行操作
 * @author ASUS
 *
 */
@Mapper
public interface NoticeMapper {

	//发布公告
	public int releaseNotice(Notice notice);
	
	//修改通知
	public int updateNotice(Notice notice);
	
	//删除通知
	public void deleteNotice(int id);
	
	//查询所有通知
	public List<Notice> selectAllNotice();
	
	//查看最新公告
	public Notice selectLatestNotice();
	
}
