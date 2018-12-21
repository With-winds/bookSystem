package com.wwz.bookSystem.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wwz.bookSystem.mapper.NoticeMapper;
import com.wwz.bookSystem.pojo.Notice;
import com.wwz.bookSystem.service.NoticeService;

/**
 * 业务逻辑层，与NoticeMapper对应的实现类
 * @author ASUS
 *
 */
@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeMapper noticeMapper;
	
	//对日期进行格式化
	static SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	
	//发布公告
	@Override
	public void releaseNotice(Notice notice) throws Exception {
		notice.setReleaseTime(dateFormat.format(new Date()));
		int result=noticeMapper.releaseNotice(notice);
		if (result==0) {
			throw new Exception("修改用户信息失败");
		}
	}

	//修改通知
	@Override
	public void updateNotice(Notice notice) throws Exception {
		int result=noticeMapper.updateNotice(notice);
		if (result==0) {
			throw new Exception("修改用户信息失败");
		}
	}

	//删除通知
	@Override
	public void deleteNotice(int id) {
		noticeMapper.deleteNotice(id);
	}

	//查询所有通知
	@Override
	public List<Notice> selectAllNotice() {
		return noticeMapper.selectAllNotice();
	}

	//查看最新公告
	@Override
	public Notice selectLatestNotice() {
		return noticeMapper.selectLatestNotice();
	}

}
