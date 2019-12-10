package com.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.jdbc.AdminOperation;
import com.user.Admin;

/**
 * Servlet implementation class ChangePasswordServlet
 */
@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String old_password = request.getParameter("old_password");
		String new_password = request.getParameter("new_password");
		String con_password = request.getParameter("con_password");
		
		HttpSession session = request.getSession();
		 Admin a = AdminOperation.getAdminByUserName((String)session.getAttribute("uname"));
		 if(a.getPassword().equals(old_password)) {
			 
			 if(new_password.equals(con_password))
					 {
				 		a.setPassword(con_password);
				 		AdminOperation.updateAdmin(a);
				 		String resp = "Password Successfully Changed";
				 	response.sendRedirect("adminlogin.jsp?msg="+resp);
			 }else
			 {
				 String resp = "Password Does not match";
				 response.sendRedirect("ChangePassword.jsp?msg="+resp);
			 }
		 }
		 else
		 {
			 String resp = "Wrong Password";
			 response.sendRedirect("ChangePassword.jsp?msg="+resp);

			 
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
