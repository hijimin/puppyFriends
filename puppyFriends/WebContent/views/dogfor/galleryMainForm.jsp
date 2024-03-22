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
		margin-top: 0px;
		margin-bottom: 50px;

	}
	#img-area{
		margin-top: 50px;
		width: 1600px;
		height: auto;
		margin: auto;
		padding-left: 130px;
		margin-bottom: 30px;
	}
	.img{
		width: 400px;
		height: 350px;
		margin: 10px;
		display: inline-block;
		margin-top: 20px;
	}
	.img *{
		width: 100%;
	}
	.img-1{
		height: 300px;
		background-color: rgb(247,247,247);
		padding-top: 40px;
	}
	.img-2{
		padding-top: 5px;
		font-size: 20px;
	}
	.modal-content{
		width: 600px; 
		height: 600px; 
		border-radius: 3%; 
		padding: 10px;
	}
	.modal-body2{
		overflow-y: auto;
		margin-top: 20px;
	}
	.modal-footer{
		margin-top: 25px;
	}
	#img-area .img:hover{
		cursor: pointer;
		margin-top: -2px;
		transform: translateY(-5px);
		transform: scale(1.1);
	}
	#glasses:hover{
		cursor: pointer;
	}
	#page-img button{
		width: 30px;
		height: 33px;
	}
	.modal-body1>div{
		width: 382px !important;
		height: 322px !important;
	}
	.modal-body1>div img{
		width: 360px !important;
		height: 300px !important;
	}
	#gallery-title:hover{
		cursor: pointer;
	}
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>

		<div class="outer">

			<h1 align="center" onclick="reload();" id="gallery-title">강아지 갤러리</h1>
			<% if(loginUser != null && loginUser.getMemberId().equals("ADMIN")){ %>
			<a href="<%= contextPath %>/galleryEnrollForm.ga" style="padding-left: 1450px; text-decoration: none;">사진등록</a>
			<br><br>
			<% } %>

			<script>
				function reload(){
					location.reload();
				}
			</script>
			
			<div style="width: 1630px; padding-left: 1230px; display: flex;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" id="search" placeholder="강아지 이름을 입력해주세요" onkeyup="if(event.keyCode==13) search();" style="flex: 0.7; margin-top: 8px; height: 40px !important;">&nbsp;
				<img src="resources/upfiles/2024032017062027950.jpg" id="glasses" style="height: 50px; width: 50px;" onclick="search();">
				<br><br>
			</div>

			<script>
				function search(){
					$.ajax({
						url:"search.ga",
						data:{
							name: $("#search").val(),
						},
						success:function(result){
							let value = "";
							for(let i=0; i<result.length; i++){
								value += "<div class='img' align='center'>" +
							            "<div class='img-1'>" +
										"<div style='height: 85%; width: 80%; border: 7px solid black; filter: drop-shadow(5px 5px 5px #494949)'>" +
										"<div style='height: 100%; width: 100%; border: 4px solid white;'>" +		
							            "<img src='" + result[i].filePath + "' style='width: 100%; height: 100%;'>" +
							            "</div>" +
							            "</div>" +
							            "</div>" +
							            "<div class='img-2'>" +
							            result[i].dogNo +
							            "</div>" +
										"<div class='img-3' style='display: none;'>" +
										result[i].content +
							            "</div>" +
							            "</div>";
							}
							
							$("#img-area").html(value);
						}


					})
				}
			</script>

			<div id="img-area" >
				<% for(Image i : list){ %>
				<div class="img" align="center">
					<div class="img-1"><div style="height: 85%; width: 80%; border: 7px solid black; filter: drop-shadow(5px 5px 5px #494949)"><div style="height: 100%; width: 100%; border: 4px solid white;"><img src="<%= contextPath %>/<%= i.getTitleImg() %>" style="width: 100%; height: 100%;"></div></div></div>
					<div class="img-2"><%= i.getDogNo() %></div>
					<div class="img-3" style="display: none;"><%= i.getContent() %></div>
					<div class="img-4" style="display: none;"><%= i.getFileNo() %></div>
				</div>
				<% } %>
			</div>

			<div id="page-img" align="center">
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
		
				<!-- Button to Open the Modal -->
		<button type="button" id="modal" style="display: none;"  class="btn btn-primary" data-toggle="modal" data-target="#myModal">
		</button>
		
		<script>
			$(document).on("click", "#img-area .img", function() {
				$(".modal-title").html($(this).children().eq(1).text());
				$(".modal-body1").html($(this).children().eq(0).html());
				$(".modal-body2").html($(this).children().eq(2).html());
				$(".modal-body3").html($(this).children().eq(3).html());
				$("#modal").click();
			});
		</script>
		
		<!-- The Modal -->
		<div class="modal" id="myModal" style="z-index: 9999;">
		  <div class="modal-dialog">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header" style="height: 11%; width: 100%; ">
		        <h3 class="modal-title" align="right" style="width: 60%;" ></h3>
		        <button type="button" class="close" data-dismiss="modal" style="margin-left: 0;">&times;</button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body1" style="height: 70%; width: 100%; margin-top: 30px; margin-left: 50px;">
		        <!-- 사진 -->
		      </div>

			  <div class="modal-body2" style="height: 18%; width: 100%; margin-top: 0px; border: 1px solid #dee2e6" align="center">
		        <!-- 내용 -->
		      </div>
			  <div class="modal-body3" style="display: none;"></div>
		
		      <!-- Modal footer -->
		      <div class="modal-footer" style="height: 8%; width: 100%; margin-top: 0px; border: 0px;">
				<% if(loginUser != null && loginUser.getMemberId().equals("ADMIN")){ %>
		        <button type="button" class="btn btn-sm btn-danger" data-dismiss="modal" onclick="deleteGallery();">Delete</button>
		        <% } %>
		        <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">Close</button>
		      </div>
		
		    </div>
		  </div>
		</div>
		
		<script>
			function deleteGallery(){

				var imgNum = $(".modal-body3").html();

				var Gdelete = confirm("삭제하시겠습니까?");
				
				if(Gdelete){
					location.href="delete.ga?pnum=" + imgNum;
				}

			}
		</script>

	<%@ include file="../chatting/chatting.jsp" %>
		
	<%@ include file="../common/topBtn.jsp" %>

	<%@ include file="../common/footerbar.jsp" %>

</body>
</html>