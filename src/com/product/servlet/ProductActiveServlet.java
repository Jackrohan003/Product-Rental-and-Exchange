package com.product.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdbc.UserOperation;
import com.jdbc.model.Product;
import com.product.operation.ProductOperation;
import com.user.User;

/**
 * Servlet implementation class ProductActiveServlet
 */
@WebServlet("/ProductActiveServlet")
public class ProductActiveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductActiveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		int pid =Integer.parseInt(request.getParameter("pid"));
		
		Product p = ProductOperation.getAllByID(pid);
		if(p.getIsactive()==1)
		{
			p.setIsactive(0);
			ProductOperation.updateProduct(p);
			System.out.println("USERACTIVEinactive After UPDating vnset is 00");
			
			response.sendRedirect("ViewProduct.jsp");
		}
		else {
			p.setIsactive(1);
			System.out.println("ProductACTIVEinactive == set is 11");
			ProductOperation.updateProduct(p);
			System.out.println("PRODUCTinactive after setting == set is 11");
			response.sendRedirect("ViewProduct.jsp");
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
