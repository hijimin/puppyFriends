package com.kh.dogfor.controller;

import java.io.IOException;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.Month;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.dogfor.model.service.DogforService;
import com.kh.dogfor.model.vo.Attendance;

/**
 * Servlet implementation class DogforMaincontroller
 */
@WebServlet("/dogforMain.do")
public class DogforMaincontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DogforMaincontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String userNo = request.getParameter("userNo");
		
		ArrayList<Attendance> list = new DogforService().selectAttendanceList(userNo);
				
		System.out.println(list);
		
		int month = 0; // 이번달 평일 수
		int yes = 0; // 출석일
		int no = 0; // 결석일
		
	    int year = LocalDate.now().getYear(); 
        int weekdaysInMarch = countWeekdaysInMarch(year);

        month = weekdaysInMarch;
        
        for(Attendance at : list) {
        	
        	if(at.getStatus().equals("Y")) {
        		yes++;
        	}else if(at.getStatus().equals("N")){
        		no++;
        	}
        	
        }
    
		request.setAttribute("month", month);
		request.setAttribute("yes", yes);
		request.setAttribute("no", no);
		
		request.getRequestDispatcher("/views/dogfor/dogforMain.jsp").forward(request, response);
	
	
	}
	
	 public static int countWeekdaysInMarch(int year) {
	        int count = 0;
	        LocalDate start = LocalDate.of(year, Month.MARCH, 1);
	        LocalDate end = LocalDate.of(year, Month.MARCH, Month.MARCH.length(false));

	        while (!start.isAfter(end)) {
	            if (start.getDayOfWeek() != DayOfWeek.SATURDAY && start.getDayOfWeek() != DayOfWeek.SUNDAY) {
	                count++;
	            }
	            start = start.plusDays(1);
	        }

	        return count;
	    }
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
