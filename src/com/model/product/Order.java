package com.model.product;

import java.text.ParseException;
import java.text.SimpleDateFormat;

public class Order {
	private int orderId;
	private String orderNo;
	private int cartId;
	private int userId;
	private int isActive;
	private float totalAmount;
	private java.sql.Date doi;
	private int status;
	private static SimpleDateFormat sdf;
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public int getIsActive() {
		return isActive;
	}
	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}
	public float getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(float totalAmount) {
		this.totalAmount = totalAmount;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public java.sql.Date getDoi() {
		
		return doi;
	}
	public void setDoi(String doi) {
		java.sql.Date sqlDate = null;
		try 
		{
			sdf = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date parsedDate = sdf.parse(doi);
			sqlDate = new java.sql.Date(parsedDate.getTime());
			this.doi=sqlDate;
		}
		catch (ParseException e) {
			e.printStackTrace();
		}
		if(sqlDate == null)
		{
			this.doi=null;
		}
		
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
}
