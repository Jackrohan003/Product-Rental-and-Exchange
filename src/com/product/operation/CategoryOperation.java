package com.product.operation;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.jdbc.executor.QueryExecutor;
import com.model.product.Category;

public class CategoryOperation {

	public static void addCategory(Category c) {
	
		String query = "Insert into productcategory(CategoryName,ctype) values (?,?)";
		QueryExecutor.prepareStatement(query);
		if (QueryExecutor.getPreparedStatement() != null) {
			try {
				QueryExecutor.getPreparedStatement().setString(1, c.getCategoryname());
				QueryExecutor.getPreparedStatement().setInt(2, c.getCategoryType());
			
		
				int i = QueryExecutor.executeStatement();
				if(i>0) {
					System.out.println("Addedd Successfully....");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
public static void updateCategory(Category c) {
		
		String query = "Update productcategory set CategoryName=?,IsActive=? where ProductCategoryId=? ";
		QueryExecutor.prepareStatement(query);
		if (QueryExecutor.getPreparedStatement() != null) {
			try {
				QueryExecutor.getPreparedStatement().setString(1, c.getCategoryname());
			
				QueryExecutor.getPreparedStatement().setInt(2, c.getIsactive());
				QueryExecutor.getPreparedStatement().setInt(3, c.getCategoryid());
				
				int i = QueryExecutor.executeStatement();
				if(i>0) {
					System.out.println("Addedd Successfully....");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
public static List<Category> getAll() {
	String query = "Select * from productcategory;";
	return getProductListByQuery(query);
}
public static List<Category> getAllByType(int type) {
	String query = "Select * from productcategory where ctype = '"+type+"'  ";
	return getProductListByQuery(query);
}
public static List<Category> getAllByName(String name) {
	String query = "Select * from productcategory where CategoryName = '"+name+"'";
	return getProductListByQuery(query);
}
public static List<Category> getAllByID(int id) {
	String query = "Select * from productcategory where ProductCategoryId = '"+id+"'  ";
	return getProductListByQuery(query);
}



private static List<Category> getProductListByQuery(String query) {
	List<Category> l = new ArrayList<>();
	ResultSet rs = QueryExecutor.executeStatementQuery(query);
if(rs!=null) {
	try {
		while (rs.next()) {
			Category p = getCategoryData(rs);
			
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

private static Category getCategoryData(ResultSet rs) throws SQLException {
	Category p = new Category();
	p.setCategoryid(rs.getInt(1));
	p.setCategoryname(rs.getString(2));
	p.setCategoryType(rs.getInt(3));
	p.setIsactive(rs.getInt(4));

	return p;
}
	
}
