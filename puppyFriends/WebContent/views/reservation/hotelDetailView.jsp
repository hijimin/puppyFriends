<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        .photoImg{
            margin: 20% 20%;
            width: 60%;
            height: 70%;
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
            <h1 align="right">호텔댕루나 // # </h1>
        </div>
        <br>
        
        <div class="photo_text"> <!-- 왼쪽 맵-->
            <div class="photo">
                <div class="photo_pt">
                    <img class="photoImg" src="https://flexible.img.hani.co.kr/flexible/normal/960/960/imgdb/resize/2019/0121/00501111_20190121.JPG" alt="">
                </div>

                <div class="photoBar">이전 사진 , o o o , 다음 사진 넘어가게 </div>
            </div>
            
            <div class="blank1" style="border-left: 2px solid rgb(255, 222, 239); height: 78%;"></div> <!-- 중간 줄임-->
            
            <div class="text" align="right"> <!-- 오른쪽 맵 -->
                <div class="period">기간 : 2024-02-01 ~ 2024-02-29 // # </div> <br><br>
                <div>(2 / 10, 신청인원수/정원)</div>
                <div class="introduce">
                    <tr>
                        <td>
                             여기에 소개글 올라가도록
                        </td>
                    </tr>
                </div>
                
                <div class="btn_bar">
                    <button>예약하기// onclick 예정</button> 
                </div>
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