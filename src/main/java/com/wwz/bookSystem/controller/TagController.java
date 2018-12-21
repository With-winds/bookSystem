package com.wwz.bookSystem.controller;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wwz.bookSystem.annotation.PermissionName;
import com.wwz.bookSystem.pojo.Book;
import com.wwz.bookSystem.pojo.Tag;
import com.wwz.bookSystem.service.BookService;
import com.wwz.bookSystem.service.TagService;
import com.wwz.bookSystem.util.Page;

/**
 * 对图书标签表操作的控制器
 * @author ASUS
 *
 */
@Controller
public class TagController {
	
	@Autowired
	TagService tagService;
	
	@Autowired
	BookService bookService;

	//跳转到标签列表界面
	@RequestMapping("/tagList")
	@RequiresPermissions("tag:list")
    @PermissionName("标签列表")
	public String tagList(ModelMap modelMap,Page page) 
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
		List<Tag> tags=tagService.listAllTag();
		//通过总数计算最后一页开始位置
		page.setTotal((int) new PageInfo<Tag>(tags).getTotal());
		page.caculateLast(page.getTotal());
				
		//设置页码
		page.setUpIndex(page.getStart(), page.getCount());
						
		modelMap.addAttribute("tags", tags);
		return "back/book/tagList";
	}
	
	//添加标签
	@RequestMapping("/addTag")
	@RequiresPermissions("tag:add")
    @PermissionName("标签添加")
	public String addTag(Tag tag) throws Exception
	{
		tagService.addTag(tag);
		return "redirect:/tagList";
	}
	
	//删除标签
	@RequestMapping("/deleteTag")
	@RequiresPermissions("tag:delete")
    @PermissionName("标签删除")
	public String deleteTag(int id)
	{
		tagService.deleteTag(id);
		return "redirect:/tagList";
	}
	
	//修改标签
	@RequestMapping("/updateTag")
	@RequiresPermissions("tag:update")
    @PermissionName("标签修改")
	public String updateTag(Tag tag) throws Exception
	{
		tagService.updateTag(tag);
		return "redirect:/tagList";
	}
	
	//通过标签ID查询书籍集合
	@RequestMapping("/seeTag")
	public String seeTag(int id,ModelMap modelMap,Page page)
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
		List<Book> books=bookService.selectBookByTagId(id);
		//通过总数计算最后一页开始位置
		page.setTotal((int) new PageInfo<Book>(books).getTotal());
		page.caculateLast(page.getTotal());
				
		//设置页码
		page.setUpIndex(page.getStart(), page.getCount());
						
		modelMap.addAttribute("books", books);
		modelMap.addAttribute("tagId", id);
		return "back/book/bookList";
	}
	
}
