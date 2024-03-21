<%@page import="com.kh.reservation.model.vo.Reservation"%>
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
        .btn_bar1>.H_back{
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
	<form id="detail-form" action="<%= contextPath %>/make.hrv?hno=<%= h.getHotelNo() %>" method="post">
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
                <div class="period">기간 : <%= h.getHotelStart() %> ~ <%= h.getHotelEnd() %> </div> <br><br>
                <div>( <%= hotelrvCount %> / <%= h.getdNumber() %>) , <%= h.getHotelSize() %> </div>
                <div class="introduce">
                    <tr>
                        <td>
                         <p style="text-align: left; padding: 10px;"><%= h.getHotelText() %></p>
                        </td>
                    </tr>
	                   <div id="text_price">
                    	<p id="price" style="text-align: right; padding: 10px;"><%= h.getReservationPrice() %> 원 </p>
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
                <input type="hidden" id="hno" value="<%= h.getHotelNo() %>">
                <% if(loginUser != null && loginUser.getDogSize().equals(h.getHotelSize())) { %>
                    <button type="submit" class="btn-open-modal" id="makehotelRv">예약하기</button> 
                <% } else { %>
                    <button type="button" class="btn-open-modal" disabled >예약하기</button> 
              	<% } %> 
                </div>

                <div class="btn_bar1" style="padding-bottom: 1%;">
                	<a href="<%= contextPath %>/hotel.hrv" class="H_back" style="padding-bottom: 1%;">뒤로가기</a> <br>
                </div>

				<% if(loginUser != null && loginUser.getMemberId().equals("ADMIN")) { %>
                <div class="btn_bar1">
                <a href="#" onclick="confirmDelete('<%= h.getHotelNo() %>')" class="H_delete">삭제하기</a>
                </div>
                <% } %>
            </div>



			<script>
			// 삭제 alert
			function confirmDelete(hotelNo) {
			    var result = confirm("삭제하시겠습니까?");
			    
			    if (result) {
			        window.location.href = "<%= contextPath %>/delete.hrv?num=" + hotelNo;
			    }else{
			    	alert("삭제가 취소되었습니다.");
			    }
			}
			
			$("#makehotelRv").click(function() {
			      var confirmSubmit = confirm("호텔 예약을 하시겠습니까?");
		    	  var hno = $("#hno").val();
			      if (confirmSubmit) {
					  				    	  
			    	  $(this).prop('disabled', true);
			    	  
			      } else{
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