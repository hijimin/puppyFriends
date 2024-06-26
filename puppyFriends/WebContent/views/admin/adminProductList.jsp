<%@page import="com.kh.product.model.vo.Product"%>
<%@page import="com.kh.common.model.vo.AdminPageInfo"%>
<%@page import="com.kh.member.model.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.common.model.vo.AdminPageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String contextPath = request.getContextPath();
Member loginUser = (Member) session.getAttribute("loginUser");
String alertMsg = (String) session.getAttribute("alertMsg");
ArrayList<Product> pList = (ArrayList<Product>) request.getAttribute("pList");
AdminPageInfo pi = (AdminPageInfo)request.getAttribute("pi");
int currentPage = pi.getCurrentPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();
int maxPage = pi.getMaxPage();
System.out.println(pi);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>상품조회</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />

<!-- jQuery library -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
.outer {
	width: 1903px;
	height: 950px;
	margin: auto;
}

.headerbar {
	width: 100%;
	height: 150px;
	background-color: rgb(255, 222, 239);
	color: white;
	line-height: 150px;
	/* 라인 하이트 바꾸면 puppyfriends 내려옴
               근데 지금 div 한줄에 h2랑 button이 같이 있어서
                div 노나주면 될듯~ */
}

.sidebar {
	width: 200px;
	height: 1010px;
	background-color: rgb(255, 222, 239);
	color: white;
	box-sizing: border-box;
	padding-top: 150px;
}

.sidebar>ul {
	margin: 0;
	padding-left: 50px;
	padding-top: 70px;
}

.sidebar a {
	color: rgb(255, 118, 189);
	font-size: 20px;
}

@font-face {
	font-family: "seolleimcool-SemiBold";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2312-1@1.1/seolleimcool-SemiBold.woff2")
		format("woff2");
	font-weight: normal;
	font-style: normal;
}

body * {
	font-family: "seolleimcool-SemiBold";
}

body button {
	background-color: rgb(255, 167, 212);
	color: white;
	border: none;
	background-color: #f5e3e1;
}

.mid>* {
	float: left;
}

.headerbar h1 {
	padding-top: 100px;
}

.content {
	width: 1400px;
	height: 650px;
	margin-top: 33px;
	margin-left: 130px;
}

.list-area {
	font-size: 20px;
}

h1 {
	margin-left: 560px;
}

.list-area td {
	margin-left: 320px;
	font-size: 20px;
}


.paging-area {
	margin-right: 150px;
}

.list-area>tbody>tr>#detailInfo:hover {
	cursor: pointer;
}

#productDeleteBtn {
	margin-left: 1278px;
	margin-bottom: 30px;
	border-radius: 5px;
	color: #ff2400;
}

.sidebar li ul {
	display: none;
}

.sidebar li:hover>ul {
	display: block;
}

.sidebar a {
	color: rgb(255, 118, 189);
	font-size: 20px;
	text-decoration: none;
	text-align: center;
	display: inline-block;
	padding-left: 0px;
}

.sidebar li {
	color: rgb(255, 118, 189);
	font-size: 20px;
	text-align: center;
	list-style-type: none;
	margin-right: 5px;
	font-size: 20px;
}

.sidebar li {
	color: rgb(255, 118, 189);
	font-size: 20px;
	text-align: center;
	list-style-type: none;
	margin-right: 5px;
	font-size: 20px;
}

.sidebar ul {
	padding-left: 0px;
	text-align: center;
	margin-top: 10px;
}

thead th {
        background-color: #f5e3e1;
        height: 40px;    
        color: gray;
        font-size: 20px;
      }
      
      tbody th{
        border-bottom : 1px solid #f5e3e1;
        border-right: 1px solid #f5e3e1;
        border-left: 1px solid #f5e3e1;
      }

      tbody td{
        border-bottom : 1px solid #f5e3e1;
        border-right: 1px solid #f5e3e1;
        border-left: 1px solid #f5e3e1;
      }

      #checkOp1{
        border-top-left-radius: 5px;
      }

      #checkOp2{
        border-top-right-radius: 5px;
      }

      .list-area{
        color: gray;
      }
      
      a {
      	text-decoration-line: none;
		color: white;
      }
      
</style>
</head>
<body>
	<div class="outer">
		<div class="headerbar">
			 <h1 style="display: inline; margin-left: 760px;"><a href="<%= contextPath %>/AdminMemberCount.me" style="color: white; text-decoration-line: none;">PuppyFriends Manager</a></h1>
		</div>

		<div class="mid">
			<div class="sidebar">
				<li class="boardAdmin"><a href="#">공지사항</a></li> <br /> <br /> <br />
				<li class="memberMana"><a
					href="<%=contextPath%>/adminSelectMember.me?cpage=1">회원</a>
					<ul class="memberData" style="color: white">
						<li><a href="<%=contextPath%>/adminSelectMember.me?cpage=1"
							style="color: white">회원조회</a></li>
						<br />
						<li><a
							href="<%=contextPath%>/adminRestoreMemberList.me?cpage=1"
							style="color: white">추방복구</a></li>
					</ul></li> <br /> <br /> <br /> <br />
				<li class="adminChat">채팅
					<ul class="chatMana" style="color: white">
						<li><a href="<%=contextPath%>/chatForm.ch"
							style="color: white">단체체팅</a></li>
						<br />
						<li><a href="<%=contextPath%>/memberChatList.me"
							style="color: white">회원채팅</a></li>
					</ul>
				</li> <br /> <br /> <br /> <br />
				<li class="adminDogInfo">반려견정보
					<ul class="dogInfo1">
						<li><a href="<%=contextPath%>/dogforMain.do"
							style="color: white">출석부</a></li>
						<br />
						<li><a href="<%=contextPath%>/dogforMain.do#"
							style="color: white">갤러리</a></li>
					</ul>
				</li> <br /> <br><br /> <br />
				<li class="product-admin"><a
					href="<%=contextPath%>/list.pd?cpage=1">상품</a>
					<ul class="product-data"><a href="#" style="color: white">상품리스트</a></ul>
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
				<table class="list-area" align="center">
					<br />
					<h1 style="color: gray;">Product</h1>
					<br />
					<br />
					<thead align="center">
						<tr>
							<th width="50" id="checkOp1">선택</th>
							<th width="150">상품번호</th>
							<th width="150">상품이름</th>
							<th width="150">상세정보</th>
							<th width="150">가격</th>
							<th width="150">재고수량</th>
							<th width="250">등록일</th>
							<th width="250" id="checkOp2">할인율</th>
						</tr>
					</thead>

					<tbody align="center">
						<form id="prouctDeleteForm" action="AdminProductDelete.pr">
							<%
							for (Product p : pList) {
							%>
							<tr>
								<th><input type="checkbox" value="<%=p.getProductNo()%>"
									method="post" onsubmit="return confirmDelete()"
									name="deleteProduct" /></th>
								<td id="detailInfo"><%=p.getProductNo()%></td>
								<td><%=p.getProductName()%></td>
								<td><%=p.getProductDesc()%></td>
								<td><%=p.getPrice()%></td>
								<%
								if (p.getStock() == 0) {
								%>
								<td style="color: red">품절</td>
								<%
								} else {
								%>
								<td><%=p.getStock()%></td>
								<%
								}
								%>
								<td><%=p.getProductUpdate()%></td>
								<td><%=p.getDiscount()%></td>
							</tr>
							<%
							}
							%>
						</form>
						<button type="submit" id="productDeleteBtn" onclick="productDelete()">상품삭제</button>
					</tbody>
				</table>

				<script>
					function productDelete() {
						var check = $("input[type=checkbox]").is(":checked") == true;
						if (!check) {
							// 아무것도 체크안함
							alert("삭제하실 상품을 선택 후 삭제버튼을 눌러주세요");
							return;
						}

						var result = confirm("해당 상품을 삭제 하시겠습니까?");
						if (result) {
							document.getElementById("prouctDeleteForm")
									.submit();
							alert("삭제 완료되었습니다!");
						} else {
							alert("취소 되었습니다.");
						}
					}
				</script>

				<br /> <br />

					<div class="paging-area" align="center">
                    <% if(currentPage != 1) { %>
                    <button onclick="location.href='<%= contextPath %>/AdminSelectProductList.pr?cpage=<%= currentPage - 1 %>'" style="background-color:#f5e3e1; border-radius: 5px;"> &lt; </button>
                    <% } %>
                    
                    <% for(int p=startPage; p<=endPage; p++) { %>
                        <% if(p == currentPage) { %>
                        <button style="background-color:#f5e3e1; border-radius: 5px;"><%= p %></button>
                        <% } else { %>
                        <button onclick="location.href='<%= contextPath %>/AdminSelectProductList.pr?cpage=<%= p %>'" style="background-color:#f5e3e1; border-radius: 5px;"><%= p %></button>
                        <% } %>
                    <% } %>
                    
                    <% if(currentPage != maxPage) { %>
                    <button onclick="location.href='<%= contextPath %>/AdminSelectProductList.pr?cpage=<%= currentPage + 1 %>'" style="background-color:#f5e3e1; border-radius: 5px;"> &gt; </button>
                    <% } %>
                </div>
				
				<br />
			</div>
		</div>
	</div>
</body>
</html>
</Product>
</Product>
