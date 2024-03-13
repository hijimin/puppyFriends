package com.kh.dogfor.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.dogfor.model.service.DogforService;
import com.kh.dogfor.model.vo.Attendance;

/**
 * Servlet implementation class AttendanceAdminFormController
 */
@WebServlet("/select.at")
public class AttendanceAdminFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AttendanceAdminFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userNo = request.getParameter("userNo");
		int year = Integer.parseInt(request.getParameter("year"));
		int month = Integer.parseInt(request.getParameter("month"));
		
		ArrayList<Attendance> list = new DogforService().selectAttendanceList(userNo);
		ArrayList<Attendance> newList = new ArrayList<Attendance>();
		
		for(Attendance at : list) {
			System.out.println(at.getDate().substring(0, 4));
			System.out.println(at.getDate().substring(5, 7));
			if(Integer.parseInt(at.getDate().substring(0, 4)) == year && Integer.parseInt(at.getDate().substring(5, 7)) == month) {
				newList.add(at);
			}
		}
		
		System.out.println(newList);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(newList, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
