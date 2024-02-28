<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		margin: auto;
		margin-top: 50px;
		width: 600px;
	}
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>

	<div class="outer">

		<form action="insert.at" method="get">

		회원번호 : <input type="text" name="userNo"> <br><br>

		날짜 : <input type="date" name="date"> <br><br>

		출석여부 : 
		<input type="radio" id="Y" name="status" value="Y"> 
        <label for="Y">출석</label>
        <input type="radio" id="N" name="status" value="N"> 
        <label for="N">결석</label>
		<br><br>

		<button type="submit">등록하기</button>
		</form>

	</div>

	<%@ include file="../common/footerbar.jsp" %>

	<script>
		$(function(){

			$("button").click(function(){


			})

		})
	</script>



</body>
</html>