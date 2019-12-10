package com.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jdbc.executor.QueryExecutor;
import com.user.City;
import com.user.SecurityQuestion;

public class SecurityQuestionOperation {

public static boolean addQuestion(SecurityQuestion q) {
		
		String query = "Insert into security(question)"
				+ " values (?)";
		QueryExecutor.prepareStatement(query);
		if (QueryExecutor.getPreparedStatement() != null) {
			try {
				
//				QueryExecutor.getPreparedStatement().setInt(1,q.getSqid());
				QueryExecutor.getPreparedStatement().setString(1,q.getQuestion());
				
				
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
public static List<SecurityQuestion> getAll() {
	String query = "Select * from security;";
	return getSQListByQuery(query);
}

private static List<SecurityQuestion> getSQListByQuery(String query) {
	List<SecurityQuestion> l = new ArrayList<>();
	ResultSet rs = QueryExecutor.executeStatementQuery(query);
if(rs!=null) {
	try {
		while (rs.next()) {
			SecurityQuestion s = getSQData(rs);
		
			l.add(s);
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
private static SecurityQuestion getSQData(ResultSet rs) throws SQLException {
	SecurityQuestion s = new SecurityQuestion();
	s.setSqid(rs.getInt(1));
	s.setQuestion(rs.getString(2));
	return s;
}

}
