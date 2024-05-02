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
 * Servlet implementation class AdminDeleteReservationController
 */
@WebServlet("/AdminDeleteReservation.re")
public class AdminDeleteReservationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDeleteReservationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    
	    String[] deleteReservationStrings = request.getParameterValues("deleteReservation");
	    int[] adminReservation = new int[deleteReservationStrings.length];

	    for (int i = 0; i < deleteReservationStrings.length; i++) {
	    	adminReservation[i] = Integer.parseInt(deleteReservationStrings[i]);
	    }

	    int[] result = new AdminService().adminDeleteRe(adminReservation);
	    
	    
	    
	    if (result != null){	
	    	HttpSession session = request.getSession();
	    	response.sendRedirect(request.getContextPath() + "/AdminSelectClass.rc?cpage=1");	
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
