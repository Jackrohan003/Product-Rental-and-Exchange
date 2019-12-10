package com.chat.operation;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.chat.model.Chat;
import com.jdbc.executor.QueryExecutor;
import com.jdbc.model.Product;
import com.user.City;

public class ChatOperation {

	
public static boolean addChat(Chat c) {
		
		String query = "Insert into chatroom(fromemail,toemail,msg,fromname,toname)"
				+ " values (?,?,?,?,?)";
		QueryExecutor.prepareStatement(query);
		if (QueryExecutor.getPreparedStatement() != null) {
			try {
				
				QueryExecutor.getPreparedStatement().setString(1,c.getFromemail());
				QueryExecutor.getPreparedStatement().setString(2,c.getToemail());
				QueryExecutor.getPreparedStatement().setString(3,c.getMsg());
				QueryExecutor.getPreparedStatement().setString(4,c.getFromname());
				QueryExecutor.getPreparedStatement().setString(5,c.getToname());
				
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
	

public static List<Chat> getChatbyFromAndTO(int fid,int toid) {
	String query = "Select * from chatroom where fromid = '"+fid+"' AND toid = '"+toid+"';";
	 return getChatListByQuery(query);
	
}

public static ArrayList<String> getChatbyFromEmailToEmail(String fid) {
	String query = "Select DISTINCT toemail from chatroom where fromemail = '"+fid+"';";
	 return getChatListByArray(query);
	
}

public static String getChatbyFromEmail(String fid) {
	String q = "Select DISTINCT toemail from chatroom where fromemail = '"+fid+"' ";
	ResultSet rs = QueryExecutor.executeStatementQuery(q);
	try {
		if(rs.next())
		{
				return rs.getString(3);
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

	return null;
}





public static List<Chat> getChatbyTOAndFrom(String fid,String toid) {
	String query = "Select * from chatroom where fromemail = '"+fid+"' AND toemail = '"+toid+"' OR fromemail = '"+toid+"' AND toemail = '"+fid+"';";
	 return getChatListByQuery(query);
	
}



private static List<Chat> getChatListByQuery(String query) {
	List<Chat> l = new ArrayList<>();
	ResultSet rs = QueryExecutor.executeStatementQuery(query);
if(rs!=null) {
	try {
		while (rs.next()) {
			Chat p = getChatData(rs);
			l.add(p);
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


private static ArrayList<String> getChatListByArray(String query) {
	ArrayList<String> l = new ArrayList<>();
	ResultSet rs = QueryExecutor.executeStatementQuery(query);
if(rs!=null) {
	try {
		while (rs.next()) {
			
			l.add(rs.getString(1));
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



private static Chat getChatData(ResultSet rs) throws SQLException {
	Chat c = new Chat();
	c.setChatid(rs.getInt(1));
	c.setFromemail(rs.getString(2));
	c.setToemail(rs.getString(3));
	c.setMsg(rs.getString(4));
	c.setFromname(rs.getString(5));
	c.setToname(rs.getString(6));
	return c;
}
	
	
	
	
	
	
}
