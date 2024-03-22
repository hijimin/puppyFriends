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

import com.kh.dogfor.model.service.DogforService;
import com.kh.dogfor.model.vo.Attendance;
import static com.kh.member.controller.DogEnrollFormController.*;

/**
 * Servlet implementation class AttendenceMainFormController
 */
@WebServlet("/attendance.at")
public class AttendenceMainFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AttendenceMainFormController() {
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
		int yes = 0;
		
		ArrayList<Attendance> list = new DogforService().selectAttendanceList(userNo);
		//System.out.println(list.get(0).getDate()); // 년 월 일
		//System.out.println(list.get(0).getDate().substring(0, 4)); // 년
		//System.out.println(list.get(0).getDate().substring(5, 7)); // 월
		
		ArrayList<Attendance> userList = new ArrayList<Attendance>();
		
		for(Attendance at : list) {
			
			if(Integer.parseInt(at.getDate().substring(0, 4)) == year && Integer.parseInt(at.getDate().substring(5, 7)) == month) {
				
				userList.add(at);
				if(at.getStatus().equals("Y")) {
					yes++;
				}
				
			}
			
		}
		
		Month currentMonth = Month.of(month);

        // YearMonth 객체 생성
        YearMonth yearMonth = YearMonth.of(year, currentMonth);

        // 해당 월의 총 일수 가져오기
        int totalDays = yearMonth.lengthOfMonth();

        // 해당 월의 평일 수 계산
        int weekdaysCount = 0;

        for (int day = 1; day <= totalDays; day++) {
            LocalDate date = LocalDate.of(year, month, day);
            DayOfWeek dayOfWeek = date.getDayOfWeek();

            // 해당 날짜가 평일(월요일부터 금요일까지)인지 확인
            if (dayOfWeek != DayOfWeek.SATURDAY && dayOfWeek != DayOfWeek.SUNDAY) {
                weekdaysCount++;
            }
        }

		
        double per;
        double roundedNumber = 0;
        
        if(yes != 0) {
        	if(month == 3) {
        		per = (double)yes/(weekdaysCount-1)*100;
        		roundedNumber = Math.round(per * 10.0) / 10.0;
        	}else {
        	per = (double)yes/weekdaysCount*100;
    		roundedNumber = Math.round(per * 10.0) / 10.0;
        	}
        }
		
		request.setAttribute("per", roundedNumber);
		
		request.setAttribute("list", userList);
		request.getRequestDispatcher("/views/dogfor/attendanceMainForm.jsp").forward(request, response);
		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
