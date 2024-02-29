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
        .hotel_rv{
            height: 70%;
        }
        .hotel_rv_intro{
            align: center;
            margin-top: 145px;
            border: 3px solid rgb(255, 222, 239);
        }
        
        
        .btn_bar{
            width: 100%;
            height: 10%;
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
   
        

	</style>
</head>

<body>
    <%@ include file="../common/menubar.jsp" %>


    <div class="outer">

        <div align="right" class="outer_name">
            프로그램 &gt; 호텔 예약 &gt; 호텔 등록 &nbsp; &nbsp; // # 호텔 > 유치원 변경 가능하게? 안 하게?
        </div>
        <br><br>
        <div class="hotelName">
            <h1 align="right" style="vertical-align: top">빈칸</h1>
        </div>
        <br>
        
        <div class="photo_text"> <!-- 왼쪽 맵-->
            <div class="photo">
                <div class="photo_pt">
                    <p>&lt;이미지 미리보기&gt;</p>
                    <img class="photoImg" src="https://flexible.img.hani.co.kr/flexible/normal/960/960/imgdb/resize/2019/0121/00501111_20190121.JPG" alt="">
                </div>

                <div class="photoBar" align="center">이전 사진 , o o o , 다음 사진 넘어가게 </div>
            </div>
            
            <div class="blank1" style="border-left: 2px solid rgb(255, 222, 239); height: 78%;"></div> <!-- 중간 줄임-->
            
            <div class="text" align="right"> <!-- 오른쪽 맵 -->

                <div class="hotel_rv">
                <table class="hotel_rv_intro" border=1 align="center">
                    <tr>
                        <th>호텔명 : </th>
                        <td><input type="text" class="title" required placeholder="호텔명을 입력해 주세요."></td>
                    </tr>
                    <tr>
                        <th>소개글 : </th>
                        <td><textarea class="intro" cols="50%" rows="8%" style="resize: none;" required placeholder="내용을 입력해 주세요."></textarea></td>
                    </tr>
                    <tr>
                        <th>사이즈 : </th>
                        <td>
                            <select class="select_text">
                                <option value="s">S</option>
                                <option value="m">M</option>
                                <option value="L">L</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>정원 : </th>
                        <td><input type="number" required></td>
                    </tr>
                    <tr>
                        <th>일정 : </th>
                        <td>
                            시작 : <input type="date" id="start-date" style="margin-bottom: 3px;" required><br> 
                            종료 : <input type="date" id="end-date" required>
                        </td>
                    </tr>
                    <tr>
                        <th>사진등록 : </th>
                        <td><input type="file"></td>
                    </tr>
                    <tr>
                        <th>금액 : </th>
                        <td><input type="number" required></td>
                    </tr>
                </table>
            </div>

                <div class="btn_bar">
                    <button>등록하기// onclick 예정</button> 
                </div>
                
                

            </div>

            <br><br>

        </div>



    </div>

    
    <%@ include file="../common/topBtn.jsp" %> <br>
    <%@ include file="../common/footerbar.jsp" %>


</body>
</html>