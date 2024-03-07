package com.kh.chat.controller;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.chat.model.dao.ChatDao;
import com.kh.chat.model.service.ChatService;
import com.kh.chat.model.vo.Chat;

/**
 * Servlet implementation class ChatSubmitController
 */
@WebServlet("/chat.do")
public class ChatSubmitController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChatSubmitController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		response.setContentType("text/html; charset=UTF-8");
		
		String fromId = request.getParameter("fromId");
		String toId = request.getParameter("toId");
		String content = request.getParameter("content");
		int result = 0;
		
		
		if(fromId == null || fromId.equals("") || toId == null || toId.equals("")
				|| content == null || content.equals("")) { // 입력x
			
		}else { // 입력 o
			result = new ChatService().submit(fromId, toId, content);
		}
		
		if(fromId == null || fromId.equals("") || toId == null || toId.equals("")
				|| content == null || content.equals("")) {
			response.getWriter().print(result);
		}else {
			response.getWriter().print(result);
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
