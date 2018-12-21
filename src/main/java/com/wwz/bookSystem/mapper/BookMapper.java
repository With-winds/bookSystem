package com.wwz.bookSystem.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.wwz.bookSystem.pojo.Book;

/**
 * 对图书表book进行操作
 * @author ASUS
 *
 */
@Mapper
public interface BookMapper {
	
	//添加图书
	public int addBook(Book book);
	
	//为图书添加标签
	public int addTagToBook(Map<String, Object> map);
	
	//删除图书
	public void deleteBook(int id);
	
	//通过图书ID删除tagBook表中的对应关系
	public void deleteTagBookByBookId(int id);
	
	//修改图书
	public int updateBook(Book book);
	
	//查询所有图书
	public List<Book> listAllBook();
	
	//通过书籍ID查询图书
	public Book selectBookById(int id);
	
	//通过标签ID查询书籍集合
	public List<Book> selectBookByTagId(int id);

}
