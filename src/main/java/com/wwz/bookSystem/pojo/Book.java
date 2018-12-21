package com.wwz.bookSystem.pojo;

import java.util.List;

/**
 * 图书实体----与数据库book表对应
 * @author ASUS
 *
 */
public class Book {

	private int id;				//主键
	private String name;		//图书名
	private String author;		//作者
	private String publisher;	//出版社
	private String pubdate;		//出版时间
	private int borrowNum;		//借阅次数
	private int stock;			//库存
	private String summary;;	//摘要
	private String isbn;		//国际标准书号
	private String imagePath;	//图片
	private List<String> tags;	//标签
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public int getBorrowNum() {
		return borrowNum;
	}
	public void setBorrowNum(int borrowNum) {
		this.borrowNum = borrowNum;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getPubdate() {
		return pubdate;
	}
	public void setPubdate(String pubdate) {
		this.pubdate = pubdate;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public List<String> getTags() {
		return tags;
	}
	public void setTags(List<String> tags) {
		this.tags = tags;
	}
	
}
