<%@page import="com.kh.dogfor.model.vo.Attendance"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	Calendar cal = Calendar.getInstance();
	
	// 시스템 오늘날짜
	int ty = cal.get(Calendar.YEAR);
	int tm = cal.get(Calendar.MONTH)+1;
	int td = cal.get(Calendar.DATE);
	
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH)+1;
	
	// 파라미터 받기
	String sy = request.getParameter("year");
	String sm = request.getParameter("month");
	
	if(sy!=null) { // 넘어온 파라미터가 있으면
		year = Integer.parseInt(sy);
	}
	if(sm!=null) {
		month = Integer.parseInt(sm);
	}
	
	cal.set(year, month-1, 1);
	year = cal.get(Calendar.YEAR);
	month = cal.get(Calendar.MONTH)+1;
	
	int week = cal.get(Calendar.DAY_OF_WEEK); // 1(일)~7(토)
	
	ArrayList<Attendance> list = (ArrayList<Attendance>)request.getAttribute("list");
	
	double per = (double)request.getAttribute("per");
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<style type="text/css">
*{
	margin: 0; padding: 0;
    box-sizing: border-box;
}

body {
	font-size: 14px;
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
}


.change-date1:hover, .change-date2:hover{
	text-decoration: none;
}
.change-date1{
	position: absolute;
	left: 50px;
}
.change-date2{
	position: absolute;
	right: 50px;
}

.calendar {
	width: 700px;
	height: 600px;
	margin-left: 350px;
}
.calendar .title{
	height: 100px;
	text-align: center;
	font-weight: 600;
	border-radius: 12px 12px 0px 0px;
	padding-top: 29px;
	position: relative;
}
.calendar .title h3, .calendar .title h3 a{
	color: white !important;
}

.calendar table {
	width: 100%;
	height: 100%;
	border-collapse: collapse;
	border-radius: 10px;
	border-spacing: 30;
}

.calendar table tbody td{
	padding: 10px;
	text-align: center;
	border: 1px solid #ccc;
	width: 85px;
	height: 85px;
}

.calendar table thead td{
	height: 70px !important;
	padding: 10px;
	border: 1px solid #ccc;
	text-align: center;
	
}

.calendar table td:nth-child(7n+1){
	color: red;
}
.calendar table td:nth-child(7n){
	color: blue;
}
.calendar table td.gray {
	color: #ccc;
}
.calendar table td.today{
	font-weight:700;
	background: lightgray;
}

.calendar .footer{
	height: 25px;
	line-height: 25px;
	text-align: right;
	font-size: 12px;
}
.outer1{
	width: 1900px;
	height: 600px;
}
.outer1>*{
	float: left;
	margin-top: 50px;
}
#bar{
	width: 30%;
	margin-left: 10px;
	height: 100%;
	padding-top: 40px;
}
.calendar{
	width: 40%;
	height: 95%;
}
#gauge{
	height: 70%;
	width: 100%;
	position : relative;
}
#gauge2{
	width: 15%;
	height: 70%;
	border: 1px solid rgb(255, 222, 239);
	background-color: rgb(255, 222, 239);
	border-radius: 10px;
	position : absolute;
	bottom : 0;
	left: 50%;
	transform: translate(-50%, 0);
}
.calendar table tbody td{
	padding-top: 5px;
	vertical-align: top;
}
#enroll{
	width: 1440px;
}
#no{
	color: red;
	font-size: 17px;
	font-weight: 500;
	padding-top: 10px;
}
#yes{
	color: blue;
	font-size: 17px;
	font-weight: 500;
	padding-top: 10px;
}
#goToday{
	color: black;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

</head>
<body>

	<%@ include file="../common/menubar.jsp" %>

	<h2 align="center">출석부</h2>
	
	<div class="outer1">
		<div class="calendar">
			<div class="title">
				<h3>
				<% if(month == 1){ %>
					<a class="change-date1" href="<%= contextPath %>/attendance.at?userNo=<%= loginUser.getMemberNo() %>&year=<%=year-1%>&month=<%=12%>">&lt;</a>
				<% }else{ %>
					<a class="change-date1" href="<%= contextPath %>/attendance.at?userNo=<%= loginUser.getMemberNo() %>&year=<%=year%>&month=<%=month-1%>">&lt;</a>
				<% } %>
				
				<label id="yymm"><%=year%>년 <%=month%>월</label>
				
				<% if(month == 12){ %>
					<a class="change-date2" href="<%= contextPath %>/attendance.at?userNo=<%= loginUser.getMemberNo() %>&year=<%=year+1%>&month=<%=1%>">&gt;</a>
				<% }else{ %>
					<a class="change-date2" href="<%= contextPath %>/attendance.at?userNo=<%= loginUser.getMemberNo() %>&year=<%=year%>&month=<%=month+1%>">&gt;</a>
				<% } %>
				</h3>
			</div>
			
			<table>
				<thead>
					<tr>
						<td>Sun</td>
						<td>Mon</td>
						<td>Tue</td>
						<td>Wed</td>
						<td>Thu</td>
						<td>Fri</td>
						<td>Sat</td>
					</tr>
				</thead>
				<tbody>
				<%
					// 1일 앞 달
					Calendar preCal = (Calendar)cal.clone();
					preCal.add(Calendar.DATE, -(week-1));
					int preDate = preCal.get(Calendar.DATE);
					
					out.print("<tr>");
					// 1일 앞 부분
					for(int i=1; i<week; i++) {
						//out.print("<td> </td>");
						out.print("<td class='gray'>"+(preDate++)+"</td>");
					}
					
					// 1일부터 말일까지 출력
					int lastDay = cal.getActualMaximum(Calendar.DATE);
					String cls;
					for(int i=1; i<=lastDay; i++) {
						cls = year==ty && month==tm && i==td ? "today":"";
						
						out.print("<td class='"+cls+"'>"+i+"</td>");
						if(lastDay != i && (++week)%7 == 1) {
							out.print("</tr><tr>");
						}
					}
					
					// 마지막 주 마지막 일자 다음 처리
					int n = 1;
					for(int i = (week-1)%7; i<6; i++) {
						// out.print("<td> </td>");
						out.print("<td class='gray'>"+(n++)+"</td>");
					}
					out.print("</tr>");
				%>		
				</tbody>
			</table>
		
			<div class="footer">
				<a href="<%= contextPath %>/attendance.at?userNo=<%= loginUser.getMemberNo() %>&year=<%=year%>&month=<%=tm%>" id="goToday">today</a>
			</div>

			
		</div>

		<div id="bar" align="center">
			<br>
			<h2 align="center">100%</h2><br>

			<div id="gauge">
				<div id="gauge2">
					<%= per %>%
				</div>
			</div>

			<br><h2 align="center">0%</h2><br>

		</div>


	</div>
	<br><br><br><br><br>
	<p id="change-month" style="display: none;"><%=month%></p>

	<%@ include file="../common/footerbar.jsp" %>

	


	<script>

		function findElementByText(text) {
			var jSpot = $("td")
				.filter(function() { 
					return $(this).text().trim() === text && $(this).attr('class').trim() === ''
					|| $(this).text().trim() === text && $(this).attr('class').trim() === 'today'; // 텍스트 일치 및 클래스가 공백인 경우 필터링
				})
				.filter(function() { 
					return $(this).children().length === 0; 
				});

			return jSpot;
		}

		$("#gauge2").css("height", "<%= per %>%")
		

	</script>
	
	<% for(Attendance at : list){ %>
	
		<% if(at.getStatus().equals("Y")){ %>
			
			<script type="text/javascript">
			
			findElementByText("<%= Integer.parseInt(at.getDate().substring(8, 10)) %>").html(findElementByText("<%= Integer.parseInt(at.getDate().substring(8, 10)) %>").html() + "<br> <div id='yes'>출석</div>");
			
			</script>
			
	
		<% }else{ %>
		
			<script type="text/javascript">
			
			
			findElementByText("<%= Integer.parseInt(at.getDate().substring(8, 10)) %>").html(findElementByText("<%= Integer.parseInt(at.getDate().substring(8, 10)) %>").html() + "<br> <div id='no'>결석</div>");
			
			</script>
			
		<% } %>

	<% } %>

	<script>
		function change(){

    let month = parseInt($("#change-month").html());
    	switch (month) {
        case 1: 
            $(".calendar .title").css("backgroundColor", "#16a085");
			$(".calendar table thead td").css("color", "#16a085")
            break;
        case 2:
            $(".calendar .title").css("backgroundColor", "#1abc9c");
			$(".calendar table thead td").css("color", "#1abc9c")
            break;
        case 3:
            $(".calendar .title").css("backgroundColor", "#c0392b");
			$(".calendar table thead td").css("color", "#c0392b")
            break;
        case 4:
            $(".calendar .title").css("backgroundColor", "#27ae60");
			$(".calendar table thead td").css("color", "#27ae60")
            break;
        case 5:
            $(".calendar .title").css("backgroundColor", "#FF6860");
			$(".calendar table thead td").css("color", "#FF6860")
            break;
        case 6:
            $(".calendar .title").css("backgroundColor", "#f39c12");
			$(".calendar table thead td").css("color", "#f39c12")
            break;
        case 7:
            $(".calendar .title").css("backgroundColor", "yellowgreen");
			$(".calendar table thead td").css("color", "yellowgreen")
            break;
        case 8:
            $(".calendar .title").css("backgroundColor", "#e67e22");
			$(".calendar table thead td").css("color", "#e67e22")
            break;
        case 9:
            $(".calendar .title").css("backgroundColor", "#2ecc71");
			$(".calendar table thead td").css("color", "#2ecc71")
            break;
        case 10:
            $(".calendar .title").css("backgroundColor", "#e74c3c");
			$(".calendar table thead td").css("color", "#e74c3c")
            break;
        case 11:
            $(".calendar .title").css("backgroundColor", "#d35400");
			$(".calendar table thead td").css("color", "#d35400")
            break;
        case 12:
            $(".calendar .title").css("backgroundColor", "#2c3e50");
			$(".calendar table thead td").css("color", "#2c3e50")
            break;
			}
		};

		$(document).ready(function() {
		change();
		});

	</script>

	<script>
		function storeScrollPosition() {
			localStorage.setItem("scrollPosition", window.scrollY);
		}
		
		function restoreScrollPosition() {
			let scrollPosition = localStorage.getItem("scrollPosition");
			if (scrollPosition !== null) {
				window.scrollTo(0, parseInt(scrollPosition));
				localStorage.removeItem("scrollPosition");
			}
		}
		
		window.addEventListener("scroll", storeScrollPosition);
		
		window.addEventListener("load", restoreScrollPosition);
	</script>


</body>
</html>

