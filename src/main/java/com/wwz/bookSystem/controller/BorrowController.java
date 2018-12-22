package com.wwz.bookSystem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 对借阅表操作的控制器
 * @author ASUS
 *
 */
@Controller
public class BorrowController {

	//跳转到借阅列表界面
	@RequestMapping("/borrowList")
	public String borrowList()
	{
		return "back/borrow/borrowList";
	}
	
}
