package com.kh.dogfor.controller;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.dogfor.model.service.DogforService;
import com.kh.dogfor.model.vo.Attendance;

/**
 * Servlet implementation class AttendanceInsertFormController
 */
@WebServlet("/insert.at")
public class AttendanceInsertFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AttendanceInsertFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userNo = request.getParameter("userNo");
		String date = request.getParameter("date");
		String status = request.getParameter("status");
		
		Attendance at = new Attendance();
		at.setMemberNo(userNo);
		at.setDate(date);
		at.setStatus(status);
		
		Calendar cal = Calendar.getInstance();
		
		// 시스템 오늘날짜
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		
		
		
		
		int result = new DogforService().insertAttendance(at);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/attendance.at?userNo="+userNo+"&year="+year+"&month="+month);
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
