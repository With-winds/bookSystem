package com.wwz.bookSystem.service;

import java.util.List;

import com.wwz.bookSystem.pojo.Book;

/**
 * 业务逻辑层，与BookMapper对应
 * @author ASUS
 *
 */
public interface BookService {

	//添加图书
	public void addBook(Book book,String[] tagIds) throws Exception;
	
	//删除图书
	public void deleteBook(int id);
	
	//修改图书
	public void updateBook(Book book) throws Exception;
	
	//查询所有图书
	public List<Book> listAllBook();
	
	//通过ID查询图书
	public Book selectBookById(int id);
	
	//通过标签ID查询书籍集合
	public List<Book> selectBookByTagId(int id);
	
}
