<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	String contextPath = request.getContextPath();
    
    	Member loginUser = (Member)session.getAttribute("loginUser");
    	
    	String alertMsg = (String)session.getAttribute("alertMsg");
    
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인 페이지</title>
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
            border: 1px solid red;
            width: 1300px;
            height: 650px;
            margin-top: 33px;
            margin-left: 170px;
        }
        
        .headerbar>h1>a{
        	text-decoration: none;
        	color:white;
        }
        
    </style>
</head>
<body>

   <div class="outer">
        <div class="headerbar">
                <h1 style="color: rgb(255, 118, 189); display: inline; margin-left: 760px;"><a href="<%= contextPath %>">PuppyFriends Manager</a></h1>
        </div>
    
        <div class="mid">
            <div class="sidebar">
                <ul style="list-style-type: none;">
                    <li><a href="">&nbsp;공지사항</a></li>
                    <br><br><br><br>
                    <li><a href="<%= contextPath %>/adminSelectMember.me?cpage=1">&nbsp;&nbsp;&nbsp;&nbsp;회원</a></li>
                    <br><br><br><br>
                    <li><a href="">&nbsp;&nbsp;&nbsp;&nbsp;수업</a></li>
                    <br><br><br><br>
                    <li><a href="">&nbsp;&nbsp;&nbsp;&nbsp;호텔</a></li>
                    <br><br><br><br>
                    <li><a href="<%= contextPath %>/list.pd?cpage=1">&nbsp;&nbsp;&nbsp;&nbsp;상품</a></li>
                    <br><br><br><br>
                    <li><a href="">&nbsp;&nbsp;&nbsp;게시판</a></li>
                </ul>
            </div>

            <div class="content">
                
            </div>
            
        </div>
        
        
    </div>


</body>
</html>