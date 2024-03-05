package com.kh.reservation.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.reservation.model.service.ReservationService;
import com.kh.reservation.model.vo.Hotel;

/**
 * Servlet implementation class HotelReservationInsert
 */
@WebServlet("/insert.hrv")
public class HotelReservationInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HotelReservationInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		int page = 1; // 기본 페이지 번호
		String requestedPage = request.getParameter("page"); // 쿼리 문자열에서 페이지 번호 가져오기
		if (requestedPage != null) {
		    page = Integer.parseInt(requestedPage);
		}
		*/
		
		ArrayList<Hotel> list = new ReservationService().selectHotelList(); // 전달해 줄 거 없음

		request.setAttribute("list",list);
		request.getRequestDispatcher("views/reservation/hotelReservationForm.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
