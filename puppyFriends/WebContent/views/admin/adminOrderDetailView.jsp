<%@page import="com.kh.order.model.vo.Order"%>
<%@page import="com.kh.member.model.vo.Dog"%>
<%@page import="com.kh.common.model.vo.AdminPageInfo"%>
<%@page import="com.kh.member.model.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.common.model.vo.AdminPageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    String contextPath = request.getContextPath();
    
	Member loginUser = (Member)session.getAttribute("loginUser");
	
	String alertMsg = (String)session.getAttribute("alertMsg");
    
    Order o = (Order)request.getAttribute("o");
	
   %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 주문 상세</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	
  <!-- jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
   <style>
        .outer{
            width: 1903px;
            height: 950px;
            margin: auto;
        }

        .headerbar{
            width: 100%;
            height: 150px;
            background-color: rgb(255, 222, 239);
            color: white;
            line-height: 150px; 
            /* 라인 하이트 바꾸면 puppyfriends 내려옴
               근데 지금 div 한줄에 h2랑 button이 같이 있어서
                div 노나주면 될듯~ */
        }

        .sidebar{
            width: 200px;
            height: 795px;
            background-color: rgb(255, 222, 239);
            color: white;
            box-sizing: border-box;
            padding-top: 70px;
        }

        .sidebar>ul{
            margin: 0;
            padding-left: 50px;
            padding-top: 70px;
          
        }

        .sidebar a{
            color: rgb(255, 118, 189);
            font-size: 20px;
        }

         @font-face {
            font-family: 'seolleimcool-SemiBold';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2312-1@1.1/seolleimcool-SemiBold.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }
   
        body * {
            font-family: 'seolleimcool-SemiBold';
        }
        
        body button{
            background-color: rgb(255, 167, 212);
            color : white;
            border : none;
            
        }

        .mid>*{
            float: left;
        }

        .headerbar h1{
            padding-top: 100px;
        }  

        .content{
            width: 1400px;
            height: 650px;
            margin-top: 100px;
        }

        .content a {
            margin-left: 1130px;
        }

        .list-area{
            font-size: 20px;
            margin-left: 200px;
        }

        .list-area td{
            margin-left: 320px;
            font-size: 20px;
        }

        thead th{
            border-bottom: 1px solid #f5e3e1;
        }
        

        .paging-area{
            margin-right: 150px;
        }

       .sidebar li ul {
        display: none;
      	 }

        .sidebar li:hover > ul {
            display: block;
        }
        
        .sidebar a{
            color: rgb(255, 118, 189);
            font-size: 20px;
            text-decoration:none;
            text-align:center;
            display:inline-block;
            padding-left: 0px;
        }
        
         .sidebar li{        
            color: rgb(255, 118, 189);
            font-size: 20px;
            text-align:center;
            list-style-type: none;
            margin-right: 5px;
            font-size: 20px;
        }
        
         .sidebar ul{
            padding-left: 0px;
            text-align:center;
            margin-top: 10px;

        }

        fieldset{
            margin-left: 250px;
        }
        
        legend{
            margin-left: 365px;
        }

        .dsa {
            color: red;
            text-align: center;
            font-size: 25px;
        }

       .dsf {
        margin-left: 20px;
       }

       textarea {
        border-radius: 10px;
       }

      .list-area th{
        text-align: center;
        background-color: #f5e3e1;
        border-bottom: 1px solid gray;
      }

      .list-area td{
        text-align: center;
        background-color: #f5e3e1;
      }

    
       
    </style>
</head>
<body>

   <div class="outer">
        <div class="headerbar">
                <h1 style="color: rgb(255, 118, 189); display: inline; margin-left: 700px;"><%= o.getOrderName() %>&nbsp;님의 주문정보</h1>
        </div>
    
        <div class="mid">
            <div class="sidebar">
            <li class="boardAdmin"><a href="#" >공지사항</a></li>
            <br><br><br>
            <li class="memberMana"><a href="<%= contextPath %>/adminSelectMember.me?cpage=1">회원</a>
                <ul class="memberData" style="color: white;">
                    <li><a href="<%= contextPath %>/adminSelectMember.me?cpage=1"  style="color: white;">회원조회</a></li><br>
                    <li><a href="<%= contextPath %>/adminRestoreMemberList.me?cpage=1"  style="color: white;">추방복구</a></li>
                </ul>
            </li> 
            <br><br><br><br>
            <li class="adminChat">채팅
                <ul class="chatMana" style="color: white;">
                    <li><a href="<%= contextPath %>/chatForm.ch"  style="color: white;">단체체팅</a></li><br>
                    <li><a href="<%= contextPath %>/memberChatList.me"  style="color: white;">회원채팅</a></li>
                </ul>
            </li>
            <br><br><br><br>
            <li class="adminDogInfo">반려견정보
                <ul class="dogInfo1">
                    <li><a href="<%= contextPath %>/dogforMain.do"  style="color: white;">출석부</a></li><br>
                    <li><a href="<%= contextPath %>/dogforMain.do#"  style="color: white;">갤러리</a></li>
                </ul>
            </li>
            <br><br><br><br>
            <li class="product-admin"><a href="<%= contextPath %>/list.pd?cpage=1">상품</a>
                <ul class="product-data"><a href="<%= contextPath %>/list.pd?cpage=1"  style="color: white;">상품리스트</a></ul>
            	<ul class="adminOrder-data"><a href="<%= contextPath %>/AdminSelectOrder.od?cpage=1" style="color: white">주문확인</a></ul>
                <ul class="adminDelivery"><a href="<%= contextPath %>/AdminSelectDelivery.de?cpage=1" style="color: white;">배송완료상품</a></ul>
            </li>
            <br><br><br><br>
            <li class="reservation" onmouseover="updateChart(5)">예약
            <ul class="classReservation"><a href="<%= contextPath %>/AdminSelectClass.rc?cpage=1" style="color: white;">수업예약</a></ul>
            <ul class="hotelReservation"><a href="<%= contextPath %>/AdminSelectReservation.re?cpage=1" style="color: white;">호텔예약</a></ul>
            </li>
        </div>



            <div class="content">
                <a href="<%= contextPath %>/AdminSelectOrder.od?cpage=1" class="btn btn-sm btn-secondary" style="background-color:#f5e3e1; color: gray; border: none;">목록으로</a>
                <br>
                <table class="list-area" align="center">
                      <br>
                       <thead align="center">
                        <tr>
                            <th width="50" style="border-top-left-radius: 10px;">주문번호</th>
                            <th width="50">회원번호</th>
                            <th width="50">상품번호</th>
                            <th width="100">받는사람</th>
                            <th width="200">주소</th>
                            <th width="200">전화번호</th>
                            <th width="200">주문날짜</th>
                            <th width="50">상품수량</th>
                            <th width="50" style="border-top-right-radius: 10px;">결제번호</th>
                        </tr>
                        </thead>
                        
                       <tbody align="center" style="margin-top: 50px;">
                        <tr>
                        <td id="d1" style="border-bottom-left-radius: 10px;"><%= o.getOrderNo() %></td>                 
                        <td><%= o.getOrderUser() %></td> 
                        <td><%= o.getProductNo() %></td> 
                        <td><%= o.getOrderName() %></td>
                        <td><%= o.getOrderAddress() %></td>
                        <td><%= o.getOrderPhone() %></td>
                        <td><%= o.getOrderDate() %></td>
                        <td><%= o.getOrderCount() %></td>
                        <td id="d2" style="border-bottom-right-radius: 10px;"><%= o.getPaymentNo() %></td>
                        </tr>
                    </tbody>                 	
                </table>
                <br><br>
                <fieldset>
                <legend>요청사항</legend>                  
                    <% if(o.getOrderReq() == null) { %>
                    <textarea class="dsa" cols="60" rows="1" style="resize: none;" readonly>특이사항 미입력</textarea>
                   <% } else { %>
                   <textarea class="dsf" cols="90" rows="15" style="resize: none;" readonly></textarea>
                   <% } %>
                </fieldset>
            </div>
            
        </div>
        
        
    </div>

</body>
</html>

</body>
</html>