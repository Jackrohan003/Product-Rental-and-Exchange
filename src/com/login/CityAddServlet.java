package com.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdbc.CityOperation;

import com.user.City;


/**
 * Servlet implementation class CityAddServlet
 */
@WebServlet("/CityAddServlet")
public class CityAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CityAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String city = request.getParameter("city");
		String state = request.getParameter("state");	
		String message ="";
		System.out.println(city);
		System.out.println(state);
		if(city==null || city.length()==0) 
		{
			message = "Please enter valid city name";
			response.sendRedirect("AddCity.jsp?msg="+message);
		}
		else
		{
		City c = new City();
		c.setStateid(Integer.parseInt(state));
		c.setCityname(city);
		
		City ct = CityOperation.getCityIdByCname(city);
		if(ct == null) {
			boolean status=CityOperation.addCity(c);
			if(status) {
				response.sendRedirect("ViewCity.jsp");
			}else {
				message = "Please Enter valid City Name !!!";
				response.sendRedirect("AddCity.jsp?msg="+message);
				
			}
		}else {
			message = "City Already Exist";
			response.sendRedirect("AddCity.jsp?msg="+message);
		}
			
		}
		
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
