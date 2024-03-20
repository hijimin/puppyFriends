<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   String contextPath = request.getContextPath();

   Member loginUser = (Member)session.getAttribute("loginUser");
   
   String alertMsg = (String)session.getAttribute("alertMsg");

   int yResult = (int)request.getAttribute("yResult"); 
   int nResult = (int)request.getAttribute("nResult");
   
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인 페이지</title>

   <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>

  <!-- jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
   <style>
      
    </style>
</head>
<body>

	<% 
		Cookie[] cookies = request.getCookies();
		System.out.println("cookies : " + cookies);
		
		if(cookies != null) {
			for(Cookie c : cookies) {
				out.print("name : " + c.getName() + "<br>");
				out.print("value : " + c.getValue() + "<br>");
				out.print("----------------<br>");
			}
		}
	
	%>
	
	<form action="loginCon" method>
   
</body>
</html>
