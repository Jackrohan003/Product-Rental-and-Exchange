package com.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdbc.UserOperation;
import com.user.User;

/**
 * Servlet implementation class UserActiveInactive
 */
@WebServlet("/UserActiveInactive")
public class UserActiveInactive extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserActiveInactive() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
		String email = request.getParameter("email");
				
		User user = UserOperation.GetUserByUserEmail(email);
		if(user.getIsactive()==1)
		{
			user.setIsactive(0);
			System.out.println("USERACTIVEinactive == set is 00");
			UserOperation.updateUser(user);
			System.out.println("USERACTIVEinactive After UPDating vnset is 00");
			
			response.sendRedirect("ViewUser.jsp");
		}
		else {
			user.setIsactive(1);
			System.out.println("USERACTIVEinactive == set is 11");
			UserOperation.updateUser(user);
			System.out.println("USERACTIVEinactive after setting == set is 11");
			response.sendRedirect("ViewUser.jsp");
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
