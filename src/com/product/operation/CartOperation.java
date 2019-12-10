package com.product.operation;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jdbc.executor.QueryExecutor;
import com.model.product.Cart;

public class CartOperation {
	public  static Boolean addCart(Cart cart)
	{
		String query = "Insert into Cart(ProductId,ProductPrice,Quantity,UserId)"
				+ " values (?,?,?,?)";
		QueryExecutor.prepareStatement(query);
		if(QueryExecutor.getPreparedStatement()!=null)
		{
			try
			{
			QueryExecutor.getPreparedStatement().setInt(1,cart.getProductId());
			QueryExecutor.getPreparedStatement().setFloat(2,cart.getProductPrice());
			QueryExecutor.getPreparedStatement().setInt(3,cart.getQuantity());
			QueryExecutor.getPreparedStatement().setInt(4,cart.getUserId());
			int i=QueryExecutor.executeStatement();
			if(i>0) {
				System.out.println("Addedd Successfully....");
				return true;
			}
			}catch(SQLException e)
			{
				e.printStackTrace();
			}
		}
		return false;
	}
	
	public  static Boolean updateCart(Cart cart)
	{
		String query = "update Cart set Quantity=?,IsActive=? where CartId=?";
		QueryExecutor.prepareStatement(query);
		if(QueryExecutor.getPreparedStatement()!=null)
		{
			try
			{
				QueryExecutor.getPreparedStatement().setInt(1,cart.getQuantity());
				QueryExecutor.getPreparedStatement().setInt(2,cart.getIsActive());
				QueryExecutor.getPreparedStatement().setInt(3,cart.getCartId());
				
			int i=QueryExecutor.executeStatement();
			if(i>0) {
				System.out.println("Updated Successfully....");
				return true;
			}
			}catch(SQLException e)
			{
				e.printStackTrace();
			}
		}
		return false;
	}
	
	public static List<Cart> getAllById(int id)
	{
		String query = "select * from Cart where UserId="+id+" AND ISActive=1;";
		return getCartListByQuery(query);
	}
	
	public static Cart getAllByOrderId(int id)
	{
		String query = "select * from Cart where CartId="+id+";";
		return getCartListByQuery(query).get(0);
	}
	
	public static Cart getByUserIdAndProductId(int uid,int pid)
	{
		String query = "select * from Cart where UserId="+uid+" And ProductId="+pid+" AND IsActive=1;";
		return getCartListByQuery(query).get(0);
	}
	
	public static boolean deleteFromCart(int id)
	{
		String query = "Delete from Cart where CartId="+id+" AND IsActive=1;";
		QueryExecutor.prepareStatement(query);
		int i = QueryExecutor.executeStatement();
		if(i>0) {
			System.out.println("Updated Successfully....");
			return true;
		}
		else
		{
			return false;
		}
	}
	public static List<Cart> getAllActive()
	{
		String query = "select * from Cart where IsActive = 1;";
		return getCartListByQuery(query);
	}
	
	public static Cart getCategoryById(int id)
	{
		String query = "select * from Cart where CartId="+id+";";
		return getCartListByQuery(query).get(0);
	}
	
	private static List<Cart> getCartListByQuery(String query) {
		List<Cart> l = new ArrayList<>();
		ResultSet rs = QueryExecutor.executeStatementQuery(query);
		if(rs!=null) {
		try {
			while (rs.next()) {
				Cart u = getCartData(rs);
				
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
	private static Cart getCartData(ResultSet rs) throws SQLException {
		Cart c = new Cart();
		c.setCartId(rs.getInt(1));
		c.setProductId(rs.getInt(2));
		c.setProductPrice(rs.getFloat(3));
		c.setQuantity(rs.getInt(4));
		c.setUserId(rs.getInt(5));
		c.setIsActive(rs.getInt(6));
		return c;
	}

}
