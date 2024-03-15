<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.reservation.model.vo.Hotel"%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 


<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>

    <style>
      /* *{
       border: 1px solid red;
   }  */

      .outer {
        margin: auto;
        margin-top: 30px;

        width: 65%;
        height: 1000px;
      }
      .outer_name {
        width: 100%;
        height: 5%;
      }
      .hotelName {
        width: 100%;
        height: 10%;
      }
      .photo_text {
        width: 100%;
        height: 84%;
      }
      .photo {
        float: left;
        width: 50%;
        height: 100%;
      }
      .photo_pt {
        width: 100%;
        height: 70%;
      }
      .photoBar {
        width: 100%;
        height: 5%;
      }
      .photoBar > * {
        color: rgb(255, 222, 239);
        font-size: 30px;
        cursor: pointer;
      }
      .photoBar > *:hover {
        text-decoration: none;
        color: brown;
      }

      .photoImg1 {
        /* border: 2px solid rgb(255, 222, 239); */
        margin: 20% 16%;
        width: 50%;
        height: 300px;
      }
      .photoImg {
        margin: 20% 20%;
        width: 40%;
        height: auto;
      }
      .photoImg_input {
        transition: transform 0.3s ease-in-out;
        border: 2px solid rgb(255, 222, 239);
        width: 40px;
        height: 40px;
        display: inline-block;
      }
      .photoImg_input:hover {transform: scale(1.1);}

      .blank1 {
        left: 50%;
        width: 2%;
        height: 100%;
        position: absolute;
      }

      .text {
        float: right;
        width: 48%;
        height: 100%;
      }
      .hotel_rv {
        height: 70%;
      }
      .hotel_rv_intro {
        align: center;
        margin-top: 145px;
        border: 3px solid rgb(255, 222, 239);
      }
      .hotel_rv_intro th {
        width: 30%;
      }
      .hotel_rv_intro td {
        width: 70%;
      }

      .btn_bar {
        top: 40px;
        width: 100%;
        height: 10%;
        position: relative;
      }
      .btn_bar > button {
        display: inline-block;
        padding: 10px 15px;
        border: none;
        background-color: rgb(255, 222, 239);
        /* position: absolute; */
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
        프로그램 &gt; 호텔 예약 &gt; 호텔 등록 &nbsp; &nbsp;
      </div>
      <br /><br />
      <div class="hotelName">
        <h1 align="right" style="vertical-align: top">등록</h1>
      </div>

      <form action="<%= contextPath %>/insert.hrv" id="enroll-form"
      method="post" enctype="multipart/form-data">
      <input
        type="hidden"
        name="memberNo"
        value="<%= loginUser.getMemberNo() %>"
      />

      <div class="photo_text">
        <!-- 왼쪽 맵-->
        
        <div class="photo">
          <div class="photo_pt">
            <p>&lt;이미지 미리보기&gt;</p>
                           
            <div class="photoImg1">
              <img class="photoImg" id="previewTitleImg" style="width: 100%" src="#"/>
              <img class="photoImg" id="previewContentImg1" style="width: 100%" src="#" />
              <img class="photoImg" id="previewContentImg2" style="width: 100%" src="#" />
            </div>
            
            
          </div>
          <div class="photoBar" align="center">
            <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a class="next" onclick="plusSlides(1)">&#10095;</a>
          </div>
        </div>

        <script>
          var slideIndex = 1;
          showSlides(slideIndex);

          function plusSlides(n) {
            showSlides((slideIndex += n));
          }

          function showSlides(n) {
            var i;
            var slides = document.getElementsByClassName("photoImg");
            if (n > slides.length) {
              slideIndex = 1;
            }
            if (n < 1) {
              slideIndex = slides.length;
            }
            for (i = 0; i < slides.length; i++) {
              slides[i].style.display = "none";
            }
            slides[slideIndex - 1].style.display = "block";
          }
        </script>

        <div
          class="blank1"
          style="border-left: 2px solid rgb(255, 222, 239); height: 78%"
        ></div>
        <!-- 중간 줄임-->

        <div class="text" align="right">
          <!-- 오른쪽 맵 -->

          <div class="hotel_rv">
            <table class="hotel_rv_intro" border="1">
              <tr>
                <th>호텔명 :</th>
                <td>
                  <input
                    type="text"
                    name="hotelName"
                    class="title"
                    required
                    placeholder="호텔명을 입력해 주세요."
                    maxlength="10"
                  />
                </td>
              </tr>
              <tr>
                <th>소개글 :</th>
                <td>
                  <textarea
                    class="intro"
                    name="hotelText"
                    cols="50%"
                    rows="8%"
                    style="resize: none"
                    required
                    placeholder="내용을 입력해 주세요."
                    maxlength="100"
                  ></textarea>
                </td>
              </tr>
              <tr>
                <th>사이즈 :</th>
                <td>
                  <select class="select_text" name="hotelSize">
                    <option value="S">S</option>
                    <option value="M">M</option>
                    <option value="L">L</option>
                  </select>
                </td>
              </tr>
              <tr>
                <th>정원 :</th>
                <td>
                  <input
                    type="number"
                    name="dNumber"
                    required
                    placeholder="ex) 5마리"
                    min="1"
                    max="30"
                    style="width: 45%"
                  />
                </td>
              </tr>
              <tr>
                <th>일정 :</th>
                <td>
                  시작 :
                  <input
                    type="date"
                    name="hotelStart"
                    id="start-date"
                    style="margin-bottom: 3px"
                    required
                  /><br />
                  종료 : <input 
                  type="date" 
                  name="hotelEnd" 
                  id="end-date" 
                  required />
                </td>
              </tr>
              <tr>
                <th>사진등록 :</th>
                <td>
                  <img
                    class="photoImg_input"
                    id="titleImg"
                    onclick="chooseFile(1)"
                  />
                  <img
                    class="photoImg_input"
                    id="contentImg1"
                    onclick="chooseFile(2)"
                  />
                  <img
                    class="photoImg_input"
                    id="contentImg2"
                    onclick="chooseFile(3)"
                  />

                  <div id="file-area" style="display: none">
                    <input
                      type="file"
                      name="file1"
                      id="file1"
                      onchange="loadImg(this, 1);"
                      required
                    />
                    <input
                      type="file"
                      name="file2"
                      id="file2"
                      onchange="loadImg(this, 2);"
                    />
                    <input
                      type="file"
                      name="file3"
                      id="file3"
                      onchange="loadImg(this, 3);"
                    />
                  </div>
                </td>
              </tr>
              <tr>
                <th>금액 :</th>
                <td>
                  <input
                    type="text"
                    name="reservationPrice"
                    required
                    placeholder="금액 입력"
                    style="width: 45%"
                    id="amountInput"
                    oninput="formatInput(this)"
                  />
                </td>
              </tr>
            </table>
          </div>
          
          <script>
          // 금액 : 1,000 표시되게 하는
			function formatInput(inputElement) {
			  // 숫자 이외의 문자를 제거
			  let value = inputElement.value.replace(/\D/g, '');
			  // 천 단위 구분 기호 추가
			  value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			  inputElement.value = value;
			}
			</script>

          <script>
            function chooseFile(num) {
              $("#file" + num).click();
            }
            function loadImg(inputFile, num) {
              if (inputFile.files.length == 1) {
                // 파일이 선택된 경우 => 파일 읽어들여 미리보기

                const reader = new FileReader();
                // 파일을 읽어들일 수 있는 FileReader 객체 생성
                reader.readAsDataURL(inputFile.files[0]);
                // 파일을 읽어들이는 순간 해당 이 파일만의 고유한 url 부여

                // 읽기 완료 시 실행 함수, reader.onlead : 읽어들이기 완료
                reader.onload = function (e) {
                  // e.target.result => 읽어들인 파일의 고유한 url이 담김
                  switch (num) {
                    case 1:
                      $("#titleImg").attr("src", e.target.result);
                      $("#previewTitleImg").attr("src", e.target.result); // 미리보기 이미지 업데이트
                      break;
                    case 2:
                      $("#contentImg1").attr("src", e.target.result);
                      $("#previewContentImg1").attr("src", e.target.result);
                      
                      break;
                    case 3:
                      $("#contentImg2").attr("src", e.target.result);
                      $("#previewContentImg2").attr("src", e.target.result);
                      break;
                  }
                }
              } else {
                // 선택 파일 취소 시 미리보기도 취소
                switch (num) {
                  case 1:
                    $("#titleImg").attr("src", null);
                    $("#previewTitleImg").attr("src", null);
                    break;
                  case 2:
                    $("#contentImg1").attr("src", null);
                    $("#previewContentImg1").attr("src", null);
                    break;
                  case 3:
                    $("#contentImg2").attr("src", null);
                    $("#previewContentImg2").attr("src", null);
                    break;
                }
              }
            }
          </script>

          <div class="btn_bar">
            <button type="reset">리셋하기</button>
            <button type="submit">등록하기</button>
          </div>
        </div>

        <br /><br />
      </div>
    </form>
    </div>

    <%@ include file="../common/topBtn.jsp" %> <br />
    <%@ include file="../common/footerbar.jsp" %>
  </body>
</html>
