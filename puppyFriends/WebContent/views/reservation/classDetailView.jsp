<%@page import="com.kh.reservation.model.vo.Reservation"%>
<%@page import="com.kh.reservation.model.vo.KinderClass"%>
<%@page import="com.kh.common.model.vo.Image"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.reservation.model.vo.Hotel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    KinderClass c = (KinderClass)request.getAttribute("c");
    int classrvCount = (int)request.getAttribute("classrvCount");
    ArrayList<Image> img = (ArrayList<Image>)request.getAttribute("img");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
        /*
         *{
            border: 1px solid red;
        } 
        */
       
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
      
            display: flex;
      		flex-direction: column;
            justify-content: space-between; /* 내용물을 상단과 하단에 분리 */
        }
        
              
        #text_price {
	        border-top: 2px solid rgb(255, 222, 239);
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
        .btn_bar1>.C_back{
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
        .btn_bar1>.C_delete{
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
	<form id="detail-form" action="<%= contextPath %>/make.crv?cno=<%= c.getClassNo() %>&start=<%= c.getReservationStart() %>&end=<%= c.getReservationEnd() %>" method="post">
	<div class="outer">
 
        <div align="right" class="outer_name">
            프로그램 &gt; 유치원 예약 &gt; <%= c.getClassName() %> &nbsp; &nbsp;
        </div>
        <br><br>
        <div class="hotelName">
            <h1 align="right"> <%= c.getClassName() %> </h1>
        </div>
        <br>
        
        <div class="photo_text"> <!-- 왼쪽 맵-->
            <div class="photo">
                <div class="photo_pt">
                    <p align="center">&lt; 작성자 : <%= c.getMemberId() %> &gt;</p>
                    <div class="photoImg1">
                        <img class="photoImg" src="<%= contextPath %>/<%= img.get(0).getTitleImg() %>" style="width:100%">
                       <% for(int i = 1; i<img.size(); i++) { %>
                        <img class="photoImg" src="<%= contextPath %>/<%= img.get(i).getTitleImg() %>" style="width:100%">
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
                <div class="period">기간 : <%= c.getReservationStart() %> ~ <%= c.getReservationEnd() %> </div> <br><br>
                
                <input type="hidden" name="reservationStart" value="<%= c.getReservationStart() %>" >
                <input type="hidden" name="reservationEnd" value="<%= c.getReservationEnd() %>" >
                <input type="hidden" name="reservationPrice" value="<%= c.getReservationPrice() %>" >
                
                <div>( <%= c.getcCount() %> / <%= c.getdNumber() %> ) , <%= c.getClassSize() %> </div>
                <div class="introduce">
                    <tr>
                        <td>
                        <p style="text-align: left; padding: 10px;"><%= c.getClassText() %> </p>
                        </td>
                    </tr>
               		<div id="text_price">
                    	<p id="price" style="text-align: right; padding: 10px;"><%= c.getReservationPrice() %> 원 </p>
				    </div>  
				    <script>
				        document.addEventListener('DOMContentLoaded', function() {
				            var priceElement = document.getElementById('price');
				            var price = priceElement.innerText.replace(' 원', '');
				            price = parseInt(price, 10).toLocaleString();
				            priceElement.innerText = price + ' 원';
				        });
				    </script>
				</div>

                
                <div class="btn_bar" style="padding-bottom: 1%;">
                 <% if(loginUser != null && loginUser.getDogSize().equals(c.getClassSize())) { %>
                    <button type="submit" class="btn-open-modal" id="makeClassRv" >예약하기</button> 
                 <% } else { %>
                    <button type="button" class="btn-open-modal" disabled >예약하기</button> 
                 <% } %>
                </div>
                
                

                <div class="btn_bar1">
                	<a href="<%= contextPath %>/kinderClass.crv" class="C_back" style="padding-bottom: 1%;">뒤로가기</a> <br>
                </div>

				<% if(loginUser != null && loginUser.getMemberId().equals("ADMIN")) { %>
                <div class="btn_bar1">
                <a href="#" onclick="confirmDelete('<%= c.getClassNo() %>')" class="C_delete">삭제하기</a>
                </div>
                <% } %>
            </div>
            

			<script>
			// 삭제 alert
			function confirmDelete(classNo) {
			    var result = confirm("삭제하시겠습니까?");
			    
			    if (result) {
			        window.location.href = "<%= contextPath %>/delete.crv?num=" + classNo;
			    }else{
			    	alert("삭제가 취소되었습니다.");
			    }
			}
			
			
			 $("#makeClassRv").click(function() {
			        var confirmSubmit = confirm("유치원 예약을 하시겠습니까?");
			        var cno = $("#cno").val();
			        if (confirmSubmit) {
			            $(this).prop('disabled', true); // 고객 등록 정보 있으면 버튼 비활성화로 수정

			            // AJAX 대신 form 제출을 사용
			            $("#detail-form").submit();
			        } else {
			            alert("예약이 취소되었습니다.");
			        }
			    });
			      
			      
			   
			</script>

            <br><br>

        </div>
    </div>
  </form>
    
    <%@ include file="../common/topBtn.jsp" %> <br>
    <%@ include file="../common/footerbar.jsp" %>

</body>
</html>