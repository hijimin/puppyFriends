<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String contextPath = request.getContextPath(); //  "/Test"
	
	// 회원, 반려견 정보 담은 유저 정보
	Member loginUser = (Member)session.getAttribute("loginUser"); // 일반 로그인 유저
	
	String userNo = "1";
	if(loginUser != null){
		userNo = Integer.toString(((Member)session.getAttribute("loginUser")).getMemberNo());
	}
	
	String alertMsg = (String)session.getAttribute("alertMsg");
	
	SimpleDateFormat year1 = new SimpleDateFormat("yyyy");
	SimpleDateFormat month1 = new SimpleDateFormat("MM");
	
	Date d = new Date();
	
	String nowYear = year1.format(d);       
	int nowMonth = Integer.parseInt(month1.format(d));  
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" sizes="32x32" type="image/png" href="resources/image/closeupimg.png">
<title>PUPPY</title>
<style>
    
    div{/*border: 1px solid red;*/ box-sizing: border-box;}


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
        padding: 100px 100px;
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
    z-index: 999;
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
        left: 49.8%;
        transform: translateX(0%);
    }
    
    .board_All:hover>.board_Detail{
    	display: block;
        position: absolute;
        left: 70.1%;
        transform: translateX(0%);
    
    }
    .introduce:hover{
        cursor: pointer;
    }
    
    .before-login button{border: 0; background-color: transparent; margin-left: 20px; color: white;}
    .after-login>a{text-decoration: none; color: white !important;}
    .after-login>a:hover{color: pink;}
    .after-login{padding-left: 20px;}

    @font-face {
        font-family: 'omyu_pretty';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
        font-size: 20px;
    }

    *{
        font-family: 'omyu_pretty';
    }
  
    li, div{font-size: 20px;}
    
    /* --------------------------------------- */
    .SMN_effect-35 a {
        overflow: visible;
        -webkit-transform: translateZ(0);
        transform: translateZ(0);
        box-shadow: 0 0 1px rgba(0, 0, 0, 0);
        -webkit-backface-visibility: hidden;
        backface-visibility: hidden;
        -webkit-transition: color .4s;
        transition: color .4s
        }

        @keyframes eff24-move {
        30% {
            -webkit-transform: translate3d(0, -5px, 0) rotate(5deg);
            transform: translate3d(0, -5px, 0) rotate(5deg)
        }
        50% {
            -webkit-transform: translate3d(0, -3px, 0) rotate(-4deg);
            transform: translate3d(0, -3px, 0) rotate(-4deg)
        }
        80% {
            -webkit-transform: translate3d(0, 0, 0) rotate(-3deg);
            transform: translate3d(0, 0, 0) rotate(-3deg)
        }
        100% {
            -webkit-transform: rotate(0deg);
            transform: rotate(0deg)
        }
        }

        .SMN_effect-35 a:hover {
        -webkit-animation-name: eff24-move;
        animation-name: eff24-move;
        -webkit-animation-duration: .4s;
        animation-duration: .4s;
        -webkit-animation-timing-function: linear;
        animation-timing-function: linear;
        -webkit-animation-iteration-count: 1;
        animation-iteration-count: 1
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

    <!--
     부트 스트랩 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    -->

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
                <img src="resources/image/KakaoTalk_20240222_172839389.png" style="width: 300px; height: 300px; margin-left: 100px;">
            </div>
            <div class="header_2">
            	<div id="header"><h1 style="margin-top: 100px;"><a href="<%= contextPath %>" style="color: white; text-decoration: none; font-size: 70px;">puppy friend</a></h1></div>
                
            </div>

            <div class="header_3">

                

                    <!-- case1. 로그인 전 -->
                    <% if(loginUser == null) {%>
	                    <form class="before-login" action="<%= contextPath %>/loginform.me" method="post">
                            <button type="submit">로그인</button> 
                            <button onclick="location.href='<%= contextPath %>/enrollpage.me'" type="button">회원가입</button>
	                    </form>
                	<% }else {  %>
            
	                    <!-- case2. 로그인 후 -->
						
	                    <div>
	            		
	                        <b><%= loginUser.getMemberName() %>님</b>의 방문을 환영합니다 <br><br>
	                        <div align="center">
	                        	<% if(loginUser.getMemberName().equals("관리자")) { %>
	                        	<a href="<%= contextPath %>/AdminMemberCount.me">관리자</a>
	                        	<% } %>
	                            <a href="<%= contextPath %>/mypage">마이페이지</a>
	                            <a href="<%= contextPath %>/logout">로그아웃</a>
	                        </div>
	            	
	                    </div>
	                <% } %>
	                    
            		
            
                
            </div>
        </div>

        <ul class="navigator_tool align-center expanded text-center SMN_effect-35" align="center">
            <li class="navi_menu"><a href="<%= contextPath %>">홈</a></li>
            <li class="menu_intro"><a onclick="goMap();" style="color: white;" class="introduce">소개</a>
                <ul class="welcome">
                    <li><a onclick="goMap();" class="introduce">오시는 길</a></li>
                </ul>
            </li>
            <li class="program"><a href="#">프로그램</a>
              <ul class="reservation">
                <li class="hotel"><a href="<%= contextPath %>/hotel.hrv">호텔 예약</a></li>
                <li class="kindergarten"><a href="<%= contextPath %>/kinderClass.crv">유치원 예약</a></li>
              </ul>
            </li>
            <li class="dog_data"><a href="<%= contextPath %>/dogforMain.do?userNo=<%= userNo %>&year=<%= nowYear %>&month=<%= nowMonth %>">강아지정보</a>
                <ul class="dog_data2">
                	<% if(loginUser != null || (loginUser != null && loginUser.getMemberId().equals("ADMIN"))){ %>
                   <li class="attend"><a href="<%= contextPath %>/attendance.at?userNo=<%= userNo %>&year=<%= nowYear %>&month=<%= nowMonth %>">출석부</a></li>
                   <% } %>
                   <li class="gallery"><a href="<%= contextPath %>/gallery.ga?cpage=1">갤러리</a></li>
                </ul>
            </li>

            <li class="goods"><a href="<%= contextPath %>/list.pd?cpage=1">상품</a></li>
            
            
            <li class="board_All"><a href="<%= contextPath %>/list.no">게시판</a>
            	<ul class="board_Detail">
            		<li class="noticeBoard"><a href="<%= contextPath %>/list.no">공지사항</a></li>
            		<li class="chattingBoard"><a href="<%= contextPath %>/chatForm.ch">모임게시판</a></li>
            		
            	</ul>
            </li>
            

        </ul> <br>
	
		 <p id="HOME_PATH" style="display: none;"><%= contextPath %></p>
        <script>
            function goMap(){
                const homePath = $("#HOME_PATH").text() + "/";

                if(window.location.pathname === homePath){
                    window.scrollTo({
                        top:3400,
                        behavior:'smooth'
                    });

                }else{

                    location.href = homePath;

                    document.addEventListener('DOMContentLoaded', function() {
                        // 페이지의 HTML이 완전히 로드된 후 실행될 함수
                        window.scrollTo({
                            top: 3400,
                            behavior: 'smooth'
                        });
                    });

                    
                        
                }

            }
        </script>


</body>
</html>
