package com.jdbc.servlet;

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
 * Servlet implementation class ForgotPasswordServlet
 */
@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		if(id != null)
		{
			User user1 = UserOperation.getById(Integer.parseInt(id));
			user1.setPassword(request.getParameter("newpassword"));
			if(UserOperation.updateUser(user1))
			{
				response.sendRedirect("Graby-shop/signup.jsp");
			}
			else
			{
				response.sendRedirect("Graby-shop/confirmForgetPassword.jsp?msg=Error while updating password");
			}
		}
		else {
			response.sendRedirect("Graby-shop/confirmForgetPassword.jsp?msg=Error while updating password");
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
