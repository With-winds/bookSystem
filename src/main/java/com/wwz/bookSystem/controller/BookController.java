package com.wwz.bookSystem.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wwz.bookSystem.annotation.PermissionName;
import com.wwz.bookSystem.pojo.Book;
import com.wwz.bookSystem.pojo.Tag;
import com.wwz.bookSystem.service.BookService;
import com.wwz.bookSystem.service.TagService;
import com.wwz.bookSystem.util.Page;

/**
 * 对图书表操作的控制器
 * @author ASUS
 *
 */
@Controller
public class BookController {

	@Autowired
	BookService bookService;
	
	@Autowired
	TagService tagService;
	
	//跳转到图书列表界面
	@RequestMapping("/bookList")
	@RequiresPermissions("book:lidt")
    @PermissionName("图书列表")
	public String bookList(Page page,ModelMap modelMap)
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
		List<Book> books=bookService.listAllBook();
		//通过总数计算最后一页开始位置
		page.setTotal((int) new PageInfo<Book>(books).getTotal());
		page.caculateLast(page.getTotal());
				
		//设置页码
		page.setUpIndex(page.getStart(), page.getCount());
		
		modelMap.addAttribute("books", books);
		return "back/book/bookList";
	}
	
	//查看图书详情
	@RequestMapping("/seeBook")
	public String seeBook(int id,ModelMap modelMap)
	{
		Book book=bookService.selectBookById(id);
		modelMap.addAttribute("book", book);
		return "back/book/bookDetail";
	}
	
	//跳转到添加图书界面
	@RequestMapping(value="/addBook",method=RequestMethod.GET)
	@RequiresPermissions("book:add")
    @PermissionName("图书添加")
	public String toAddBook(ModelMap modelMap)
	{
		List<Tag> tags=tagService.listAllTag();
		modelMap.addAttribute("tags", tags);
		return "back/book/addBook";
	}
	
	//添加图书
	@RequestMapping(value="/addBook",method=RequestMethod.POST)
	@RequiresPermissions("book:add")
    @PermissionName("图书添加")
	public String addBook(Book book,String[] tagIds,MultipartFile pictureFile,HttpServletRequest request) throws Exception
	{
		//使用UUID给图片重命名，并去掉四个“-”
		String name = UUID.randomUUID().toString().replaceAll("-", "");
		//获取文件的扩展名
		String ext = FilenameUtils.getExtension(pictureFile.getOriginalFilename());
		
		//设置图片上传路径
		String url = request.getSession().getServletContext().getRealPath("/resources/image/");
	
		//以绝对路径保存重名命后的图片
		pictureFile.transferTo(new File(url+"/"+name + "." + ext));

		System.out.println("上传路径："+url+"/"+name + "." + ext);
		
		//设置数据库保存路径
		book.setImagePath("resources/image/"+name+"."+ext);
		
		//添加书籍信息
		bookService.addBook(book,tagIds);
		
		return "redirect:/bookList";
	}
	
	//删除图书
	@RequestMapping("/deleteBook")
	@RequiresPermissions("book:delete")
    @PermissionName("图书删除")
	public String deleteBook(int id)
	{
		bookService.deleteBook(id);
		return "redirect:/bookList";
	}
	
}
