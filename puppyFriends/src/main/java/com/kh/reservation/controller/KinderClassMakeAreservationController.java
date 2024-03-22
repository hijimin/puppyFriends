package com.kh.reservation.controller;

import java.io.Console;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.kh.member.model.vo.Member;
import com.kh.reservation.model.service.ReservationService;
import com.kh.reservation.model.vo.KinderClass;
import com.kh.reservation.model.vo.Reservation;

/**
 * Servlet implementation class KinderClassMakeAreservationController
 */
@WebServlet("/make.crv")
public class KinderClassMakeAreservationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public KinderClassMakeAreservationController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		int userNo = ((Member) request.getSession().getAttribute("loginUser")).getMemberNo();
		int classNo = Integer.parseInt(request.getParameter("cno"));

		KinderClass c = new KinderClass();
		Reservation rv = new Reservation();
		rv.setMemberNo(userNo);
		rv.setProgramNo(classNo);
		java.sql.Date start = java.sql.Date.valueOf(request.getParameter("reservationStart"));
		rv.setReservationStart(start);
		java.sql.Date end = java.sql.Date.valueOf(request.getParameter("reservationEnd"));
		rv.setReservationEnd(end);
		String reservationPrice = request.getParameter("reservationPrice").replaceAll(",", "");
		rv.setReservationPrice(Integer.parseInt(reservationPrice));
		
//		if (c.getClassNo() == rv.getProgramNo()) {

//		rv.setReservationNo(Integer.parseInt(request.getParameter("reservationNo")));
//			rv.setFacilityNo(Integer.getInteger(request.getParameter("facilityNo")));
//			try {
//				rv.setReservationStart(new java.sql.Date(
//						new SimpleDateFormat("yyyy-MM-dd").parse(multiRequest.getParameter("reservationStart")).getTime()));
//				rv.setReservationEnd(new java.sql.Date(
//						new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("reservationEnd")).getTime()));
//			} catch (ParseException e) {
//				e.printStackTrace();
//			}
//
//			rv.setReservationPrice(Integer.parseInt(request.getParameter("reservationPrice")));
//
//			try {
//				rv.setReservationStart(new java.sql.Date(
//						new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("reservationStart")).getTime()));
//				rv.setReservationEnd(new java.sql.Date(
//						new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("reservationEnd")).getTime()));
//			
//			} catch (ParseException e) {
//				e.printStackTrace();
//			}
//			
//			System.out.println(rv.getReservationStart());
//			System.out.println(rv.getReservationEnd());
//			System.out.println(rv.getReservationPrice());
//			
//			System.out.println(c.getReservationStart());
//			System.out.println(c.getReservationEnd());
//			System.out.println(c.getReservationPrice());
			

			int result = new ReservationService().makeAclassReservation(userNo, classNo, rv);

			if (result > 0) {

				HttpSession session = request.getSession();
				session.setAttribute("alertMsg", "유치원이 예약되었습니다.");
				response.sendRedirect(request.getContextPath() + "/detail.crv?cno=" + classNo);
//			}
		} else {
			request.setAttribute("errorMsg", "유치원 예약이 실패하였습니다.");

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
