package com.kh.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.admin.model.service.AdminService;

/**
 * Servlet implementation class AdminProductDeleteController
 */
@WebServlet("/AdminProductDelete.pr")
public class AdminProductDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProductDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String[] deleteProductStrings = request.getParameterValues("deleteProduct");
		int[] adminDeleteProduct = new int[deleteProductStrings.length];
		
		for (int i = 0; i < deleteProductStrings.length; i++) {
			adminDeleteProduct[i] = Integer.parseInt(deleteProductStrings[i]);
	    }
		
		int[] result = new AdminService().adminDeleteProduct(adminDeleteProduct);
		
		 if (result != null){	
		    	HttpSession session = request.getSession();
		    	response.sendRedirect(request.getContextPath() + "/AdminSelectProductList.pr?cpage=1");	
		    } 
		
	} // doGet 

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
