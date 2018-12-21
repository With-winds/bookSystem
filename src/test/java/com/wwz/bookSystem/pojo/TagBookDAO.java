package com.wwz.bookSystem.pojo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

//利用JDBC向tagBook表插入数据
public class TagBookDAO {
	private Connection conn = null;
	private Statement stmt = null;
 
	public TagBookDAO() {
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
 
	public int add(TagBook tag) {
		try {
			String sql = "insert into tagBook(tag_id,book_id) values(?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, tag.getTag_id());
			ps.setInt(2,tag.getBook_id());
			
			ps.executeUpdate();
			
			ps.close();
			stmt.close();
			conn.close();
			
			return 1;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
 
}
