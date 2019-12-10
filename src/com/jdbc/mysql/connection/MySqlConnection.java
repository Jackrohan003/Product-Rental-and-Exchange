package com.jdbc.mysql.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySqlConnection {
	protected static Connection c;
	public static String DRIVER_NAME = "com.mysql.jdbc.Driver";
	public static String URL="jdbc:mysql://localhost:3306/product";
	public static String USERNAME = "root";
	public static String PASSWORD = "root";
	
	protected static Connection getConnection()
	{
		try {
			Class.forName(DRIVER_NAME);
			return DriverManager.getConnection(
					URL,USERNAME,PASSWORD);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	protected static void closeConnection() {
		try {
			if(c!=null)
				c.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
