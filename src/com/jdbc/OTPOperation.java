package com.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jdbc.executor.QueryExecutor;
import com.jdbc.model.OTP;

public class OTPOperation {
	public  static Boolean addOTP(OTP otp)
	{
		String query = "Insert into OTPTable(UserId,OTP,IsActive)"
				+ " values (?,?,?)";
		QueryExecutor.prepareStatement(query);
		if(QueryExecutor.getPreparedStatement()!=null)
		{
			try
			{
			QueryExecutor.getPreparedStatement().setInt(1, otp.getUserId());
			QueryExecutor.getPreparedStatement().setInt(2, otp.getOtp());
			QueryExecutor.getPreparedStatement().setInt(3, otp.getIsActive());
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
	
	public  static Boolean updateOTP(OTP otp)
	{
		String query = "update OTPTable set UserId=?,IsActive=? where OTPId=?";
		QueryExecutor.prepareStatement(query);
		if(QueryExecutor.getPreparedStatement()!=null)
		{
			try
			{
			QueryExecutor.getPreparedStatement().setInt(1, otp.getUserId());
			QueryExecutor.getPreparedStatement().setInt(2, otp.getIsActive());
			QueryExecutor.getPreparedStatement().setInt(3,otp.getOtpId());
			
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
	
	
	public static OTP getOTPById(int id)
	{
		String query = "select * from OTPTable where UserId="+id+" AND ISActive=1;";
		return getUserListByQuery(query).get(0);
	}
	
	public static boolean deleteOTPById(int id)
	{
		String query = "delete from OTPTable where UserId="+id+";";
		QueryExecutor.prepareStatement(query);
		int i=QueryExecutor.executeStatement();
		if(i>0)
		{
			System.out.println("Updated Successfully....");
			return true;
		}
		else
		{
			return false;
		}
	}
	
	private static List<OTP> getUserListByQuery(String query) {
		List<OTP> l = new ArrayList<>();
		ResultSet rs = QueryExecutor.executeStatementQuery(query);
		if(rs!=null) {
		try {
			while (rs.next()) {
				OTP o = getOTPData(rs);
				
				l.add(o);
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
	private static OTP getOTPData(ResultSet rs) throws SQLException {
		OTP o = new OTP();
		o.setOtpId(rs.getInt(1));
		o.setUserId(rs.getInt(2));
		o.setOtp(rs.getInt(3));
		o.setIsActive(rs.getInt(4));
		return o;
	}
}
