package com.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.jdbc.executor.QueryExecutor;

//import com.jdbc.model.Product;
import com.user.User;


public class UserOperation {
	
	public static void addUser(User u) {	
		String query = "Insert into userd(Fname,Lname,Email,MobileNo,Password,AddressLine1,"
				+ "AddressLine2,CityId,StateId,SId,"
				+ "SecurityQuestionAnswer)"
				+ " values (?,?,?,?,?,?,?,?,?,?,?)";
		QueryExecutor.prepareStatement(query);
		if (QueryExecutor.getPreparedStatement() != null) {
			try {
/*				QueryExecutor.getPreparedStatement().setInt(1, u.getId());*/
				QueryExecutor.getPreparedStatement().setString(1, u.getFname());
				QueryExecutor.getPreparedStatement().setString(2, u.getLname());
				QueryExecutor.getPreparedStatement().setString(3, u.getEmail());	
				QueryExecutor.getPreparedStatement().setLong(4, u.getPhone());				
				QueryExecutor.getPreparedStatement().setString(5, u.getPassword());				
				QueryExecutor.getPreparedStatement().setString(6, u.getAdd1());
				QueryExecutor.getPreparedStatement().setString(7, u.getAdd2());
				QueryExecutor.getPreparedStatement().setInt(8, u.getCid());
				QueryExecutor.getPreparedStatement().setInt(9, u.getSid());
				QueryExecutor.getPreparedStatement().setInt(10, u.getSqid());
				QueryExecutor.getPreparedStatement().setString(11, u.getSqans());
				int i = QueryExecutor.executeStatement();
				if(i>0) {
					System.out.println("Addedd Successfully....");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	
	public static boolean updateUser(User u) {	
		String query = "Update userd set Fname=?,Lname=?,MobileNo=?,Password=?,"
				+ "AddressLine1=?,AddressLine2=?,CityId=?,StateId=?,"
				+ "SId=?,"
				+ "SecurityQuestionAnswer=?,IsActive=? where Email=? ";
		QueryExecutor.prepareStatement(query);
		if (QueryExecutor.getPreparedStatement() != null) {
			try {
//				QueryExecutor.getPreparedStatement().setInt(1, u.getId());
				QueryExecutor.getPreparedStatement().setString(1, u.getFname());
				QueryExecutor.getPreparedStatement().setString(2, u.getLname());
				
				QueryExecutor.getPreparedStatement().setLong(3, u.getPhone());				
				QueryExecutor.getPreparedStatement().setString(4, u.getPassword());				
				QueryExecutor.getPreparedStatement().setString(5, u.getAdd1());
				QueryExecutor.getPreparedStatement().setString(6, u.getAdd2());
				QueryExecutor.getPreparedStatement().setInt(7, u.getCid());
				QueryExecutor.getPreparedStatement().setInt(8, u.getSid());
				QueryExecutor.getPreparedStatement().setInt(9, u.getSqid());
				QueryExecutor.getPreparedStatement().setString(10, u.getSqans());
				QueryExecutor.getPreparedStatement().setInt(11, u.getIsactive());
				QueryExecutor.getPreparedStatement().setString(12, u.getEmail());	
				int i = QueryExecutor.executeStatement();
				if(i>0) {
					System.out.println("Updated Successfully...."); 
					return true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		return false;
	}
	public static String validateUser(String userName,String pass) {
		String q = "select * from userd where email='"+userName+"'";
		ResultSet rs = QueryExecutor.executeStatementQuery(q);
		try {
			if(rs.next())
			{
				if(rs.getString(6).equals(pass)) {
					return "success";
				}else {
					return "Incorrect password";
				}
			}
			else
			{
				return "User name Invalid";
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "Invalid Username or pass";
	}
	public static Long getPhoneByEmail(String userName) {
		String q = "select MobileNo from userd where email='"+userName+"'";
		ResultSet rs = QueryExecutor.executeStatementQuery(q);
		try {
			if(rs.next())
			{
					return rs.getLong(5);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}
	
	
	public static User getById(int id) {
		String query = "Select * from userd where UserId=" + id + ";";
		List<User> list = getUserListByQuery(query);
		return list.get(0);
	}
	
	public static List<User> getAll() {
		String query = "Select * from userd;";
		return getUserListByQuery(query);
	}
	
	public static List<User> getUserByUserEmail(String email)
	{
		String query = "SELECT * FROM userd  WHERE Email = '"+email+"'";
		return getUserListByQuery(query);
		
	}
	
	public static User GetUserByUserEmail(String email)
	{
		String query = "SELECT * FROM userd  WHERE Email = '"+email+"'";
		List<User> l =  getUserListByQuery(query);
		return l.get(0);
	}
	public static User GetUserByUserID(int id)
	{
		String query = "SELECT * FROM userd  WHERE UserId = '"+id+"'";
		List<User> l =  getUserListByQuery(query);
		return l.get(0);
	}
	
	public static List<User> getUser(int i) {
		String query = "Select * from userd where id = '"+i+"'";
		return getUserListByQuery(query);
	}
	private static List<User> getUserListByQuery(String query) {
		List<User> l = new ArrayList<>();
		ResultSet rs = QueryExecutor.executeStatementQuery(query);
if(rs!=null) {
		try {
			while (rs.next()) {
				User u = getUserData(rs);
			
				l.add(u);
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
	
public static String getcityByID(int id) {
		
		String query = "Select * from city where CityID = "+id;
		ResultSet rs = QueryExecutor.executeStatementQuery(query);
		
		try {
			if(rs.next()) {
				System.out.println(rs.getString(2));
				return rs.getString(2);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}






public static String getstateByID(int id) {
	
	String query = "Select StateName from state where StateID = "+id;
	ResultSet rs = QueryExecutor.executeStatementQuery(query);
	
	try {
		if(rs.next()) {
			
			return rs.getString(1);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return null;
}

public static String getSeqByID(int id) {
	
	String query = "Select * from security  where SID = "+id;
	ResultSet rs = QueryExecutor.executeStatementQuery(query);
	try {
		if(rs.next()) {
			return rs.getString(2);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return null;
}


public static User getUserByEmail(String email) {
	
	String query = "Select * from userd where Email = "+email;
	ResultSet rs = QueryExecutor.executeStatementQuery(query);
	
	try {
		if(rs.next()) {
			User u = getUserData(rs);
			return u;
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return null;
}


public static String GetUserNameUserEmail(String email)
{
	String query = "SELECT Fname FROM userd  WHERE Email = '"+email+"'";
	/*List<User> l =  getUserListByQuery(query);*/
	String s=null;
	ResultSet rs = QueryExecutor.executeStatementQuery(query);
	if(rs!=null) {
			try {
				while (rs.next()) {
				s=rs.getString(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				// close connection
				QueryExecutor.close();
			}
	}
	
	
	
	
return s;	
}



	
	private static User getUserData(ResultSet rs) throws SQLException {
		
		User u = new User();
		u.setId(rs.getInt(1));
		u.setFname(rs.getString(2));
		u.setLname(rs.getString(3));
		u.setEmail(rs.getString(4));
		u.setPhone(rs.getLong(5));
		u.setPassword(rs.getString(6));
		u.setAdd1(rs.getString(7));
		u.setAdd2(rs.getString(8));
		u.setCid(rs.getInt(9));
		u.setSid(rs.getInt(10));
		u.setSqid(rs.getInt(11));
		u.setSqans(rs.getString(12));
		u.setIsactive(rs.getInt(13));
		int city = rs.getInt(9);
		int state = rs.getInt(10);
		int sque = rs.getInt(11);
		u.setCity(getcityByID(city));
		u.setState(getstateByID(state));
		u.setSquestion(getSeqByID(sque));
		/*u.setDoi(rs.getTimestamp(14));*/
		return u;
		
		
		
	} 
}
