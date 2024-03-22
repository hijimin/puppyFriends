package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		
		
		Member loginUser = new MemberService().loginMember(userId, userPwd);
		
		
		HttpSession session = request.getSession();
		
		
		if(loginUser == null) {
	         session.setAttribute("alertMsg", "아이디 또는 비밀번호가 다릅니다");
	         RequestDispatcher view = request.getRequestDispatcher("views/common/login2.jsp");
	         view.forward(request, response);
	      } else {
	    	  session.setAttribute("loginUser", loginUser);
	    	  response.sendRedirect(request.getContextPath());      	         
	         } 
	         
	         
	     }
		
		
		// if(loginUser == null) {
			// session.setAttribute("alertMsg", "아이디 및 비밀번호가 일치하지 않습니다.");
			// response.sendRedirect(request.getContextPath() + "/views/common/login.jsp");
			// }
		
		
		// 기존존재
		// session.setAttribute("loginUser", loginUser);
		// response.sendRedirect(request.getContextPath());
		
		
	
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
