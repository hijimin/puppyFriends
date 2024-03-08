<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	int yes = (int)request.getAttribute("yes");
	int no = (int)request.getAttribute("no");
	
	double per = (double)request.getAttribute("per");
	
	/*
	SimpleDateFormat year = new SimpleDateFormat("yyyy");
	SimpleDateFormat month1 = new SimpleDateFormat("MM");
	
	Date d = new Date();
	
	String nowYear = year.format(d);       
	int nowMonth = Integer.parseInt(month1.format(d)); 
	*/
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
            
            width: 1700px;
            height: 1000px;
            margin: auto;
            margin-top: 10px;
        }
        .content1{
            width: 100%;
            height: 30%;
            padding-left: 400px;
        }
        .content2, .content4{
            width: 100%;
            height: 10%;
        }
        .content3{
            width: 100%;
            height: 50%;
            padding-left: 400px;
        }
        .photo{
            border: 1px solid black;
            width: 100%;
            height: 50%;
        }
        .photo *{
            border: 1px solid red;
            width: 300px !important;
            height: 190px !important;
            display: inline-block;
        }
        .content3>div{
            height: 100%;
            float: left;
            
        }        
        .content3_2{
            width: 700px;
            height: 100%;
        }
        .content3_1, .content3_3{
            width: 100px;
        }
        .check{
            width: 300px;
            height: 200px;
            float: left;
            margin-top: 50px;
        }
        #btn{
            font-size: 50px;
            background-color: rgb(255, 222, 239);
            border: 0px;
            color: white;
            margin-top: 210px;
            border-radius: 20px;
        }
        .swiper-button-next, .swiper-button-prev{
            position: relative !important;
        }
        img{
            width: 100%;
            height: 100%;
        }
        .swiper-slide{
            margin: 15px;
            margin-top: 25px;
        }
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
</head>
<body>

    <%@ include file="../common/menubar.jsp" %>

	<%@ include file="../chatting/chatting.jsp" %>
	
	<%@ include file="../common/topBtn.jsp" %>
	

    
    <div class="outer" align="center">
    
		<% if(loginUser != null){ %>
        <h2 align="center" style="margin-bottom: 0px;">이번달 출석부</h2>
        
        <div class="content1">
            
            <div class="check">
                <br>
                <h3>출석</h3>
                <br><br>
                <h3><%= yes %>일</h3>

            </div>
            <div class="check">
                <br>
                <h3>결석</h3>
                <br><br>
                <h3><%= no %>일</h3>
            </div>
            <div class="check">
                <br>
                <h3>출석률</h3>
                <br><br>
                <h3><%= per %>%</h3>
            </div>
            
        </div>

        <div class="content2">
        	
            <a href="<%= contextPath %>/attendance.at?userNo=<%= loginUser.getMemberNo() %>&year=<%= nowYear %>&month=<%= nowMonth %>" class="btn btn-lg" style="background-color: rgb(255, 222, 239); color: white;">출석부로</a>
            
        </div>
		<% } %>
        <div class="content3" align="center">

            <div class="content3_1">
                <div class="swiper-button-prev"></div>
            </div>
            <div class="swiper-container content3_2">
                <div class="swiper-wrapper photo">
                    <div class="swiper-slide"><img src="/puppy/resources/upfiles/2024022717003618908.jpg"></div>
                    <div class="swiper-slide"><img src="/puppy/resources/upfiles/2024022717003618908.jpg"></div>
                    <div class="swiper-slide"><img src="/puppy/resources/upfiles/2024022717003618908.jpg"></div>
                    <div class="swiper-slide"><img src="/puppy/resources/upfiles/2024022717003618908.jpg"></div>
                    <div class="swiper-slide"><img src="/puppy/resources/upfiles/2024022717003618908.jpg"></div>
                    <div class="swiper-slide"><img src="/puppy/resources/upfiles/2024022717003618908.jpg"></div>
                    <div class="swiper-slide"><img src="/puppy/resources/upfiles/2024022717003618908.jpg"></div>
                    <div class="swiper-slide"><img src="/puppy/resources/upfiles/2024022717003618908.jpg"></div>
                    <div class="swiper-slide"><img src="/puppy/resources/upfiles/2024022717003618908.jpg"></div> 
                </div>
                <div class="swiper-wrapper photo">
                    <div class="swiper-slide"><img src="/puppy/resources/upfiles/2024022717003618908.jpg"></div>
                    <div class="swiper-slide"><img src="/puppy/resources/upfiles/2024022717003618908.jpg"></div>
                    <div class="swiper-slide"><img src="/puppy/resources/upfiles/2024022717003618908.jpg"></div>
                    <div class="swiper-slide"><img src="/puppy/resources/upfiles/2024022717003618908.jpg"></div>
                    <div class="swiper-slide"><img src="/puppy/resources/upfiles/2024022717003618908.jpg"></div>
                    <div class="swiper-slide"><img src="/puppy/resources/upfiles/2024022717003618908.jpg"></div>
                    <div class="swiper-slide"><img src="/puppy/resources/upfiles/2024022717003618908.jpg"></div>
                    <div class="swiper-slide"><img src="/puppy/resources/upfiles/2024022717003618908.jpg"></div>
                    <div class="swiper-slide"><img src="/puppy/resources/upfiles/2024022717003618908.jpg"></div> 
                </div>
            </div>
            <div class="content3_3">
                <div class="swiper-button-next"></div>
            </div>

            

        </div>

        <div class="content4">
            <a href="<%= contextPath %>/gallery.ga?cpage=1" class="btn btn-lg" style="background-color: rgb(255, 222, 239); color: white;">갤러리로</a>
        </div>


    </div>

    <script>
        new Swiper('.swiper-container', {

        slidesPerView : 4, // 동시에 보여줄 슬라이드 갯수
        spaceBetween : 20, // 슬라이드간 간격
        slidesPerGroup : 4, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

        // 그룹수가 맞지 않을 경우 빈칸으로 메우기
        // 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
        loopFillGroupWithBlank : true,

        loop : true, // 무한 반복

        pagination : { // 페이징
            el : '.swiper-pagination',
            clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
        },
        navigation : { // 네비게이션
            nextEl : '.swiper-button-next', // 다음 버튼 클래스명
            prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
        },
        });
    </script>


    <%@ include file="../common/footerbar.jsp" %>

</body>
</html>