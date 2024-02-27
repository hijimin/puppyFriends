<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String contextPath = request.getContextPath(); //  "/Test"
	
	Member loginUser = (Member)session.getAttribute("loginUser");
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PUPPY</title>
<style>
    body{
            margin: 0px;
    }
    
    .header{
        width: 1903px;
        height: 300px;
        background-color: rgb(255, 222, 239);
    }
    .header>*{
        height: 100%;
        float: left;
    }
    .header_1{
        width: 25%;
        /* font-size: 50px; */
        /* text-align: center; */
        line-height: 300px;
        /* font-weight: 700; */
    }
    .header_2{
        width: 50%;
        height: 100%;
    }
    .header_3{
        width: 25%;
        height: 100%;
    }
    .navigator{
        width: 1903px;
        height: 100px;
        background-color: rgb(255, 222, 239);
    }
    .menu{
        width: 200px;
        height: 100px;
        display: table-cell;
    }
    
    .navigator a{
        color: white;
        font-size: 20px;
        height: 100%;
        width: 100%;
        font-weight: 600;
        text-decoration: none;
        display: block;
    }
    .header_2{
        text-align: center;
    }
    #header{
        display: contents;
        
    }
    
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
		
		<% if(alertMsg != null) { %>
		<script>
			alert("<%= alertMsg %>");
		</script>
		<% session.removeAttribute("alertMsg"); %>
		<% } %>

        <div class="header">
            <div class="header_1">
                <img src="로고.png" style="width: 150px; height: 150px; margin-left: 30px;">
            </div>
            <div class="header_2">
            	<div id="header"><h1 style="margin-top: 100px;"><a href="<%= contextPath %>" style="color: white;">puppy friend</a></h1></div>
                
            </div>

            <div class="header_3">

                <div class="login-area">

                    <!-- case1. 로그인 전 -->
                    <% if(loginUser == null) {%>
                    <form action="<%= contextPath %>/loginform.me" method="post">
            
                        <table align="center">
                            
                            <tr>
                                <th colspan="2">
                                    <button type="submit">로그인</button>
                                    <button onclick="location.href='<%= contextPath %>/enrollpage.me'" type="button">회원가입</button>
                                </th>
                            </tr>
                        </table>
            
                    </form>
                	<% }else { %>
            
                    <!-- case2. 로그인 후 -->
                    <div>
            
                        <b><%= loginUser.getMemberName() %>님</b>의 방문을 환영합니다 <br><br>
                        <div align="center">
                            <a href="#">마이페이지</a>
                            <a href="<%= contextPath %>/logout">로그아웃</a>
                        </div>
            
                    </div>
            		<% } %>
            
                </div>
            </div>
        </div>

        <div class="navigator" align="center">
            <div class="menu"><a href="">홈</a></div>
            <div class="menu"><a href="">소개</a></div>
            <div class="menu"><a href="">프로그램</a></div>
            <div class="menu"><a href="<%= contextPath %>/dogforMain.do">수업일지</a></div>
            <div class="menu"><a href="<%= contextPath %>/list.pd">상품</a></div>
            <div class="menu"><a href="">검색</a></div>
        </div>



</body>
</html>