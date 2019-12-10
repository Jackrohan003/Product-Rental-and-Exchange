package com.jdbc.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;

public class Product {
	
	private int  id;
	private String name;
	private String description;
	private int cid;
	private int price;
	private String image1;
	private String image2;
	private String image3;
	private String image4;
	private String email;
	private String phone;
	private int ptype;
	private int isactive;
	private int duration;
	private java.sql.Date doi;
	static SimpleDateFormat sdf;
	
	public void setDoi(String doi) {
		java.sql.Date sqlDate = null;
		try 
		{
			sdf = new SimpleDateFormat("yyyy-mm-dd");
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
	public java.sql.Date getDoi() {
		return doi;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImage1() {
		return image1;
	}
	public void setImage1(String image1) {
		this.image1 = image1;
	}
	public String getImage2() {
		return image2;
	}
	public void setImage2(String image2) {
		this.image2 = image2;
	}
	public String getImage3() {
		return image3;
	}
	public void setImage3(String image3) {
		this.image3 = image3;
	}
	public String getImage4() {
		return image4;
	}
	public void setImage4(String image4) {
		this.image4 = image4;
	}
	public int getIsactive() {
		return isactive;
	}
	public void setIsactive(int isactive) {
		this.isactive = isactive;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getPtype() {
		return ptype;
	}
	public void setPtype(int ptype) {
		this.ptype = ptype;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}

		
	
	
}
 