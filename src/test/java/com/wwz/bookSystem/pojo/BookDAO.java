package com.wwz.bookSystem.pojo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import com.wwz.bookSystem.pojo.Book;

//利用JDBC向book表插入数据
public class BookDAO {
	private Connection conn = null;
	private Statement stmt = null;
 
	public BookDAO() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/bookSystem?"
					+ "user=root&password=wwzdjj1314&useUnicode=true&characterEncoding=UTF8";
			conn = DriverManager.getConnection(url);
			stmt = conn.createStatement();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
 
	}
 
	public int add(Book book) {
		try {
			String sql = "insert into book(id,name,author,publisher,pubdate,summary,isbn,imagePath) values(?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, book.getId());
			ps.setString(2, book.getName());
			ps.setString(3,book.getAuthor());
			ps.setString(4, book.getPublisher());
			ps.setString(5, book.getPubdate());
			ps.setString(6, book.getSummary());
			ps.setString(7, book.getIsbn());
			ps.setString(8, book.getImagePath());
			ps.executeUpdate();
			
			ps.close();
			stmt.close();
			conn.close();
			
			return 1;
			
			
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		return -1;
	}
}
