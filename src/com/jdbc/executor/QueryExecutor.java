package com.jdbc.executor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.jdbc.mysql.connection.MySqlConnection;

public class QueryExecutor extends MySqlConnection {
	private static PreparedStatement p = null;
	
	public static void prepareStatement(String query) {
		c = getConnection();
		if(c!=null) {
		try {
			System.out.println(query);
			p = c.prepareStatement(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
	}
	
	public static int executeStatement() {
		try {
			return p.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			close();
		}
		return 0;
	}
	public static PreparedStatement getPreparedStatement() {
		return p;
	}
	public static int executePreparedQuery(String query)
	{	
		Connection c = getConnection();
		if(c!=null) {
		PreparedStatement p = null;
		
		try {
			System.out.println(query);
			p = c.prepareStatement(query);
			
			p.setString(1, "");
			
			return p.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
				try {
					c.close();
				} catch (SQLException e) {
					System.err.println("Error while closing connection...");
				}
		}
		 
		 System.out.println("DONE");	
		 }
		return 0;
	}
	public static ResultSet executeStatementQuery(String query) {

		c = getConnection();
		if(c!=null) {
	
		try {
			System.out.println(query);
			Statement statement = c.createStatement();
			return statement.executeQuery(query);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 System.out.println("DONE");	
		 }
		return null;
	}
	
	public static void close() {
		closeConnection();
	}
}
