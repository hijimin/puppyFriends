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
 * Servlet implementation class AdminChangeOrderController
 */
@WebServlet("/AdminChangeOrder.or")
public class AdminChangeOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminChangeOrderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String[] changeOrderString = request.getParameterValues("changeOrder");
		int[] changeOrder = new int[changeOrderString.length];
		
		 for (int i = 0; i < changeOrderString.length; i++) {
			 changeOrder[i] = Integer.parseInt(changeOrderString[i]);
		    }
		
		 int[] result = new AdminService().changeOrder(changeOrder);
		 
		 if (result != null){	
		    	HttpSession session = request.getSession();
		    	response.sendRedirect(request.getContextPath() + "/AdminSelectOrder.od?cpage=1");	
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
