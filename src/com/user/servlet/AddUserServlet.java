package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdbc.UserOperation;
import com.user.User;

/**
 * Servlet implementation class AddUserServlet
 */
@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String fname = request.getParameter("first_name");
		String lname = request.getParameter("last_name");
		String email = request.getParameter("email");
		Long phone =  Long.parseLong(request.getParameter("phone"));
		String Password = request.getParameter("Password");
		String rePassword = request.getParameter("rePassword");
		String add1 = request.getParameter("add1");
		String add2 = request.getParameter("add2");
		String gender = request.getParameter("gender");
		int state =Integer.parseInt(request.getParameter("state"));
		int city = Integer.parseInt(request.getParameter("city"));
		int Securityquestion = Integer.parseInt(request.getParameter("Securityquestion"));
		String securityanswer = request.getParameter("securityanswer");
		
		System.out.println("SID "+state);
		System.out.println("CID "+city);
		if(Password.equals(rePassword))
		{
			
		User u = new User();
		u.setFname(fname);
		u.setLname(lname);
		u.setEmail(email);
		u.setPhone(phone);
		u.setPassword(Password);
		u.setAdd1(add1);
		u.setAdd2(add2);
		u.setCid(city);
		u.setSid(state);
		u.setSqid(Securityquestion);
		u.setSqans(securityanswer);

		/*u.setCity(UserOperation.getcityByID(city));
		u.setState(UserOperation.getstateByID(state));
		u.setSquestion(UserOperation.getSeqByID(sque));*/
		/*u.setDoi(rs.getTimestamp(14));*/
			UserOperation.addUser(u);
			response.sendRedirect("Graby-shop/index.jsp");
		}
		else
		{
			String resp="Incorrect Password ";
			response.sendRedirect("Graby-shop/registerfinal.jsp?msg="+resp);
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
