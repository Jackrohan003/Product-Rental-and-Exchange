package com.product.operation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jdbc.executor.QueryExecutor;
import com.model.product.Order;


public class OrderOperation {
	Connection c;
	public static boolean addOrder(Order order) {
		String query = "Insert into `order`(OrderNo,CartId,UserId,DOI,TotalAmount,`Status`) values (?,?,?,?,?,?);";
		QueryExecutor.prepareStatement(query);
		if (QueryExecutor.getPreparedStatement() != null) {
			try {
				QueryExecutor.getPreparedStatement().setString(1, order.getOrderNo());
				QueryExecutor.getPreparedStatement().setInt(2, order.getCartId());
				QueryExecutor.getPreparedStatement().setInt(3, order.getUserId());
				QueryExecutor.getPreparedStatement().setDate(4,order.getDoi());
				QueryExecutor.getPreparedStatement().setFloat(5, order.getTotalAmount());
				QueryExecutor.getPreparedStatement().setInt(6, order.getStatus());
				int i = QueryExecutor.executeStatement();
				if(i>0) {
					System.out.println("Addedd Successfully....");
					return true;
				}
				else
				{
					return false;
				}
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println(e);
			}
			
		}
		// System.out.println(query);
		return false;
		// prepare(query);
	}

	
	
	public static Order getByOrderNo(String id) {
		
		String query = "Select * from `order` where OrderNo = "+id+";";
		ResultSet rs = QueryExecutor.executeStatementQuery(query);
		
		try {
			if(rs.next()) {
				return getOrderData(rs);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	public static List<Order> getAllById(int id) {
		String query = "Select * from `order` where UserId="+id+" GROUP BY OrderNo;";
		return getOrderListByQuery(query);
	}
	
	public static List<Order> getAllOrderById(String id) {
		String query = "Select * from `order` where OrderNo='"+id+"';";
		return getOrderListByQuery(query);
	}
	
	public static List<Order> getAll(){
		String query = "Select * from `order` GROUP BY OrderNo;";
		return getOrderListByQuery(query);
	}
	
	public static int setConfirmOrderByOrderNo(String oid,int s)
	{
		String query = "update `Order` set Status=? where `OrderNo`='"+oid+"';";
		QueryExecutor.prepareStatement(query);
		if(QueryExecutor.getPreparedStatement()!=null)
		{
			try
			{
				QueryExecutor.getPreparedStatement().setInt(1,s);
				int i=QueryExecutor.executeStatement();
				if(i>0) {
					System.out.println("Updated Successfully....");
					return 1;
				}
			}catch(SQLException e)
			{
				e.printStackTrace();
			}
		}
		return 0;
	}
		private static List<Order> getOrderListByQuery(String query) {
		List<Order> l = new ArrayList<>();
		ResultSet rs = QueryExecutor.executeStatementQuery(query);
		if(rs!=null) {
		try {
			while (rs.next()) {
				Order p = getOrderData(rs);
				
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
	
		
	private static Order getOrderData(ResultSet rs) throws SQLException {
		Order p = new Order();
		p.setOrderId(rs.getInt(1));
		p.setOrderNo(rs.getString(2));
		p.setCartId(rs.getInt(3));
		p.setUserId(rs.getInt(4));
		p.setIsActive(rs.getInt(5));
		p.setDoi(rs.getString(6));
		p.setTotalAmount(rs.getFloat(7));
		p.setStatus(rs.getInt(8));
		return p;
	}
}
