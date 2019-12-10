package com.product.servlet;

import java.io.File;
import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.model.product.Category;
import com.product.operation.CategoryOperation;

/**
 * Servlet implementation class AddCategoryServlet
 */
@WebServlet("/AddCategoryServlet")
public class AddCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String ctg = request.getParameter("ctg");
		int categoryType = Integer.parseInt(request.getParameter("ctype"));
		
		
		System.out.println("Category type"+categoryType );
		
		
/*		int i=1;
		
		Part p = request.getPart("file");
		String path = request.getServletContext().getRealPath("/");
		String filename = getFileName(p);
		File f = new File(path+"category//"+filename);
		System.out.println("PATH OF :: "+path+"category\\"+filename);
		if(f.exists()) {
			System.out.println("File already exist");
			String[] split = filename.split("\\.");
			filename = split[0]+"_"+i+"."+split[1];
			i++;
			
		}else {
			System.out.println("File not exist");
		}
		p.write(path+"category//"+filename);*/
		Category c = new Category();
		c.setCategoryname(ctg);	
		c.setCategoryType(categoryType);
		
		
		// if exist then write the code;
		
		CategoryOperation.addCategory(c);
		
		
		
		
		response.sendRedirect("ViewCategory.jsp");
		
	}

/*	private String getFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");

            	for (String s : items) {
                    if (s.trim().startsWith("filename")) {
            		return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
	}*/

	
	
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
