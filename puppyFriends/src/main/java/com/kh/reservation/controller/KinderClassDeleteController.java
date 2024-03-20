package com.kh.reservation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.reservation.model.service.ReservationService;

/**
 * Servlet implementation class KinderClassDeleteController
 */
@WebServlet("/delete.crv")
public class KinderClassDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KinderClassDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int classNo = Integer.parseInt(request.getParameter("num"));
		int result = new ReservationService().deleteClass(classNo);
		
		if(result > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "유치원 삭제가 완료되었습니다.");
			response.sendRedirect(request.getContextPath() + "/kinderClass.crv");
			
		}else {
			request.setAttribute("errorMsg", "삭제를 실패하였습니다.");
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
