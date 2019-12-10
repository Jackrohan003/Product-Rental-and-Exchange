package com.jdbc.servlet;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jdbc.OTPOperation;
import com.jdbc.UserOperation;
import com.jdbc.mail.Mail;
import com.jdbc.model.OTP;
import com.user.User;


/**
 * Servlet implementation class UserSendEmailServlet
 */
@WebServlet("/UserSendEmailServlet")
public class UserSendEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserSendEmailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		User resp=null;
		String userName=null;
		userName=request.getParameter("email");
		if(userName!=null) {
			try {
			resp = UserOperation.GetUserByUserEmail(userName);
			if(resp!=null) {
			Random random = new Random();
			OTP p = new OTP();
			p.setOtp((int)(100000+random.nextInt(900000)));
			p.setIsActive(1);
			p.setUserId(resp.getId());
			Mail.randomnumber(resp.getEmail(), p.getOtp());
			OTPOperation.deleteOTPById(resp.getId());
			OTPOperation.addOTP(p);
			HttpSession session = request.getSession();
			session.setAttribute("id",Integer.toString(resp.getId()));
			response.sendRedirect("Graby-shop/userCheckOTP.jsp");
			}
			}
			catch(Exception e)
			{
				response.sendRedirect("Graby-shop/forgotPassword.jsp?msg=User Not Found");
			}
		}
		else {
				response.sendRedirect("Graby-shop/forgotPassword.jsp?msg=User Not Found");
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
