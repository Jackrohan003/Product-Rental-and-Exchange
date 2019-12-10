package com.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jdbc.executor.QueryExecutor;

import com.user.Admin;

public class AdminOperation {
	
	public static String validateAdmin(String userName,String pass) {
		String q = "select * from admin where email='"+userName+"'";
		ResultSet rs = QueryExecutor.executeStatementQuery(q);
		try {
			if(rs.next())
			{
				if(rs.getString(3).equals(pass)) {
					return "success";
				}else {
					return "Incorrect password";
				}
			}
			else
			{
				return "Admin name Invalid";
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "Invalid Username or pass";
	}
	
	public static boolean addAdmin(Admin admin) {
		
		String query = "Insert into admin(email,password)"
				+ " values (?,?)";
		QueryExecutor.prepareStatement(query);
		if (QueryExecutor.getPreparedStatement() != null) {
			try {
				
				QueryExecutor.getPreparedStatement().setString(1,admin.getEmail());				
				QueryExecutor.getPreparedStatement().setString(2,admin.getPassword());
								int i = QueryExecutor.executeStatement();
				if(i>0) {
					System.out.println("Addedd Successfully....");
					return true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	
public static boolean updateAdmin(Admin admin) {
		
		String query = "Update admin set password=? where email =?";
		QueryExecutor.prepareStatement(query);
		if (QueryExecutor.getPreparedStatement() != null) {
			try {
				
				QueryExecutor.getPreparedStatement().setString(2,admin.getEmail());
				
				QueryExecutor.getPreparedStatement().setString(1,admin.getPassword());
								int i = QueryExecutor.executeStatement();
				if(i>0) {
					System.out.println("Addedd Successfully....");
					return true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	
	}
public static Admin getAdminByUserName(String email)
{
	String query = "SELECT * FROM admin WHERE EMAIL = '"+email+"'";
	List<Admin> l =  getAdminListByQuery(query);
	return l.get(0);
}
	
	
	public static List<Admin> getAll() {
		String query = "Select * from admin;";
		return getAdminListByQuery(query);
	}
	
	private static List<Admin> getAdminListByQuery(String query) {
		List<Admin> l = new ArrayList<>();
		ResultSet rs = QueryExecutor.executeStatementQuery(query);
if(rs!=null) {
		try {
			while (rs.next()) {
			Admin a = getAdminData(rs);
			
				l.add(a);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// close connection
			QueryExecutor.close();
		}
}
		return l;
	}
	private static Admin getAdminData(ResultSet rs) throws SQLException {
		Admin a = new Admin();
		a.setId(rs.getInt("adminid"));
		a.setEmail(rs.getString(2));
		a.setPassword(rs.getString(3));

		return a;
	}

}
