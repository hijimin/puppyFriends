<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   String contextPath = request.getContextPath();

   Member loginUser = (Member)session.getAttribute("loginUser");
   
   String alertMsg = (String)session.getAttribute("alertMsg");

  
   List<Map<String, Object>> topClickedMenus = new ArrayList<>();
   topClickedMenus.add(Map.of("menu", "공지사항", "clicks", 0));
   topClickedMenus.add(Map.of("menu", "회원", "clicks", 0));
   topClickedMenus.add(Map.of("menu", "채팅", "clicks", 0));
   topClickedMenus.add(Map.of("menu", "반려견정보", "clicks", 0));
   topClickedMenus.add(Map.of("menu", "상품", "clicks", 0));


   List<String> menuNames = new ArrayList<>();
   List<Integer> clickCounts = new ArrayList<>();
   for (Map<String, Object> menuData : topClickedMenus) {
       menuNames.add((String) menuData.get("menu"));
       clickCounts.add((Integer) menuData.get("clicks"));
   }


   String menuNamesJson = new Gson().toJson(menuNames);
   String clickCountsJson = new Gson().toJson(clickCounts);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인 페이지</title>

   <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>

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
        }

        .sidebar{
            width: 200px;
            height: 800px;
            background-color: rgb(255, 222, 239);
            color: white;
            box-sizing: border-box;
            padding-top: 70px;
        }

        .sidebar ul{
            padding-left: 0px;
            text-align:center;
            margin-top: 10px;
        }

        .sidebar li{        
            color: rgb(255, 118, 189);
            font-size: 20px;
            text-align:center;
            list-style-type: none;
            margin-right: 5px;
            font-size: 20px;
        }
        
        .sidebar li{        
           color: rgb(255, 118, 189);
            font-size: 20px;
            text-align:center;
            list-style-type: none;
            margin-right: 5px;
        }

        .sidebar a{
            color: rgb(255, 118, 189);
            font-size: 20px;
            text-decoration:none;
            text-align:center;
            display:inline-block;
            padding-left: 0px;
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
            width: 1300px;
            height: 650px;
            margin-top: 50px;
            margin-left: 50px;
            overflow: hidden; /* Prevents overflow of child elements */
        }
        
        .headerbar>h1>a{
            text-decoration: none;
            color:white;
        }
            
        .sidebar li ul {
        display: none;
          }

        .sidebar li:hover > ul {
            display: block;
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
            <li class="boardAdmin" onmouseover="updateChart(0)"><a href="#" >공지사항</a></li>
            <br><br><br>
            <li class="memberMana" onmouseover="updateChart(1)"><a href="<%= contextPath %>/adminSelectMember.me?cpage=1">회원</a>
                <ul class="memberData" style="color: white;">
                    <li><a href="<%= contextPath %>/adminSelectMember.me?cpage=1"  style="color: white;">회원조회</a></li><br>
                    <li><a href="<%= contextPath %>/adminRestoreMemberList.me?cpage=1"  style="color: white;">추방복구</a></li>
                </ul>
            </li> 
            <br><br><br><br>
            <li class="adminChat" onmouseover="updateChart(2)">채팅
                <ul class="chatMana" style="color: white;">
                    <li><a href="<%= contextPath %>/chatForm.ch"  style="color: white;">단체체팅</a></li><br>
                    <li><a href="<%= contextPath %>/memberChatList.me"  style="color: white;">회원채팅</a></li>
                </ul>
            </li>
            <br><br><br><br>
            <li class="adminDogInfo" onmouseover="updateChart(3)">반려견정보
                <ul class="dogInfo1">
                    <li><a href="<%= contextPath %>/dogforMain.do"  style="color: white;">출석부</a></li><br>
                    <li><a href="<%= contextPath %>/dogforMain.do#"  style="color: white;">갤러리</a></li>
                </ul>
            </li>
            <br><br><br><br>
            <li class="product-admin" onmouseover="updateChart(4)"><a href="<%= contextPath %>/list.pd?cpage=1">상품</a>
                <ul class="product-data"><a href="<%= contextPath %>/AdminSelectProductList.pr?cpage=1"  style="color: white;">상품리스트</a></ul>
            </li>
            
        </div>

        <div class="content">
            <canvas id="myChart" style="width: 100%; height: 100%;"></canvas>
            <script>
                const xValues = <%= menuNamesJson %>;
                let yValues = <%= clickCountsJson %>;
                const barColors = [
                    "#b91d47",
                    "#00aba9",
                    "#2b5797",
                    "#e8c3b9",
                    "#1e7145"
                ];

                let myChart = new Chart("myChart", {
                    type: "bar",
                    data: {
                        labels: xValues,
                        datasets: [{
                            backgroundColor: barColors,
                            data: yValues
                        }]
                    },
                    options: {
                        title: {
                            display: true,
                            text: "Top 5 Using Menus"
                        }
                    }
                });

                function updateChart(index) {
                    yValues[index] += Math.floor(Math.random() * 10);
                    myChart.data.datasets[0].data = yValues;
                    myChart.update();
                }
            </script>
        </div>
    </div>
</div>
</body>
</html>
