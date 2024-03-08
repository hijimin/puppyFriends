package com.kh.dogfor.controller;

import java.io.IOException;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.Month;
import java.time.YearMonth;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		ArrayList<Attendance> list = null;
		if(userNo != null) {
		list = new DogforService().selectAttendanceList(userNo);
		}
		
		int yes = 0; // 출석일
		int no = 0; // 결석일
		
		YearMonth currentYearMonth = YearMonth.now();
		int currentYear = currentYearMonth.getYear(); // 현재 연도
        int currentMonth = currentYearMonth.getMonthValue(); // 현재 월

        if(list != null) {
	        for(Attendance at : list) {
	        	
	        	if(Integer.parseInt(at.getDate().substring(0, 4)) == currentYear && Integer.parseInt(at.getDate().substring(5, 7)) == currentMonth) {
					
					if(at.getStatus().equals("Y")) {
						yes++;
					}else {
						no++;
					}
					
				}
	        	
	        }
        }
    	
    	 Month month1 = Month.of(currentMonth); // 평일수

         // YearMonth 객체 생성
         YearMonth yearMonth = YearMonth.of(currentYear, month1);

         // 해당 월의 총 일수 가져오기
         int totalDays = yearMonth.lengthOfMonth();

         // 해당 월의 평일 수 계산
         int weekdaysCount = 0;

         for (int day = 1; day <= totalDays; day++) {
             LocalDate date = LocalDate.of(currentYear, currentMonth, day);
             DayOfWeek dayOfWeek = date.getDayOfWeek();

             // 해당 날짜가 평일(월요일부터 금요일까지)인지 확인
             if (dayOfWeek != DayOfWeek.SATURDAY && dayOfWeek != DayOfWeek.SUNDAY) {
                 weekdaysCount++;
             }
         }
        
         double per = (double)yes/weekdaysCount*100;
         double roundedNumber = Math.round(per * 10.0) / 10.0;
        
        request.setAttribute("per", roundedNumber);
		request.setAttribute("yes", yes);
		request.setAttribute("no", no);
		
		request.getRequestDispatcher("/views/dogfor/dogforMain.jsp").forward(request, response);
	
	
	}
	
	 
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
