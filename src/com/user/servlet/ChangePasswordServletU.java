package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jdbc.UserOperation;
import com.user.User;

/**
 * Servlet implementation class ChangePasswordServletU
 */
@WebServlet("/ChangePasswordServletU")
public class ChangePasswordServletU extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordServletU() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("uname");
		
		if(id != null)
		{
			User user1 = UserOperation.GetUserByUserEmail(id);
			String oldpass=user1.getPassword();
			if(oldpass.equals(request.getParameter("oldpassword")))
			{
				user1.setPassword(request.getParameter("newpassword"));
				if(UserOperation.updateUser(user1))
				{
					response.sendRedirect("Graby-shop/signup.jsp");
				}
				else
				{
					response.sendRedirect("changePassword.jsp?msg=Error while updating password");
				}
			}
			else
			{
				response.sendRedirect("changePassword.jsp?msg=Enter correct old password");
			}
		}
		else {
			response.sendRedirect("changePassword.jsp?msg=Error while updating password");
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
