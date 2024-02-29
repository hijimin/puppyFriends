<%@page import="com.kh.common.model.vo.PageInfo"%>
<%@page import="com.kh.common.model.vo.Image"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	ArrayList<Image> list = (ArrayList<Image>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		width: 1903px;
		margin: auto;
		margin-top: 50px;
		margin-bottom: 50px;

	}
	#img-area{
		margin-top: 50px;
		width: 1500px;
		height: auto;
		margin: auto;
		padding-left: 130px;
		margin-bottom: 50px;
	}
	.img{
		width: 350px;
		height: 250px;
		margin: 30px;
		display: inline-block;
		margin-top: 50px;
	}
	.img *{
		width: 100%;
	}
	.img-1{
		height: 220px;
	}
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>

		<div class="outer">

			<h1 align="center">강아지 갤러리</h1>

			<div align="right" style="width: 1500px;">
				<% if(loginUser != null){ %>
				<a href="<%= contextPath %>/galleryEnrollForm.ga">사진등록</a>
				<% } %>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" placeholder="강아지 이름을 입력해주세요">
				<button>검색</button>
			</div>

			<div id="img-area" >
				<% for(Image i : list){ %>
				<div class="img" align="center">
					<div class="img-1"><img src="<%= contextPath %>/<%= i.getTitleImg() %>" style="width: 100%; height: 100%;"></div>
					<div class="img-2"><br><%= i.getDogNo() %></div>
				</div>
				<% } %>
			</div>

			<div id="page" align="center">
				<% if(currentPage != 1){ %>
            <button onclick="location.href='<%= contextPath %>/gallery.ga?cpage=<%= currentPage-1 %>'"> &lt; </button>
            <% } %>
            <% for(int p=startPage; p<=endPage; p++){ %>
            	<% if( p == currentPage){ %>
            	<button disabled><%= p %></button>
            	<% }else{ %>
            	<button onclick="location.href='<%= contextPath%>/gallery.ga?cpage=<%= p %>'"><%= p %></button>
            	<% } %>
            <% } %>
            
            <% if(currentPage != maxPage){ %>
            <button onclick="location.href='<%= contextPath %>/gallery.ga?cpage=<%= currentPage+1 %>'"> &gt; </button>
            <% } %>
			</div>


		</div>



	<%@ include file="../common/footerbar.jsp" %>

</body>
</html>