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

/**
 * Servlet implementation class HotelUpdateFormController
 */
@WebServlet("/updateForm.hrv")
public class HotelUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HotelUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int hotelNo = Integer.parseInt(request.getParameter("hno"));

		System.out.println(hotelNo);

		ReservationService hService = new ReservationService();
		

		Hotel h = hService.selectHotelDetail(hotelNo);
		ArrayList<Image> img = hService.selectHotelImgList(hotelNo);
			
			request.setAttribute("h", h);
			request.setAttribute("img", img);

			request.getRequestDispatcher("views/reservation/hotelUpdateForm.jsp").forward(request, response);


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
