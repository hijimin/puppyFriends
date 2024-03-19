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

.change-date1{
  color: black !important;
  text-decoration: none;
  cursor: pointer;
}
.change-date2{
  color: black !important;
  text-decoration: none;
  cursor: pointer;
}
a:active, a:hover {
	text-decoration: underline;
	color: #F28011;
}

.calendar {
	width: 700px;
	height: 600px;
	margin-left: 350px;
}
.calendar .title{
	height: 37px;
	line-height: 37px;
	text-align: center;
	font-weight: 600;
}

.calendar table {
	width: 100%;
	height: 100%;
	border-collapse: collapse;
	border-spacing: 0;
}

.calendar table tbody td{
	padding: 10px;
	text-align: center;
	border: 1px solid #ccc;
	width: 85px;
	height: 85px;
}

.calendar table thead td{
	height: 30px;
	padding: 10px;
	border: 1px solid #ccc;
	text-align: center;
	background: #f6f6f6; 
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
	background: #E6FFFF;
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
	font-size: 20px;
	font-weight: 700;
	padding-top: 10px;
}
#yes{
	color: blue;
	font-size: 20px;
	font-weight: 700;
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

	<div id="enroll" align="right"><a href="<%= contextPath %>/enroll.at">출석등록</a></div>
	
	<div class="outer1">
		<div class="calendar">
			<div class="title">
				<% if(month == 1){ %>
					<a class="change-date1" href="<%= contextPath %>/attendance.at?userNo=<%= loginUser.getMemberNo() %>&year=<%=year-1%>&month=<%=12%>" onclick="next();"><</a>
				<% }else{ %>
					<a class="change-date2" href="<%= contextPath %>/attendance.at?userNo=<%= loginUser.getMemberNo() %>&year=<%=year%>&month=<%=month-1%>" onclick="next();"><</a>
				<% } %>
				
				<label id="yymm"><%=year%>년 <%=month%>월</label>
				
				<% if(month == 12){ %>
					<a href="<%= contextPath %>/attendance.at?userNo=<%= loginUser.getMemberNo() %>&year=<%=year+1%>&month=<%=1%>" onclick="next();">></a>
				<% }else{ %>
					<a href="<%= contextPath %>/attendance.at?userNo=<%= loginUser.getMemberNo() %>&year=<%=year%>&month=<%=month+1%>" onclick="next();">></a>
				<% } %>
			
			</div>
			<br>
			<table>
				<thead>
					<tr>
						<td>일</td>
						<td>월</td>
						<td>화</td>
						<td>수</td>
						<td>목</td>
						<td>금</td>
						<td>토</td>
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
				<a href="<%= contextPath %>/attendance.at?userNo=<%= loginUser.getMemberNo() %>&year=<%=year%>&month=<%=tm%>" id="goToday">오늘날짜로</a>
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

</body>
</html>

