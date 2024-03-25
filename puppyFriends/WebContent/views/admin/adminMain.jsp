<%@page import="com.kh.product.model.vo.Product"%>
<%@page import="com.google.gson.reflect.TypeToken"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Base64"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="javax.servlet.http.Cookie"%>

<%
String contextPath = request.getContextPath();

Member loginUser = (Member)session.getAttribute("loginUser");

String alertMsg = (String)session.getAttribute("alertMsg");

int yResult = (int)request.getAttribute("yResult"); 
int nResult = (int)request.getAttribute("nResult");
ArrayList<Product> apList = (ArrayList<Product>)request.getAttribute("apList");


List<Map<String, Object>> topClickedMenus = new ArrayList<>();
topClickedMenus.add(Map.of("menu", "공지사항", "clicks", 0));
topClickedMenus.add(Map.of("menu", "회원", "clicks", 0));
topClickedMenus.add(Map.of("menu", "채팅", "clicks", 0));
topClickedMenus.add(Map.of("menu", "반려견정보", "clicks", 0));
topClickedMenus.add(Map.of("menu", "상품", "clicks", 0));
topClickedMenus.add(Map.of("menu", "예약", "clicks", 0));


List<String> menuNames = new ArrayList<>();
List<Integer> clickCounts = new ArrayList<>();
for (Map<String, Object> menuData : topClickedMenus) {
    menuNames.add((String) menuData.get("menu"));
    clickCounts.add((Integer) menuData.get("clicks"));
}


String menuNamesJson = new Gson().toJson(menuNames);
String clickCountsJson = new Gson().toJson(clickCounts);


// Retrieve graph data from cookie
 String graphDataCookieValue = "";
 Cookie[] cookies = request.getCookies();
 if (cookies != null) {
     for (Cookie cookie : cookies) {
         if (cookie.getName().equals("graphData")) {
             graphDataCookieValue = cookie.getValue();
             break;
         }
     }
 }

 // Check if graph data exists in the cookie, otherwise initialize with default values
 List<Map<String, Object>> graphData = new ArrayList<>();
 if (!graphDataCookieValue.isEmpty()) {
     // Decode the data and convert it back to graph data format
     byte[] decodedBytes = Base64.getDecoder().decode(graphDataCookieValue);
     String decodedString = new String(decodedBytes);
     graphData = new Gson().fromJson(decodedString, new TypeToken<List<Map<String, Object>>>() {}.getType());
 } else {
     // Set default values if no data is found in the cookie
     graphData.add(Map.of("menu", "공지사항", "clicks", 0));
     graphData.add(Map.of("menu", "회원", "clicks", 0));
     graphData.add(Map.of("menu", "채팅", "clicks", 0));
     graphData.add(Map.of("menu", "반려견정보", "clicks", 0));
     graphData.add(Map.of("menu", "상품", "clicks", 0));
 }

 // Set expiration time for resetting the graph data after 24 hours
 Calendar calendar = Calendar.getInstance();
 calendar.add(Calendar.HOUR_OF_DAY, 24);
 Date expirationTime = calendar.getTime();
 String expirationString = expirationTime.toString();
 Cookie expirationCookie = new Cookie("resetGraph", "true");
 expirationCookie.setMaxAge(60 * 60 * 24); // 24 hours
 expirationCookie.setPath("/");
 response.addCookie(expirationCookie);

 // Convert graph data to JSON and store in the cookie
 String graphDataJson = new Gson().toJson(graphData);
 String encodedGraphData = Base64.getEncoder().encodeToString(graphDataJson.getBytes());
 Cookie graphDataCookie = new Cookie("graphData", encodedGraphData);
 graphDataCookie.setMaxAge(60 * 60 * 24); // 24 hours
 graphDataCookie.setPath("/");
 response.addCookie(graphDataCookie);
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

        .content1{
            width: 710px;
            height: 730px;
            margin-top: 40px;
            margin-left: 100px;
            overflow: hidden;
        }

        .content2{   
            width: 720px;
            height: 730px;
            margin-top: 40px;
            overflow: hidden;
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
        
        .c1{
           border:1px solid gray;
           width:700px;
           height:310px;
           border-radius: 10px;
        }
        
        .c2{
           border:1px solid gray;
            width: 700px;
            height: 405px;
            margin-top: 10px;
            border-radius: 10px;
            color: gray;
        }

       .c3 {
        border: 1px solid gray;
        width: 680px;
        height: 727px;
        border-radius: 10px;
        color: gray;
        float: right;
        font-size: 25px;
        word-spacing:30px;
        padding-right: 35px;
       }

       .c3 table{
        margin: 0 auto;
        width: 700px;    
       }
        
        a {
           color:gray;
           text-decoration-line: none;
        }
        
        .ynm{
            width: 100%;
            height: 100%;
            text-align: center;
            font-size: 30px;
        }

        .ynm ul{
            padding-left: 0%;
            padding-top: 10px;
        }

        .ynm li{
            list-style-type: none;
        }
                      
       #nmm{
        color: red;
       }

       #ymm {
        color: skyblue;
       }

       .ynm hr{
        margin-top: 0px;
        margin-bottom: 5px;
       }

       #poomjul {
        color: red;
       }

       

    </style>
</head>
<body>

   <div class="outer">
        <div class="headerbar">
                <h1 style="color: rgb(255, 118, 189); display: inline; margin-left: 760px;"><a href="<%= contextPath %>" style="font-size: 40px;">PuppyFriends Manager</a></h1>
        </div>
    
    <div class="mid">
        <div class="sidebar">
            <li class="boardAdmin" onmouseover="updateChart(0)"><a href="<%= contextPath %>/list.no?cpage=1" >공지사항</a></li>
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
                    <li><a href="<%= contextPath %>/enroll.at"  style="color: white;">출석부 등록</a></li><br>
                    <li><a href="<%= contextPath %>/dogforMain.do"  style="color: white;">갤러리</a></li>
                </ul>
            </li>
            <br><br><br><br>
            <li class="product-admin" onmouseover="updateChart(4)"><a href="<%= contextPath %>/list.pd?cpage=1">상품</a>
                <ul class="product-data"><a href="<%= contextPath %>/AdminSelectProductList.pr?cpage=1"  style="color: white;">상품리스트</a></ul>
                <ul class="adminOrder-data"><a href="<%= contextPath %>/AdminSelectOrder.od?cpage=1" style="color: white;">주문확인</a></ul>
            	<ul class="adminDelivery"><a href="<%= contextPath %>/AdminSelectDelivery.de?cpage=1" style="color: white;">배송완료상품</a></ul>
            </li>
            <br><br><br><br>
            <li class="reservation" onmouseover="updateChart(5)">예약
            <ul class="classReservation"><a href="<%= contextPath %>/AdminSelectClass.rc?cpage=1" style="color: white;">수업예약</a></ul>
            <ul class="hotelReservation"><a href="<%= contextPath %>/AdminSelectReservation.re?cpage=1" style="color: white;">호텔예약</a></ul>
            </li>
            
        </div>

        <div class="content1">
           <div class="c1">
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
                <div class="c2">
                        <div class="ynm">
                            <ul>
                                <li><a href="adminSelectMember.me?cpage=1">이용가능 회원</a></li>
                                <br>                 
                                <li id="ymm"><%= yResult %></li>
                                <br><hr><br>
                                <li><a href="adminRestoreMemberList.me?cpage=1">정지회원</a></li>
                                <br>
                            <li id="nmm"><%= nResult %></li>                    
                            </ul>                  
                        </div>
                </div>
            </div><!-- .content -->
            <div class="content2">
                <div class="c3"> 
                 <table> 
                    <thead align="center">
                    <tr>
                        <th width="150">상품번호</th>
                        <th width="150">상품명</th>
                        <th width="150">재고</th>
                        <th width="150">업로드일자</th>
                    </tr>
                    </thead>
                    <tbody align="center">   
            	<% for(Product p : apList) { %>
                    <tr style="margin-top: 20px;">
                        <td><%= p.getProductNo() %></td>
                        <td> <%= p.getProductName() %></td>
                        <td id="poomjul"><% if(p.getStock() == 0) { %>품절<% } %></td>
                        <td><%= p.getProductUpdate() %></td>
                    </tr>                                          
                <% } %> 
                 </tbody>
                 <br>
                </div>  
            </table>
            </div>
</div>
</body>
</html>
