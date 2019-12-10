package com.product.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.jdbc.UserOperation;

import com.jdbc.model.Product;
import com.model.product.Cart;
import com.model.product.Order;
import com.product.operation.CartOperation;
import com.product.operation.OrderOperation;
import com.product.operation.ProductOperation;
import com.user.User;


/**
 * Servlet implementation class AddOrderDetailsServlet
 */
@WebServlet("/AddOrderDetailsServlet")
public class AddOrderDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddOrderDetailsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String s1 = (String)session.getAttribute("uname");
		if(s1 != null)
		{
			Random random = new Random();
			String orderNo = Integer.toString(100000+random.nextInt(900000));
			Date d1 = new Date();
			String od=new String((new SimpleDateFormat("yyyy-MM-dd").format(d1)));
			User user = UserOperation.GetUserByUserEmail(s1);
			List<Cart> lst = CartOperation.getAllById(user.getId());
			orderNo=od+orderNo;
			System.out.println("Order No: -"+orderNo);
			float total=0.0f;
			for(Cart c: lst)
			{
				Product p = ProductOperation.getAllByID(c.getProductId());
				
					total+=p.getPrice()*c.getQuantity();
				
			}
			//total+=total*18/100;
			total+=250;
			for(Cart c : lst)
			{
				Order o = new Order();
				o.setCartId(c.getCartId());
				o.setUserId(user.getId());
				o.setOrderNo(orderNo);
				Date d = new Date();
				o.setDoi(new SimpleDateFormat("yyyy-MM-dd").format(d));
				o.setTotalAmount(Math.round(total));
				o.setStatus(1);
				OrderOperation.addOrder(o);
				c.setIsActive(0);
				CartOperation.updateCart(c);
			}
			response.sendRedirect("Graby-shop/orderDetails.jsp");
		}
		else
		{
			response.sendRedirect("Graby-shop/CheckOut.jsp");
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
