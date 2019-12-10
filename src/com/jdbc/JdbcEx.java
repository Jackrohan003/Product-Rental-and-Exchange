package com.jdbc;

import java.util.List;

import com.user.State;
import com.user.User;


/*import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
*/
public class JdbcEx {
//	static List<Product> list;
	static List<User> list;
	static List<State> list1;
//	static ProductOperation s; 
	static UserOperation us;
	public static void main(String[] args) {
		//
	// s = new ProductOperation();
	 us = new UserOperation();
	    
	 
	 User u = UserOperation.GetUserByUserEmail("r@gmail.com");
	 u.setIsactive(0);
	 	UserOperation.updateUser(u);
	 
	 list = UserOperation.getUserByUserEmail("r@gmail.com");
	 printData(list); 
/*	 State  states = new State();
	 states.setCid(2);
	 states.setStatename("Pandit");
	StateOperation.addState(states);*/ 
//	 insert("Rohan", "xyz@gmail.com","rohan", 9824881266L,"166/1 Ghasiram ni pole", "Gujarat","rajkot", "Male");

	 
/*	list = UserOperation.getAll();
	printData(list);*/
	 //list = UserOperation.getAll(); 
		//printData(list);
		/*	list = s.getRange(10000,40000); 
		printData(list);
		list = s.getMaxDiscount(); 
		printData(list);
		list = s.getMinQty();
		printData(list);
		list = s.getRangeQty(5, 10);
		printData(list);
	}
	public static void printData(List<Product> list)
	{
		for (Product product : list) {
			System.out.println(
					"---"
					+ "------" + product.getId() + " -- " + product.getName() + " " + product.getPrice() + " "+ product.getDisc() + " "+ product.getQty() + " ");
		}
	}

	
	public static void insertData(String name,float price,float disc,int qty)
	{
		
		Product p = new Product();
		p.setName(name);
		p.setPrice(price);
		p.setDisc(disc);
		p.setQty(qty);
		s.add(p);
		
	}
*/
	}
/*	public static void insert(String name,String email,String pass,long phone,String address,String state,String city,String gen)
		{
			
			User u = new User();
			u.setName(name);
			u.setEmail(email);
			u.setPassword(pass);
			u.setPhone(phone);
			u.setAddress(address);
			u.setState(state);
			u.setCity(city);
			u.setGen(gen);
			
			UserOperation.adduser(u);
		}*/
	public static void printData(List<User> list)
	{
		for (User user : list) {
			System.out.println(
					"---"
					+ "------" + user.getId() + " -- " + user.getFname() + " " + user.getLname() + " "+ user.getEmail() 
					+ " "+ user.getPhone() + " "+ user.getPassword() + " "+ user.getAdd1() + " "+ " "+ user.getAdd2() + " "+ user.getState() + " "+ " "+ user.getSquestion() + " "+ " "
					+ user.getSqans() + " "+ user.getIsactive() + " ");
		}
	}
	public static void check(List<User> list)
	{
		for (User user : list) {
					user.getPassword(); 
		}
	}	
	
	}
	
	
	
	
	
	
	
	
	
