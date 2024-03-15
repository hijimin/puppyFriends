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
		String date = request.getParameter("date"); // 2024-03-13
		String status = request.getParameter("status");
		
		
		Attendance at = new Attendance();
		at.setMemberNo(userNo);
		at.setDate(date);
		at.setStatus(status);
		
		// 시스템 오늘날짜
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		
		
		// 출석 등록여부 확인
		int check = new DogforService().checkAttendance(userNo, date);
		
		if(check == 1) { // 해당 날짜 존재 update
			int update = new DogforService().updateAttendance(at);
			
			if(update > 0) {
				response.getWriter().print("update good");
			}else {
				response.getWriter().print("update bad");
			}
			
		}else { // 해당 날짜 없음 insert
			int insert = new DogforService().insertAttendance(at);
			
			if(insert > 0) {
				response.getWriter().print("insert good");
			}else {
				response.getWriter().print("insert bad");
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
