package com.wwz.bookSystem.pojo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

//利用JDBC向tag表插入数据
public class TagDAO {
	 
	private Connection conn = null;
	private Statement stmt = null;
 
	public TagDAO() {
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
 
	public int add(Tag tag) {
		try {
			String sql = "insert into tag(id,name) values(?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, tag.getId());
			ps.setString(2,tag.getName());
			
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
