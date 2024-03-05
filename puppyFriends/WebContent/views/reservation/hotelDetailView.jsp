<%@page import="com.kh.reservation.model.vo.Hotel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    Hotel h = (Hotel)request.getAttribute("h");
    
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
        .btn_bar1>button{
            border: none;
            background-color: rgb(255, 222, 239);
            position: absolute;
            bottom: 0; 
            right: 0;
            border-radius: 20px;
        
        }

	</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>

	<div class="outer">

        <div align="right" class="outer_name">
            프로그램 &gt; 호텔 예약 &gt; 호텔댕루나 &nbsp; &nbsp; // #
        </div>
        <br><br>
        <div class="hotelName">
            <h1 align="right"><%= h.getHotelName() %></h1>
        </div>
        <br>
        
        <div class="photo_text"> <!-- 왼쪽 맵-->
            <div class="photo">
                <div class="photo_pt">
                    <p>&lt;이미지 미리보기/빈칸예정/&gt;</p>
                    <div class="photoImg1">
                        <img class="photoImg" src="https://image.dongascience.com/Photo/2020/03/5bddba7b6574b95d37b6079c199d7101.jpg" style="width:100%">
                        <img class="photoImg" src="https://www.dailysecu.com/news/photo/202104/123449_145665_1147.png" style="width:100%">
                        <img class="photoImg" src="https://flexible.img.hani.co.kr/flexible/normal/960/960/imgdb/resize/2019/0121/00501111_20190121.JPG" style="width:100%">
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
                <div class="period">기간 : 2024-02-01 ~ 2024-02-29 // # </div> <br><br>
                <div>(2 / 10, 신청인원수/정원) , M</div>
                <div class="introduce">
                    <tr>
                        <td>
                             여기에 소개글 올라가도록
                        </td>
                    </tr>
                </div>
                
                
                <div class="btn_bar">
                    if 사 등록된 사이즈와 동일하지 않을 시 자동으로 예약 버튼 막힘
                    <button>예약하기// onclick 예정 , 예약 alert 띄운 후 동의 시 결제 페이지로 넘어감 alert 이후 결제 페이지로 넘어가게</button> 
                </div>

                 if문 사용해서 관리자 아니면 막아야 함ㄱㄱ

                <div class="btn_bar1">
                    <button>수정하기// 관리자 아니면 안 보이게</button> 
                </div>
                <div class="btn_bar1">
                    <button>삭제하기// 관리자 아니면 안 보이게</button> 
                </div>
                
            </div>

            <br><br>

        </div>
    </div>


    
    <%@ include file="../common/topBtn.jsp" %> <br>
    <%@ include file="../common/footerbar.jsp" %>

</body>
</html>