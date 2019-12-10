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
 * Servlet implementation class UpdateProfileServlet
 */
@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String add1 = request.getParameter("address1");
		String add2 = request.getParameter("address2");
		int stateId = Integer.parseInt(request.getParameter("state"));
		int cityId = 0;
		if(request.getParameter("city") != null)
		{
			cityId = Integer.parseInt(request.getParameter("city"));
		}
		
		
		HttpSession session = request.getSession();
		String user = (String)session.getAttribute("uname");
		if(user!=null)
		{
			User u = UserOperation.GetUserByUserEmail(user);
			
				u.setAdd1(add1);
				u.setAdd2(add2);
				u.setSid(stateId);
				if(cityId!=0)
				{
					u.setCid(cityId);
				}
				if(UserOperation.updateUser(u))
				{
					response.sendRedirect("Graby-shop/userProfile.jsp?msg=Profile Successfully Updated");
				}
				else
				{
					response.sendRedirect("Graby-shop/userProfile.jsp?msg=Error while updating");
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
