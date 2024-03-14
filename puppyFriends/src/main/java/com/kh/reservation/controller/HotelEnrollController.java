package com.kh.reservation.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.common.model.vo.Image;
import com.kh.reservation.model.service.ReservationService;
import com.kh.reservation.model.vo.Hotel;
import com.kh.reservation.model.vo.Reservation;
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
			System.out.println(multiRequest.getParameter("hotelNo"));
			System.out.println(multiRequest.getParameter("hotelWriter"));
			System.out.println(multiRequest.getParameter("hotelName"));
			System.out.println(multiRequest.getParameter("hotelText"));
			System.out.println(multiRequest.getParameter("hotelSize"));
			System.out.println(multiRequest.getParameter("dNumber"));
	
			Hotel h = new Hotel();
				h.setHotelNo(Integer.parseInt(multiRequest.getParameter("hotelNo")));
				h.setHotelWriter(Integer.parseInt(multiRequest.getParameter("hotelWriter")));
				h.setHotelName(multiRequest.getParameter("hotelName"));
				h.setHotelText(multiRequest.getParameter("hotelText"));
				h.setHotelSize(multiRequest.getParameter("hotelSize"));
				h.setdNumber(Integer.parseInt(multiRequest.getParameter("dNumber")));
			
				try {
					h.setHotelStart(new java.sql.Date(new SimpleDateFormat("yyyy.mm.dd").parse(multiRequest.getParameter("hotelStart")).getTime()));
					h.setHotelEnd(new java.sql.Date(new SimpleDateFormat("yyyy.mm.dd").parse(multiRequest.getParameter("hotelEnd")).getTime()));
			
				} catch (ParseException e) {
					e.printStackTrace();
				}
				
			Reservation rv = new Reservation();
			try {
				rv.setReservationStart(new java.sql.Date(new SimpleDateFormat("yyyy.mm.dd").parse(multiRequest.getParameter("reservationStart")).getTime()));
				rv.setReservationEnd(new java.sql.Date(new SimpleDateFormat("yyyy.mm.dd").parse(multiRequest.getParameter("reservationEnd")).getTime()));
		
			} catch (ParseException e) {
				e.printStackTrace();
			}
				rv.setReservationPrice(Integer.parseInt(multiRequest.getParameter("reservationPrice")));
		
				
			ArrayList<Image> list = new ArrayList<Image>();
			
			for(int i=1; i<=3; i++) {
				String key = "file" + i;
				
				if(multiRequest.getOriginalFileName(key) != null) {
					Image img = new Image();
					img.setFileName(multiRequest.getOriginalFileName(key));
					img.setChangeName(multiRequest.getFilesystemName(key));
					img.setFilePath("resources/thumbnail_upfiles/");
					
					if(i == 1) { // 대표 이미지일 경우
						img.setFileLevel(1);
					}else {
						img.setFileLevel(2);
					}
					list.add(img);
				}
				int result = new ReservationService().insertThumbnailHotel(h, list, rv);
				
				if(result > 0) {
					request.getSession().setAttribute("alertMsg", "성공적으로 작성되었습니다.");
					response.sendRedirect(request.getContextPath() + "/detail.hrv");
				System.out.println("뀨");
				}
			}
			
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
