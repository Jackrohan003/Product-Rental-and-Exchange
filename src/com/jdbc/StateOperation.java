package com.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jdbc.executor.QueryExecutor;

import com.user.State;

public class StateOperation {

	
	
public static boolean addState(State state) {
		
		String query = "Insert into state(CountryID,StateName)"
				+ " values (?,?)";
		QueryExecutor.prepareStatement(query);
		if (QueryExecutor.getPreparedStatement() != null) {
			try {
				
				QueryExecutor.getPreparedStatement().setInt(1,state.getCid());
				QueryExecutor.getPreparedStatement().setString(2,state.getStatename());
				
				
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
public static List<State> getAll() {
	String query = "Select * from state;";
	return getStateListByQuery(query);
}
public static State getStateById(int id) {
	String query = "Select * from state where StateId = '"+id+"'";
	return getStateListByQuery(query).get(0);
}

private static List<State> getStateListByQuery(String query) {
	List<State> l = new ArrayList<>();
	ResultSet rs = QueryExecutor.executeStatementQuery(query);
if(rs!=null) {
	try {
		while (rs.next()) {
		State c = getStateData(rs);
		
			l.add(c);
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
private static State getStateData(ResultSet rs) throws SQLException {
	State s = new State();
	s.setCid(rs.getInt(2));
	s.setSid(rs.getInt(1));
	s.setStatename(rs.getString(3));

	return s;
}

	
}
