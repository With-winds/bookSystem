package com.wwz.bookSystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wwz.bookSystem.pojo.Borrow;
import com.wwz.bookSystem.service.BorrowService;
import com.wwz.bookSystem.util.Page;

/**
 * 对借阅表操作的控制器
 * @author ASUS
 *
 */
@Controller
public class BorrowController {
	
	@Autowired
	BorrowService borrowService;

	//跳转到借阅列表界面
	@RequestMapping("/borrowList")
	public String borrowList(ModelMap modelMap,Page page)
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
		List<Borrow> borrows=borrowService.selectAllBorrow();
		//通过总数计算最后一页开始位置
		page.setTotal((int) new PageInfo<Borrow>(borrows).getTotal());
		page.caculateLast(page.getTotal());
				
		//设置页码
		page.setUpIndex(page.getStart(), page.getCount());
		modelMap.addAttribute("borrows", borrows);
		return "back/borrow/borrowList";
	}
	
}
