package com.product.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.jdbc.UserOperation;
import com.model.product.Cart;
import com.product.operation.CartOperation;
import com.user.User;


/**
 * Servlet implementation class UpdateCartServlet
 */
@WebServlet("/UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User u = UserOperation.GetUserByUserEmail((String)session.getAttribute("uname"));
		int pid = Integer.parseInt(request.getParameter("id"));
		Cart c = CartOperation.getByUserIdAndProductId(u.getId(), pid);
		c.setQuantity(Integer.parseInt(request.getParameter("quantity")));
		PrintWriter out = response.getWriter();
		if(CartOperation.updateCart(c))
		{
			out.print("success");
		}
		else
		{
			out.print("unsuccess");
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
