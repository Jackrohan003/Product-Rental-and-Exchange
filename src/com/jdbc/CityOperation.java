package com.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jdbc.executor.QueryExecutor;
import com.user.City;


public class CityOperation {

	
	
public static boolean addCity(City city) {
		
		String query = "Insert into city(CityName,StateID)"
				+ " values (?,?)";
		QueryExecutor.prepareStatement(query);
		if (QueryExecutor.getPreparedStatement() != null) {
			try {
				
				QueryExecutor.getPreparedStatement().setString(1,city.getCityname());
				QueryExecutor.getPreparedStatement().setInt(1,city.getStateid());
				
				
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
public static List<City> getAll() {
	String query = "Select city.cityid,city.city_name,state.statename from city INNER JOIN state ON city.stateid = state.stateid ORDER BY statename;";
	return getCityListByQuery(query);
}
public static List<City> getAllCity() {
	String query = "Select * from city ";
	return getCityListByQuery(query);
}


public static City getByCityId(int i) {
	String query = "Select * from city where CityID = "+i+";";
	return getCityListByQuery(query).get(0);
}

public static City getCityIdByCname(String cname) {
	String query = "Select * from city where City_Name = '"
+cname+"';";
	 List<City> list = getCityListByQuery(query);
	 if(list.size() > 0) {
		 return list.get(0);
	 }else {
		 return null;
	 }
	 
}

public static List<City> getCityIdByStateId(int sid) {
	String query = "Select * from city where StateId = '"
+sid+"';";
	 return getCityListByQuery(query);
	
	 
}



private static List<City> getCityListByQuery(String query) {
	List<City> l = new ArrayList<>();
	ResultSet rs = QueryExecutor.executeStatementQuery(query);
if(rs!=null) {
	try {
		while (rs.next()) {
		City cit = getCityData(rs);
		
			l.add(cit);
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
private static City getCityData(ResultSet rs) throws SQLException {
	City c = new City();
	c.setCityid(rs.getInt(1));
	c.setCityname(rs.getString(2));
	c.setStatename(rs.getString(3));
	c.setIsactive(rs.getInt(4));
	return c;
}







	
	
	
	


	
	
	
	
}
