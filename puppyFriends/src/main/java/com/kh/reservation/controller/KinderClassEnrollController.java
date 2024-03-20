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
import com.kh.reservation.model.vo.KinderClass;
import com.kh.reservation.model.vo.Reservation;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class KinderClassEnrollController
 */
@WebServlet("/insert.crv")
public class KinderClassEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KinderClassEnrollController() {
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
		
			KinderClass c = new KinderClass();
			c.setClassWriter(Integer.parseInt(multiRequest.getParameter("memberNo")));
			c.setClassName(multiRequest.getParameter("className"));
			c.setClassText(multiRequest.getParameter("classText"));
			c.setClassSize(multiRequest.getParameter("classSize"));
			c.setdNumber(Integer.parseInt(multiRequest.getParameter("dNumber")));

			Reservation rv = new Reservation();
			
			try {
				rv.setReservationStart(new java.sql.Date(
						new SimpleDateFormat("yyyymmdd").parse(multiRequest.getParameter("reservationStart")).getTime()));
				rv.setReservationEnd(new java.sql.Date(
						new SimpleDateFormat("yyyymmdd").parse(multiRequest.getParameter("reservationEnd")).getTime()));
			
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			String reservationPriceStr = multiRequest.getParameter("reservationPrice").replaceAll(",", "");
			
			int reservationPrice = Integer.parseInt(reservationPriceStr);

			rv.setReservationPrice(reservationPrice);

			
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
			
			int result = new ReservationService().insertThumbnailClass(c, list, rv);

			if (c.getClassNo() == rv.getProgramNo()) {
				if (result > 0) {
					request.getSession().setAttribute("alertMsg", "성공적으로 작성되었습니다.");
					response.sendRedirect(request.getContextPath() + "/kinderClass.crv");
				}
			} else {
				request.setAttribute("errorMsg", "등록에 실패하였습니다.");
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
