package com.kh.reservation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.reservation.model.vo.Hotel;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class HotelEnrollController
 */
@WebServlet("/insert.hrv")
public class HotelEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HotelEnrollController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
		
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/thumbnail_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
	
			Hotel h = new Hotel();
			h.setMemberNo(multiRequest.getParameter("memberNo"));
			h.setHotelNo(multiRequest.getParameter("hotelNo"));
			h.setHotelName(multiRequest.getParameter("hotelName"));
			h.setHotelText(multiRequest.getParameter("hotelTest"));
			h.setHotelSize(multiRequest.getParameter("hotelSize"));
			h.setdNumber(multiRequest.getParameter("dNumber"));
			h.setReservationDate(multiRequest.getParameter("reservationDate"));
			h.setReservationPrice(multiRequest.getParameter("ReservationPrice"));
		
			// hotel vo 추가, mapper - insert 기재 필요 / 섬넬 인설트 컨트롤러 참고해서 적자
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
