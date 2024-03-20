package com.kh.chatting.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.chatting.model.service.ChattingService;
import com.kh.chatting.model.vo.Chatting;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class ChattingFormController
 */
@WebServlet("/chatForm.ch")
public class ChattingFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChattingFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String memberId = ((Member)session.getAttribute("loginUser")).getMemberId();
		String chattingCity = request.getParameter("chcity");
		
		
		Chatting chat = new ChattingService().ChattingForm(memberId);
		
		
		HttpSession session = request.getSession();
		
		//if(result > 0) {
		
		request.setAttribute("chat", chat);		
		request.getRequestDispatcher("views/chatting/boardChattingClient.jsp").forward(request, response);				
		
		//}	
			
	} // doGet

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
