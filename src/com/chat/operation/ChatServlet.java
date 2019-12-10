package com.chat.operation;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chat.model.Chat;
import com.jdbc.UserOperation;
import com.model.product.Category;
import com.product.operation.CategoryOperation;
import com.user.User;

/**
 * Servlet implementation class ChatServlet
 */
@WebServlet("/ChatServlet")
public class ChatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChatServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String msg = request.getParameter("chatmsg");
		
		  
		String   fromEmail = request.getParameter("fromEmail");     
		String   toEmail = request.getParameter("toEmail");
		  
			User gu = UserOperation.GetUserByUserEmail(fromEmail);
			String fromname= gu.getFname();
			
          User gnu =UserOperation.GetUserByUserEmail(toEmail);
			String toname= gnu.getFname();
          
          /*String fromEmail = request.getParameter("fromEmail");
          String toEmail = request.getParameter("toEmail");*/
				
		System.out.println("Chatmsg "+msg);
		
		Chat c = new Chat();
		c.setFromemail(fromEmail);	
		c.setToemail(toEmail);;
		c.setMsg(msg);
		c.setFromname(fromname);
		c.setToname(toname);
		ChatOperation.addChat(c);
		
		response.sendRedirect("Graby-shop/Chat.jsp?fromEmail="+request.getParameter("fromEmail")+"&toEmail="+request.getParameter("toEmail"));
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
