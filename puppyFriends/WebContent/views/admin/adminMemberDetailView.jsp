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
    
    Dog d = (Dog)request.getAttribute("d"); 
	
   %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 회원 상세</title>
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
            margin-top: 20px;
            margin-left: 130px;
        }

        .content a {
            margin-left: 1130px;
        }

        .list-area{
            font-size: 20px;
        }

        h1{
            margin-left: 500px;
        }

        .list-area td{
            margin-left: 320px;
            font-size: 20px;
        }

        th, td{
            border: 1px solid gray;
        }

        .paging-area{
            margin-right: 150px;
        }



        .content>ul>li{
            font-size: 22px;
            list-style-type: circle;
            margin-left: 200px;
            
        }

       
        
       
    </style>
</head>
<body>

   <div class="outer">
        <div class="headerbar">
                <h1 style="color: rgb(255, 118, 189); display: inline; margin-left: 760px;">회원번호&nbsp; : &nbsp;<%= d.getMemberNo() %>&nbsp;번님의 반려견 상세정보</h1>
        </div>
    
        <div class="mid">
            <div class="sidebar">
                <ul style="list-style-type: none;">
                    <li><a href="">&nbsp;공지사항</a></li>
                    <br><br><br>
                    <li><a href="views/admin/adminMain.jsp">&nbsp;&nbsp;&nbsp;&nbsp;회원</a></li>
                    <br><br><br><br>
                    <li><a href="">&nbsp;&nbsp;&nbsp;&nbsp;수업</a></li>
                    <br><br><br><br>
                    <li><a href="">&nbsp;&nbsp;&nbsp;&nbsp;호텔</a></li>
                    <br><br><br><br>
                    <li><a href="">&nbsp;&nbsp;&nbsp;&nbsp;상품</a></li>
                    <br><br><br><br>
                    <li><a href="">&nbsp;&nbsp;&nbsp;게시판</a></li>
                </ul>
            </div>


            <div class="content">
                <table class="list-area" align="center"  style="border: 1px solid gray;">
                    <br><br>
                    <ul>
                        <a href="<%= contextPath %>/adminSelectMember.me?cpage=1" class="btn btn-sm btn-secondary" style="background-color:rgb(255, 222, 239); color: rgb(255, 118, 189); border: none;">목록으로</a>
                        <li>반려견 식별번호&nbsp; : &nbsp;<%= d.getDogNo() %></li>
                        <br>
                        <li>반려견이름&nbsp; : &nbsp;<%= d.getDogName() %></li>
                        <br>
                        <li>견종&nbsp; : &nbsp;<%= d.getDogValue() %></li>
                        <br>
                        <li>반려견나이&nbsp; : &nbsp;<%= d.getDogAge() %></li>
                        <br>
                        <li>필수접종 여부&nbsp; : &nbsp;<%= d.getDogVaccine() %></li>
                        <br>
                        <li>특이사항 : </li>
                        <br>
                        <% if(d.getDogSignificant() == null) { %>
                        <li style="list-style-type: none;"><textarea id="dsf" cols="80" rows="10" style="resize: none;" readonly>특이사항 미입력</textarea></li>
                   		<% } else { %>
                   		<li style="list-style-type: none;"><textarea id="dsf" cols="80" rows="10" style="resize: none;" readonly><%= d.getDogSignificant() %></textarea></li>
                   		<% } %>

                           
                    </ul> 	
                </table>

            </div>
            
        </div>
        
        
    </div>

</body>
</html>

</body>
</html>