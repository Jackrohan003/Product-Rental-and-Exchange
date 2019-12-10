package com.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdbc.CountryOperation;
import com.jdbc.StateOperation;
import com.user.Country;
import com.user.State;

/**
 * Servlet implementation class StateAddServlet
 */
@WebServlet("/StateAddServlet")
public class StateAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StateAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String state = request.getParameter("state");
		String country = request.getParameter("country");
		System.out.println(state);
		System.out.println(country);
		State s = new State();
		s.setCid(Integer.parseInt(country));
		s.setStatename(state);
			Boolean b=StateOperation.addState(s);
			if(b) {System.out.println("success");}
			else {System.out.println("not");}
				
				
			response.sendRedirect("ViewState.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
