package com.wwz.bookSystem.controller;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wwz.bookSystem.annotation.PermissionName;
import com.wwz.bookSystem.pojo.Notice;
import com.wwz.bookSystem.pojo.User;
import com.wwz.bookSystem.service.NoticeService;
import com.wwz.bookSystem.util.Page;

/**
 * 对公告表操作的控制器
 * @author ASUS
 *
 */
@Controller
public class NoticeController {

	@Autowired
	NoticeService noticeService;
	
	//跳转到发布公告界面
	@RequestMapping(value="/releaseNotice",method=RequestMethod.GET)
	@RequiresPermissions("notice:release")
    @PermissionName("公告发布")
	public String toReleaseNotice()
	{
		return "back/notice/releaseNotice";
	}
	
	//发布公告
	@RequestMapping(value="/releaseNotice",method=RequestMethod.POST)
	@RequiresPermissions("notice:release")
    @PermissionName("公告发布")
	public String releaseNotice(Notice notice) throws Exception
	{
		noticeService.releaseNotice(notice);
		return "redirect:/noticeList";
	}
	
	//查看所有公告
	@RequestMapping("/noticeList")
	@RequiresPermissions("notice:list")
    @PermissionName("公告列表")
	public String noticeList(ModelMap modelMap,Page page)
	{
		//如果开始位置start小于0，则置0
		if(page.getStart()<0) {
			page.setStart(0);
		}
		
		//如果开始位置start大于总数，则置为最后一页开始位置
		if(page.getStart()>=page.getTotal()) {
			page.setStart(page.getLast());
		}
		
		//在查询所有数据之前调用pagehelper,参数为开始位置和每页个数
		PageHelper.offsetPage(page.getStart(),page.getCount());
		//查询
		List<Notice> notices=noticeService.selectAllNotice();
		//通过总数计算最后一页开始位置
		page.setTotal((int) new PageInfo<Notice>(notices).getTotal());
		page.caculateLast(page.getTotal());
				
		//设置页码
		page.setUpIndex(page.getStart(), page.getCount());
			
		modelMap.addAttribute("notices", notices);
		return "back/notice/noticeList";
	}
	
	//查看最新公告
	@RequestMapping("/latestNotice")
	public String seeNotice(ModelMap modelMap)
	{
		Notice notice=noticeService.selectLatestNotice();
		modelMap.addAttribute("notice", notice);
		return "back/notice/latestNotice";
	}
	
	//删除公告
	@RequestMapping("/deleteNotice")
	@RequiresPermissions("notice:delete")
    @PermissionName("公告删除")
	public String deleteNotice(int id)
	{
		noticeService.deleteNotice(id);
		return "redirect:/noticeList";
	}
	
	//修改公告
	@RequestMapping("/updateNotice")
	@RequiresPermissions("notice:update")
    @PermissionName("公告修改")
	public String updateNotice(Notice notice) throws Exception
	{
		noticeService.updateNotice(notice);
		return "redirect:/noticeList";
	}
	
	
}
