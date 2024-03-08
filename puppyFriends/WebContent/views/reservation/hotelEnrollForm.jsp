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
        .hotel_rv{
            height: 70%;
        }
        .hotel_rv_intro{
            align: center;
            margin-top: 145px;
            border: 3px solid rgb(255, 222, 239);
        }
        .hotel_rv_intro th{
            width: 30%;
        }
        .hotel_rv_intro td{
            width: 70%;
        }
        
        .btn_bar{
            width: 100%;
            height: 10%;
            position: relative;
        }
        .btn_bar>button{
            display: inline-block;
            padding: 10px 15px;
            border: none;
            background-color: rgb(255, 222, 239);
            /* position: absolute; */
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
            프로그램 &gt; 호텔 예약 &gt; 호텔 등록 &nbsp; &nbsp;
        </div>
        <br><br>
        <div class="hotelName">
            <h1 align="right" style="vertical-align: top">등록</h1>
        </div>
        
        <form action="<%= contextPath %>/insert.hrv" id="enroll-form" method="post" enctype="enctype="multipart/form-data">
        <input type="hidden" name="memberNo" value="<%= loginUser.getMemberNo()%>">
        
        <div class="photo_text"> <!-- 왼쪽 맵-->
            <div class="photo">
                <div class="photo_pt">
                    <p>&lt;이미지 미리보기&gt;</p>
                    <div class="photoImg1">
                        <img class="photoImg" src="https://image.dongascience.com/Photo/2020/03/5bddba7b6574b95d37b6079c199d7101.jpg" style="width:100%" onclick="chooseFile(1)">
                        <img class="photoImg" src="https://www.dailysecu.com/news/photo/202104/123449_145665_1147.png" style="width:100%" onclick="chooseFile(2)">
                        <img class="photoImg" src="https://flexible.img.hani.co.kr/flexible/normal/960/960/imgdb/resize/2019/0121/00501111_20190121.JPG" style="width:100%" onclick="chooseFile(3)">
                    </div>
                    
                    <div id="file-area" style="display:none">
		                <input type="file" name="file1" id="file1" onchange="loadImg(this, 1);" required>
		                <input type="file" name="file2" id="file2" onchange="loadImg(this, 2);">
		                <input type="file" name="file3" id="file3" onchange="loadImg(this, 3);">
         			</div>
         			
         			
            
                </div>
                    <div class="photoBar" align="center">
                        <a class="prev" onclick="plusSlides(-1)">&#10094;</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a class="next" onclick="plusSlides(1)">&#10095;</a>
                    </div>
                
            </div>

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

                <div class="hotel_rv">
                <table class="hotel_rv_intro" border=1>
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
                        <td><input type="file">
                            <input type="file">
                            <input type="file">
                        </td>
                    </tr>
                    <tr>
                        <th>금액 : </th>
                        <td><input type="number" required></td>
                    </tr>
                </table>
            </div>

                <div class="btn_bar">
                    <button type="reset">리셋하기// onclick 예정</button>
                    <button type="submit">등록하기// onclick 예정</button>
                </div>

                

            </div>

            <br><br>

        </div>



    </div>

    
    
    <%@ include file="../common/topBtn.jsp" %> <br>
    <%@ include file="../common/footerbar.jsp" %>


</body>
</html>