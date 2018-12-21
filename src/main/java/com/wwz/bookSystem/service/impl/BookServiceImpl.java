package com.wwz.bookSystem.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wwz.bookSystem.mapper.BookMapper;
import com.wwz.bookSystem.pojo.Book;
import com.wwz.bookSystem.service.BookService;

/**
 * 业务逻辑层，与BookMapper对应的实现类
 * @author ASUS
 *
 */
@Service("bookService")
public class BookServiceImpl implements BookService {

	@Autowired
	BookMapper bookMapper;
	
	//添加图书
	@Override
	public void addBook(Book book,String[] tagIds) throws Exception {
		int result=bookMapper.addBook(book);
		if (result==0) {
			throw new Exception("添加书籍失败");
		}
		
		if (tagIds!=null) {
			//将标签ID转为Integer型
			Integer[] tids=new Integer[tagIds.length];
			for (int i=0;i<tagIds.length;i++) {
				tids[i]=Integer.parseInt(tagIds[i].trim());
			}
			
			Map<String, Object> map=new HashMap<String, Object>();
			
			map.put("book_id", book.getId());
			map.put("tagIds", tids);
			
			//为图书添加标签
			int result2=bookMapper.addTagToBook(map);
			if (result2==0) {
				throw new Exception("为书籍添加标签失败");
			}
		}
	}

	//删除图书
	@Override
	public void deleteBook(int id) {
		//删除图书
		bookMapper.deleteBook(id);
		//通过图书ID删除tagBook表中的对应关系
		bookMapper.deleteTagBookByBookId(id);
	}

	//修改图书
	@Override
	public void updateBook(Book book) throws Exception {
		int result=bookMapper.updateBook(book);
		if (result==0) {
			throw new Exception("添加用户失败");
		}
	}

	//查询图书列表
	@Override
	public List<Book> listAllBook() {
		return bookMapper.listAllBook();
	}

	//通过ID查询图书
	@Override
	public Book selectBookById(int id) {
		return bookMapper.selectBookById(id);
	}

	//通过标签ID查询书籍集合
	@Override
	public List<Book> selectBookByTagId(int id) {
		return bookMapper.selectBookByTagId(id);
	}

}
