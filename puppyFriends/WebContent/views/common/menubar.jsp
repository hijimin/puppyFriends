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
        list-style-type: none;
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
    
    /* 네비바 스타일 시작 */
    .navigator_tool {
    list-style-type: none; /* 기호 미지정 */
    padding: 0;
    width: 1903px;
    background-color: rgb(255, 222, 239);
    position: sticky;
    top: 0;
    z-index: 9999;
    }

    .navigator_tool>li {
   /* position: relative; */ /* 없으면 인라인 */
    display: inline-block;
    background-color: rgb(255, 222, 239);
    /*rgb(255, 222, 239)*/
    }
    
    .navigator_tool ul{
    list-style-type: none;
    text-align: center;
    margin: 0;
    padding: 0;
    
    }

    .navigator_tool a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 75px; /*25px, 60px, 65px 중 선택 필요*/
    text-decoration: none;
    
    }

    .navigator_tool>li>a:hover {
    /* 호버 시 메뉴바 색 변경*/
    /* background-color: rgb(128, 17, 74);  */
    background-color: rgb(255, 222, 239);
    color: white;
    text-decoration: none;

    }

    .navigator_tool>li>ul {
    display: none; /* 없으면 메뉴바 호버 안됨 / 고정된 상태, */
    position: absolute; /* 있으면 아래로 예쁘게 배치됨, 없으면 메뉴바 내려옴. 사이즈는 맞는데...*/
    
    /* background-color: blue;  */
    background-color: whitesmoke;
    }

    .navigator_tool>li>ul>li>a {
    color: black;
    }

    .navigator_tool>li>ul>li>a:hover{
        background-color: gray;
        text-decoration: none;
    }

    /* 인라인 요소 적용 필요 */
    /* 밑에 호버 내려오게 뜨게 */
    .menu_intro:hover > .welcome {
        display: block;
        transform: translateX(-9%);
    }

    .program:hover > .reservation {
        display: block;
        transform: translateX(-4.8%);
    }

    .dog_data:hover > .dog_data2{
        display: block;
        position: absolute;
        left: 50%;
        transform: translateX(0%);
    }

    /* 네비바 스타일 끝 */

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
                <img src="resources/image/KakaoTalk_20240222_172839389.png" style="width: 200px; height: 200px; margin-left: 30px;">
            </div>
            <div class="header_2">
            	<div id="header"><h1 style="margin-top: 100px;"><a href="<%= contextPath %>" style="color: white; text-decoration: none;">puppy friend</a></h1></div>
                
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
                            <a href="<%= contextPath %>/mypage">마이페이지</a>
                            <a href="<%= contextPath %>/logout">로그아웃</a>
                        </div>
            
                    </div>
            		<% } %>
            
                </div>
            </div>
        </div>

        <ul class="navigator_tool" align="center">
            <li class="navi_menu"><a href="#">홈</a></li>
            <li class="menu_intro"><a href="#">소개</a>
                <ul class="welcome">
                    <li><a href="#">오시는 길</a></li>
                </ul>
            </li>
            <li class="program"><a href="#">프로그램</a>
              <ul class="reservation">
                <li class="hotel"><a href="<%= contextPath %>/insert.hrv">호텔 예약</a></li>
                <li class="kindergarten"><a href="#">유치원 예약</a></li>
              </ul>
            </li>
            <li class="dog_data"><a href="#">강아지정보</a>
                <ul class="dog_data2">
                   <li class="attend"><a href="<%= contextPath %>/dogforMain.do">출석부</a></li>
                   <li class="gallery"><a href="#">갤러리</a></li>
                </ul>
            </li>
            <li class="goods"><a href="<%= contextPath%>/list.pd?cpage=1">상품</a></li>
            <li class="search"><a href="<%= contextPath %>/noticeList.no?cpage=1">게시판</a>
                <ul>
                    <li><a href="">공지사항</a></li>
                </ul>
            </li>

        </ul> <br>




</body>
</html>