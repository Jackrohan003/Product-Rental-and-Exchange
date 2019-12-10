package com.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jdbc.executor.QueryExecutor;

import com.user.Country;

public class CountryOperation {

	
public static boolean addCountry(Country country) {
		
		String query = "Insert into country(name)"
				+ " values (?)";
		QueryExecutor.prepareStatement(query);
		if (QueryExecutor.getPreparedStatement() != null) {
			try {
				
				QueryExecutor.getPreparedStatement().setString(1,country.getCountryname());
				
				
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
	public static List<Country> getAll() {
		String query = "Select * from country;";
		return getCountryListByQuery(query);
	}
	
	private static List<Country> getCountryListByQuery(String query) {
		List<Country> l = new ArrayList<>();
		ResultSet rs = QueryExecutor.executeStatementQuery(query);
if(rs!=null) {
		try {
			while (rs.next()) {
			Country c = getCountryData(rs);
			
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
	private static Country getCountryData(ResultSet rs) throws SQLException {
		Country c = new Country();
		c.setCid(rs.getInt(1));
		c.setCountryname(rs.getString(2));

		return c;
	}

	
	
	
	
	
}
