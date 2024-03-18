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
import com.kh.member.model.vo.Member;
import com.kh.reservation.model.service.ReservationService;
import com.kh.reservation.model.vo.Hotel;
import com.kh.reservation.model.vo.Reservation;
import com.oreilly.servlet.MultipartRequest;

import oracle.net.aso.h;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		if (ServletFileUpload.isMultipartContent(request)) {

			int maxSize = 10 * 1024 * 1024;

			String savePath = request.getSession().getServletContext().getRealPath("/resources/thumbnail_upfiles/");

			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());

			Hotel h = new Hotel();
			h.setHotelWriter(Integer.parseInt(multiRequest.getParameter("memberNo")));
			h.setHotelName(multiRequest.getParameter("hotelName"));
			h.setHotelText(multiRequest.getParameter("hotelText"));
			h.setHotelSize(multiRequest.getParameter("hotelSize"));
			h.setdNumber(Integer.parseInt(multiRequest.getParameter("dNumber")));

			try {
				h.setHotelStart(new java.sql.Date(
						new SimpleDateFormat("yyyy-mm-dd").parse(multiRequest.getParameter("hotelStart")).getTime()));
				h.setHotelEnd(new java.sql.Date(
						new SimpleDateFormat("yyyymmdd").parse(multiRequest.getParameter("hotelEnd")).getTime()));

			} catch (ParseException e) {
				e.printStackTrace();
			}

			Reservation rv = new Reservation();

			// 사용자로부터 받아온 금액 문자열에서 ','를 제거
			String reservationPriceStr = multiRequest.getParameter("reservationPrice").replaceAll(",", "");

			// 제거한 문자열을 정수로 변환
			int reservationPrice = Integer.parseInt(reservationPriceStr);

			// 변환된 정수를 객체에 설정
			rv.setReservationPrice(reservationPrice);

//			rv.setReservationPrice(Integer.parseInt(multiRequest.getParameter("reservationPrice")));

			ArrayList<Image> list = new ArrayList<Image>();

			for (int i = 1; i <= 3; i++) {
				String key = "file" + i;

				if (multiRequest.getOriginalFileName(key) != null) {
					Image img = new Image();
					img.setFileName(multiRequest.getOriginalFileName(key));
					img.setChangeName(multiRequest.getFilesystemName(key));
					img.setFilePath("resources/thumbnail_upfiles/");

					if (i == 1) { // 대표 이미지일 경우
						img.setFileLevel(1);
					} else {
						img.setFileLevel(2);
					}
					list.add(img);
				}
			}
			
			int result = new ReservationService().insertThumbnailHotel(h, list, rv);

			if (h.getHotelNo() == rv.getProgramNo()) {
				if (result > 0) {
					request.getSession().setAttribute("alertMsg", "성공적으로 작성되었습니다.");
					response.sendRedirect(request.getContextPath() + "/hotel.hrv");
				}
			} else {
				request.setAttribute("errorMsg", "등록에 실패하였습니다.");
			}

		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
