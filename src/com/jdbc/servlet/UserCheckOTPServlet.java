package com.jdbc.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jdbc.OTPOperation;
import com.jdbc.UserOperation;
import com.jdbc.model.OTP;
import com.user.User;


/**
 * Servlet implementation class UserCheckOTPServlet
 */
@WebServlet("/UserCheckOTPServlet")
public class UserCheckOTPServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserCheckOTPServlet() {
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
		if(id!=null)
		{
		User resp = UserOperation.getById(Integer.parseInt(id));
		OTP p = OTPOperation.getOTPById(resp.getId());
	
		int entered = Integer.parseInt(request.getParameter("otp"));
		if(p.getOtp()==entered)
		{
			p.setIsActive(0);
			OTPOperation.updateOTP(p);
			response.sendRedirect("Graby-shop/confirmForgetPassword.jsp");
		}
		else
		{
			response.sendRedirect("Graby-shop/userCheckOTP.jsp?msg='Incorrect OTP'");
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
