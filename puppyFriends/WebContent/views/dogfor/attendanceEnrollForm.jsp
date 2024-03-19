<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		margin: auto;
		margin-top: 50px;
		width: 1400px;
		height: 800px;
		border : 3px solid rgb(255, 222, 239);
	}
	.outer>div{
		width: 50%;
		height: 800px;
		float: left;
		padding: 10px;
	}
	.outer>#content2{
		border-left: 3px solid rgb(255, 222, 239);
	}
	#date_user{
		width: 100%;
		height: 10%;
		padding-top: 20px;
	}

	#month_content{
		width: 100%;
		height: 10%;
	}
	#date_status{
		width: 100%;
		height: 60px;
		padding: 20px;
	}
	#date_wrap{
		border-top: 1px solid gray;
		width: 100%;
		height: 80%;
		overflow-y: auto;
	}
	#date{
		width: 500px;
		height: 60px;
		padding: 15px;
		padding-left: 200px;
		padding-right: 200px;
		border-right: 1px solid gray;
		font-size: 20px;
	}
	#status{
		padding-left: 75px;
		font-size: 20px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>

	<script>
		function prev(){
			if($("#month").text() == 1){
				$("#year").text($("#year").text()-1);
				$("#month").text(12);
			}else{
				$("#month").text($("#month").text()-1)
			}
			selectList();
		}
		function next(){
			if($("#month").text() == 12){
				$("#year").text(Number($("#year").text())+1);
				$("#month").text(1);
			}else{
				$("#month").text(Number($("#month").text())+1);
			}
			selectList();
		}
	</script>


	<div class="outer">


		<div id="content1">
			<div id="month_content" align="center">
				<br>
				<button onclick="prev();"><<</button>
				<span id="year">2024</span>년 <span id="month">3</span>월
				<button onclick="next();">>></button>
			</div>
			<div id="date_user">

			</div>
			<div id="date_wrap">

			</div>
		</div>
		<div id="content2">
			

				회원번호 : <select id="select" name="userNo">
								<option value="X" selected>선택</option>
									<% for(Member m : list){ %>
									<option value="<%= m.getMemberNo() %>">아이디 : <%= m.getMemberId() %>, 이름 : <%= m.getMemberName() %></option>
									<% } %>
							</select> <br><br>
	
				날짜 : <input type="date" id="date1" name="date"> <br><br>
	
				출석여부 : 
				<input type="radio" id="Y" name="status" value="Y"> 
				<label for="Y">출석</label>
				<input type="radio" id="N" name="status" value="N"> 
				<label for="N">결석</label>
				<br><br>
	
				<button onclick="insertList();">등록하기</button>
			
		</div>

		
	</div>

	<script>
	$(function(){

		$("#select").change(function(){
			selectList();
		})


	})

	function selectList(){

		$.ajax({
			type:"post",
			url:"/puppy/select.at",
			data:{
				userNo:$("select[name=userNo] option:selected").val(),
				year:$("#year").html(),
				month:$("#month").html()
			},
			success:function(result){
			
				let user = ""
				let value = "";

				if(result.length === 0){
					$("#date_user").html("<tr>" + "<th colspan='2' height='60px'>" + "출결이 없습니다" + "</th>" + "</tr>");
					$("#date_wrap").html("");
				}else{

					for(let i=0; i<result.length; i++){
						
							user  = "<div>"
								+ "<h3 align='center'>"
								+ result[i].memberName
								+ "</h3>"
								+ "</div>"
							value += "<div id='date_status'>"
								+ "<span id='date'>"
								+ result[i].date
								+ "</span>"
								+ "<span id='status'>"
								+ result[i].status
								+ "</span>"
								+ "</div>"
								
						
					}
					$("#date_user").html(user);
					$("#date_wrap").html(value);
				}
				
			},
			error:function(){
				alert("등록 실패")
			}


		})



	}

	function insertList(){
		
		if($("select[name=userNo] option:selected").val() === 'X' || $("#date1").val() === "" || $("input[name='status']:checked").val() == null){
			alert("등록실패");
			$("#date1").val("");
			$("input[name='status']").prop("checked", false);
			return;
		}

		$.ajax({
			type:"post",
			url:"/puppy/insert.at",
			data:{
				userNo:$("select[name=userNo] option:selected").val(),
				date:$("#date1").val(),
				status:$("input[name='status']:checked").val()
			},
			success:function(result){
				$("#date1").val("");
				$("input[name='status']").prop("checked", false);
				selectList();
				if(result === 'update good'){
					alert("출석 변경 성공");
				}else{
					alert("출석 등록 성공");

				}
			},
			error:function(result){
				selectList();
			}
		})
		

	}

	</script>

	<%@ include file="../common/footerbar.jsp" %>


</body>
</html>