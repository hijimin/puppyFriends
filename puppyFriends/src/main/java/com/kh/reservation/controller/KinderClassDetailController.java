package com.kh.reservation.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.Image;
import com.kh.reservation.model.service.ReservationService;
import com.kh.reservation.model.vo.KinderClass;

/**
 * Servlet implementation class KinderClassDetailController
 */
@WebServlet("/detail.crv")
public class KinderClassDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KinderClassDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int classNo = Integer.parseInt(request.getParameter("cno"));
		
		ReservationService cService = new ReservationService();
	
		int classrvCount;
		classrvCount = new ReservationService().selectClassRvCount(classNo);
		
		KinderClass c = cService.selectClassDetail(classNo);
		ArrayList<Image> img = cService.selectClassImgList(classNo);
		
		request.setAttribute("c", c);
		request.setAttribute("img", img);
		request.setAttribute("classrvCount", classrvCount);
		
		request.getRequestDispatcher("views/reservation/classDetailView.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
