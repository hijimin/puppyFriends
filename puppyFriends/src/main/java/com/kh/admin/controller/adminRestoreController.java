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
 * Servlet implementation class adminRestoreController
 */
@WebServlet("/adminRestore.me")
public class adminRestoreController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminRestoreController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String[] restoreMemberStings = request.getParameterValues("RestoreMember");
		int[] adminRestoreMember = new int[restoreMemberStings.length];
		
		for(int i=0; i<restoreMemberStings.length; i++) {
			adminRestoreMember[i] = Integer.parseInt( restoreMemberStings[i]);
		}
		
		int[] result = new AdminService().adminStartRestoreMember(adminRestoreMember);
		
		if(result != null) {
			HttpSession session = request.getSession();
	    	response.sendRedirect(request.getContextPath() + "/adminRestoreMemberList.me?cpage=1");	
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
