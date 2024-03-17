<%@page import="com.kh.common.model.vo.Image"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.reservation.model.vo.Hotel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    Hotel h = (Hotel)request.getAttribute("h");
    int hotelrvCount = (int)request.getAttribute("hotelrvCount");
    ArrayList<Image> img = (ArrayList<Image>)request.getAttribute("img");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
         /* *{
            border: 1px solid red;
        } */
       
        .outer{
            margin: auto;
            margin-top: 30px;

            width: 65%;
            height: 1000px;
        }
        .outer_name{
            width: 100%;
            height: 5%;
        }
        .hotelName{
            width: 100%;
            height: 10%;
        }
        .photo_text{
            width: 100%;
            height: 84%;
        }
        .photo{
            float: left;
            width: 50%;
            height: 100%;
        }
        .photo_pt{
            width: 100%;
            height: 70%;

        }
        .photoBar{
            width: 100%;
            height: 5%;
        }
        .photoBar>*{
            color: rgb(255, 222, 239);
            font-size: 30px;
            cursor: pointer;
        }
        .photoBar>*:hover{
            text-decoration: none;
            color: brown;

        }
        .photoImg1{
            margin: 20% 16%;
            width: 50%;
            height: auto;
        }
        .photoImg{
            margin: 20% 20%;
            width: 40%;
            height: auto;
        }
        .blank1{
            left: 50%;
            width: 2%;
            height: 100%;
            position: absolute;
        }

        .text{
           float: right;
           width: 48%;
           height: 100%;
           
        }
        .period{
            position: relative;
            width: 100%;
            height: 10%;
        }
        .introduce{
            width: 80%;
            height: 45%;
            border: 2px solid rgb(255, 222, 239);
        }
        .btn_bar{
            width: 100%;
            height: 20%;
            position: relative;
        }
        .btn_bar>button{
            padding: 10px 15px;
            border: none;
            background-color: rgb(255, 222, 239);
            position: absolute;
            bottom: 0; 
            right: 0;
            border-radius: 20px
        }
        .btn_bar1{
            width: 100%;
            height: 5%;
            position: relative;
        }
        .btn_bar1>.H_update{
            padding: 10px 15px;
            border: none;
            background-color: rgb(255, 222, 239);
            position: absolute;
            bottom: 0;
            right: 0;
            border-radius: 20px;
            text-decoration: none;
            color: white;
        
        }
        .btn_bar1>.H_delete{
            padding: 10px 15px;
            border: none;
            background-color: rgb(255, 222, 239);
            position: absolute;
            bottom: 0;
            right: 0;
            border-radius: 20px;
            text-decoration: none;
            color: white;
        }
        
	</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>
	<form id="detail-form" action="<%= contextPath %>/detail.hrv" method="post" enctype="multipart/form-data">
	<div class="outer">
 
        <div align="right" class="outer_name">
            프로그램 &gt; 호텔 예약 &gt; <%= h.getHotelName() %> &nbsp; &nbsp;
        </div>
        <br><br>
        <div class="hotelName">
            <h1 align="right"> <%= h.getHotelName() %></h1>
        </div>
        <br>
        
        <div class="photo_text"> <!-- 왼쪽 맵-->
            <div class="photo">
                <div class="photo_pt">
                    <p align="center">&lt; 작성자 : <%= h.getMemberId() %> &gt;</p>
                    <div class="photoImg1">
                        <img class="photoImg" src="<%= contextPath %>/<%= img.get(0).getFilePath() + img.get(0).getChangeName() %>" style="width:100%">
                       <% for(int i = 1; i<img.size(); i++) { %>
                        <img class="photoImg" src="<%= contextPath %>/<%= img.get(i).getFilePath() + img.get(i).getChangeName() %>" style="width:100%">
                   	   <% } %>
                   
                   
                    </div>
                </div>
                    <div class="photoBar" align="center">
                        <a class="prev" onclick="plusSlides(-1)">&#10094;</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a class="next" onclick="plusSlides(1)">&#10095;</a>
                    </div>
                
            </div>

			<!-- 사진 넘어가게 -->
            <script>
                var slideIndex = 1;
                showSlides(slideIndex);
                
                function plusSlides(n) {
                  showSlides(slideIndex += n);
                }
                
                function showSlides(n) {
                  var i;
                  var slides = document.getElementsByClassName("photoImg");
                  if (n > slides.length) {slideIndex = 1}    
                  if (n < 1) {slideIndex = slides.length}
                  for (i = 0; i < slides.length; i++) {
                      slides[i].style.display = "none";  
                  }
                  slides[slideIndex-1].style.display = "block";  
                }
            </script>
            
            <div class="blank1" style="border-left: 2px solid rgb(255, 222, 239); height: 78%;"></div> <!-- 중간 줄임-->
            
            <div class="text" align="right"> <!-- 오른쪽 맵 -->
                <div class="period">기간 : <%= h.getHotelStart() %> ~ <%= h.getHotelEnd() %> </div> <br><br>
                <div>( <%= hotelrvCount %> / <%= h.getdNumber() %>) , <%= h.getHotelSize() %> </div>
                <div class="introduce">
                    <tr>
                        <td>
                        <p style="text-align: left; padding: 10px;"><%= h.getHotelText() %></p>
                             
                        </td>
                    </tr>
                </div>
                
                
                <div class="btn_bar">
                    if 사 등록된 사이즈와 동일하지 않을 시 자동으로 예약 버튼 막힘
                    <button class="btn-open-modal" >예약하기// onclick 예정 , 예약 alert 띄운 후 동의 시 결제 페이지로 넘어감 alert 이후 결제 페이지로 넘어가게</button> 
                </div>

                 
				<% if(loginUser != null && loginUser.getMemberId().equals("ADMIN")) { %>

                <div class="btn_bar1">
                	<a href="<%= contextPath %>/updateForm.hrv?num=<%= h.getHotelNo() %>" class="H_update">수정하기</a>
                </div>
                <div class="btn_bar1">
                    <a href="<%= contextPath %>/delete.hrv?num=<%= h.getHotelNo() %>" class="H_delete">삭제하기</a>
                    
                </div>
                <% } %>
            </div>

            <br><br>

        </div>
    </div>
  </form>


    
    <%@ include file="../common/topBtn.jsp" %> <br>
    <%@ include file="../common/footerbar.jsp" %>

</body>
</html>