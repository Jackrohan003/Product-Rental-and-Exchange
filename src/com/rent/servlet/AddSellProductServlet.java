package com.rent.servlet;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.jdbc.UserOperation;
import com.jdbc.model.Product;
import com.product.operation.ProductOperation;
import com.user.User;

/**
 * Servlet implementation class AddSellProductServlet
 */
@WebServlet("/AddSellProductServlet")
@MultipartConfig
public class AddSellProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSellProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String productName=request.getParameter("productName");
		String productDesc=request.getParameter("productDesc");
		/*String email=request.getParameter("email");*/
		/*String phone=request.getParameter("phone");*/
		
		HttpSession session = request.getSession();
		String email =(String)session.getAttribute("uname");
		
		User u = UserOperation.GetUserByUserEmail(email);
		
		/*List<User>   =UserOperation.getUserByUserEmail(email);*/
		String  phone = Long.toString(u.getPhone()); 
		
		//int duration= Integer.parseInt( request.getParameter("duration"));
		int categoryId=Integer.parseInt(request.getParameter("category"));
		int price = Integer.parseInt(request.getParameter("price"));
		int type = 2;
		
		System.out.println("PName :"+productName);
		System.out.println(productDesc);
		System.out.println(categoryId);
		System.out.println(price);
	
		Product p = new Product();
		p.setName(productName);
		p.setDescription(productDesc);
		p.setCid(categoryId);
		p.setPrice(price);
		p.setPtype(type);
		p.setEmail(email);
		p.setPhone(phone);
	//	p.setDuration(duration);
		Random r = new Random();
		String path = request.getServletContext().getRealPath("/");
		Part p1 =  request.getPart("image1");
		String filename = path + "upload\\productImages\\";
		String[] ch = getFileName(p1).split("\\.");
		int randomNo = Math.round((100000 + r.nextFloat() * 900000));
		filename = filename + p.getName() + randomNo + "." +ch[1];
		p1.write(filename);
		System.out.println(filename);
		p.setImage1("..\\\\upload\\\\productImages\\\\" + p.getName() + randomNo+"." +ch[1]);	
		
		Part p2 =  request.getPart("image2");
		filename = path + "upload\\productImages\\";
		ch = getFileName(p2).split("\\.");
		randomNo = Math.round((100000 + r.nextFloat() * 900000));
		filename = filename + p.getName() + randomNo + "." +ch[1];
		p2.write(filename);
		System.out.println(filename);
		p.setImage2("..\\\\upload\\\\productImages\\\\" + p.getName() + randomNo +"." + ch[1]);	
		
		Part p3 =  request.getPart("image3");
		if(!(getFileName(p3).equals("")))
		{
			filename = path + "upload\\productImages\\";
			ch = getFileName(p3).split("\\.");
			randomNo = Math.round((100000 + r.nextFloat() * 900000));
			filename = filename + p.getName() + randomNo + "." +ch[1];
			p3.write(filename);
			System.out.println(filename);
			p.setImage3("..\\\\upload\\\\productImages\\\\" + p.getName() + randomNo +"." + ch[1]);
		}
		else
			p.setImage3(null);
		
		Part p4 =  request.getPart("image4");
		if(!(getFileName(p4).equals("")))
		{
			filename = path + "upload\\productImages\\";
			ch = getFileName(p4).split("\\.");
			randomNo = Math.round((100000 + r.nextFloat() * 900000));
			filename = filename + p.getName() + randomNo + "." +ch[1];
			p4.write(filename);
			System.out.println(filename);
			p.setImage4("..\\\\upload\\\\productImages\\\\" + p.getName() + randomNo + "." +ch[1]);	
		}		
		else
			p.setImage4(null);
		
		boolean b = ProductOperation.addProduct(p);
		if(b) {
				response.sendRedirect("Graby-shop/sell.jsp");
		}
		else
		{
			response.sendRedirect("addProductSell.jsp");
		}
		
	}
	private String getFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
