package com.kh.dogfor.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.dogfor.model.service.DogforService;

/**
 * Servlet implementation class GalleryDeleteController
 */
@WebServlet("/delete.ga")
public class GalleryDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GalleryDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pnum = request.getParameter("pnum");
		
		int result = new DogforService().deleteImg(pnum);
		
		HttpSession session = request.getSession();
		
		if(result > 0) { // 성공
			session.setAttribute("alertMsg", "삭제 성공");
			response.sendRedirect(request.getContextPath()+ "/gallery.ga?cpage=1");
		}else { // 실패
			session.setAttribute("alertMsg", "삭제 실패");
			response.sendRedirect(request.getContextPath()+ "/gallery.ga?cpage=1");
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
