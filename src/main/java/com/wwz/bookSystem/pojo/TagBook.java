package com.wwz.bookSystem.pojo;

/**
 * 标签与图书管理实体----与数据库tagBook表对应
 * @author ASUS
 *
 */
public class TagBook {

	private int id;          //主键
	private int tag_id;		 //标签ID
	private int book_id;	 //书籍ID
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getTag_id() {
		return tag_id;
	}
	public void setTag_id(int tag_id) {
		this.tag_id = tag_id;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public TagBook(int tag_id, int book_id) {
		super();
		this.tag_id = tag_id;
		this.book_id = book_id;
	}
	public TagBook() {
		super();
	}
	
	
}
