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
import com.kh.reservation.model.vo.Hotel;
import com.kh.reservation.model.vo.Reservation;

/**
 * Servlet implementation class HotelDetailController
 */
@WebServlet("/detail.hrv")
public class HotelDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HotelDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int hotelNo = Integer.parseInt(request.getParameter("hno"));
			
	//	int reservationNo = Integer.parseInt(request.getParameter("rno"));
		
		ReservationService hService = new ReservationService();
		
		// ArrayList<Image> list = hService.sel
		Hotel h = hService.selectHotelDetail(hotelNo);
		
		int hotelrvCount;
		hotelrvCount = new ReservationService().selectRvCount(hotelNo);
				
		
		request.setAttribute("h", h);
		request.setAttribute("hotelrvCount", hotelrvCount);
		
		request.getRequestDispatcher("views/reservation/hotelDetailView.jsp").forward(request, response);
		
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
