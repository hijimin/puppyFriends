package com.kh.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.admin.model.service.AdminService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class AdminDeleteMeberController
 */
@WebServlet("/adminDelete.me")
public class AdminDeleteMeberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDeleteMeberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
	    
	    String[] deleteMemberStrings = request.getParameterValues("deleteMember");
	    int[] adminDeleteMember = new int[deleteMemberStrings.length];

	    for (int i = 0; i < deleteMemberStrings.length; i++) {
	        adminDeleteMember[i] = Integer.parseInt(deleteMemberStrings[i]);
	    }

	    int[] result = new AdminService().adminDeleteMember(adminDeleteMember);
	    
	    
	    
	    if (result != null){	
	    	HttpSession session = request.getSession();
	    	response.sendRedirect(request.getContextPath() + "/adminSelectMember.me?cpage=1");	
	    } else {
	    	
	    }
		
		/*
		System.out.println("deleteMemberStrings 배열의 값:");
		for (String value : deleteMemberStrings) {
		    System.out.println(value);
		}

		int[] adminDelete = new int[deleteMemberStrings.length];
		for (int i = 0; i < deleteMemberStrings.length; i++) {
		    adminDelete[i] = Integer.parseInt(deleteMemberStrings[i]);
		}

		// adminDelete 배열의 값을 출력하여 값 확인
		System.out.println("adminDelete 배열의 값:");
		for (int value : adminDelete) {
		    System.out.println(value);
		}
		 */
		
		
		//if (deleteMemberStrings != null) {
		   // int[] adminDelete = new int[deleteMemberStrings.length];
		    //for (int i = 0; i < deleteMemberStrings.length; i++) {
		       // adminDelete[i] = Integer.parseInt(deleteMemberStrings[i]);      
		    //}
		//}
		
	
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
