<%@page import="com.kh.common.model.vo.Image"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	int yes = (int)request.getAttribute("yes");
	int no = (int)request.getAttribute("no");
	
	double per = (double)request.getAttribute("per");
	
	ArrayList<Image> list = (ArrayList<Image>)request.getAttribute("list");
	
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
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" rel="stylesheet" type="text/css" />
<style>
    .outer{      
        width: 1700px;
        height: 1300px;
        margin: auto;
        margin-top: 10px;
    }
    .content1{
        width: 100%;
        height: 20%;
        padding-left: 400px;
    }
    .content2, .content4{
        width: 100%;
        height: 10%;
    }
    .content3{
        width: 100%;
        height: 60%;
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
    .swiper {
    width: 70%;
    height: 50%;

    }

    .swiper-wrapper {
    transition-timing-function: linear;
    column-gap: 30px;
    }

    .swiper-slide {
    text-align: center;
    font-size: 18px;
    background: #fff;
    display: flex;
    justify-content: center;
    align-items: center;
    width: 400px !important;
    height: 350px !important;
    transition: transform 0.3s;
    }

    .swiper-slide img {
    display: block;
    width: 100%;
    height: 100%;
    object-fit: cover;
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
		<% if(list.isEmpty()){ %>
			<div> 이미지가 없습니다 </div>
		<% }else{ %>
            <div class="swiper mySwiper">
                <div class="swiper-wrapper">
                <% for(Image i : list){ %>
                	<% if(i.getFileNo() % 2 == 1){ %>
                  <div class="swiper-slide"><img src="<%= contextPath %>/<%= i.getTitleImg() %>"></div>
                  	<% } %>
                <% } %>  
                </div>
              </div>
              
              <div class="swiper mySwiper">
                <div class="swiper-wrapper">
                <% for(Image i : list){ %>
                	<% if(i.getFileNo() % 2 == 0){ %>
                  <div class="swiper-slide"><img src="<%= contextPath %>/<%= i.getTitleImg() %>"></div>
                    <% } %>
                <% } %> 
                </div>
              </div>
		<% } %>
            

        </div>
		
        <div class="content4">
            <a href="<%= contextPath %>/gallery.ga?cpage=1" class="btn btn-lg" style="background-color: rgb(255, 222, 239); color: white;">갤러리로</a>
        </div>


    </div>

    <script>
        const swiperSlides = document.querySelectorAll('.swiper');

        swiperSlides.forEach(function (element, index) {
            element.classList.add("swiper-" + index);
            let swiper = new Swiper(".swiper-" + index, {
            autoplay: {
                    delay: 0,
                    disableOnInteraction: false,
            },
            speed: 4000,
            loop: true,
            slidesPerView: "auto",
            freemode: true
            });
        });
    </script>


    <%@ include file="../common/footerbar.jsp" %>

</body>
</html>