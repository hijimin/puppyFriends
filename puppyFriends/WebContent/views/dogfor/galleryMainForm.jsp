<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
	}
	#img-area td{
		padding: 30px;
	}
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>

		<div class="outer">

		<h1 align="center">강아지 갤러리</h1>

		<table border="1" align="center" id="img-area">
			<tr height="200px">
				<td width="300px">
					<img src="../../resources/image/city1.PNG"> dd
				</td>
				<td width="300px"><img src="../../resources/image/city1.PNG"></td>
				<td width="300px"><img src="../../resources/image/city1.PNG"></td>
			</tr>
			<tr height="200px">
				<td width="300px"><img src="../../resources/image/city1.PNG"></td>
				<td width="300px"><img src="../../resources/image/city1.PNG"></td>
				<td width="300px"><img src="../../resources/image/city1.PNG"></td>
			</tr>
		</table>

		</div>








	 <a href="<%= contextPath %>/galleryEnrollForm.ga">사진등록</a>






	<%@ include file="../common/footerbar.jsp" %>

</body>
</html>