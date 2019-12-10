package com.user;

import java.util.Date;

public  class User {
	private int id;
	private String fname;
	private String lname;
	private String email;
	private Long phone;
	private String password;
	private String add1;
	private String add2;
	private int cid;
	private int sid;
	private int sqid;
	private String sqans;
	private String city;
	private String state;
	private String squestion;
	private int isactive;

	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public Long getPhone() {
		return phone;
	}
	public void setPhone(Long phone) {
		this.phone = phone;
	}
	public String getAdd1() {
		return add1;
	}
	public void setAdd1(String add1) {
		this.add1 = add1;
	}
	public String getAdd2() {
		return add2;
	}
	public void setAdd2(String add2) {
		this.add2 = add2;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getSqid() {
		return sqid;
	}
	public void setSqid(int sqid) {
		this.sqid = sqid;
	}
	public String getSqans() {
		return sqans;
	}
	public void setSqans(String sqans) {
		this.sqans = sqans;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getSquestion() {
		return squestion;
	}
	public void setSquestion(String squestion) {
		this.squestion = squestion;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public int getIsactive() {
		return isactive;
	}
	public void setIsactive(int isactive) {
		this.isactive = isactive;
	}

	
	
	
}
