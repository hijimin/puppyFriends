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
	}
	.outer>div{
		width: 50%;
		height: 800px;
		border: 1px solid red;
		float: left;
	}
	#table{
		width: 100%;
		height: 90%;
		overflow-y: auto;
	}
	#month_content{
		width: 100%;
		height: 10%;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>


	<div class="outer">


		<div id="content1">
			<div id="month_content" align="center">
				<br>
				<button><<</button>
				<span id="year">2024</span>년 <span id="month">3</span>월
				<button>>></button>
			</div>
			<table id="table" border="1">
				<tr>
					<th colspan="2">유저아이디</th>
				</tr>
				<tr>
					<td width="550">날짜</td>
					<td>출결여부</td>
				</tr>
				<tr>
					<td>날짜</td>
					<td>출결여부</td>
				</tr>
				<tr>
					<td>날짜</td>
					<td>출결여부</td>
				</tr>
				<tr>
					<td>날짜</td>
					<td>출결여부</td>
				</tr>
				<tr>
					<td>날짜</td>
					<td>출결여부</td>
				</tr>
				<tr>
					<td>날짜</td>
					<td>출결여부</td>
				</tr>
				<tr>
					<td>날짜</td>
					<td>출결여부</td>
				</tr>
			</table>
		</div>
		<div id="content2">
			<form action="insert.at" method="post">

				회원번호 : <select id="select" name="userNo">
								<option value="X" selected>선택</option>
									<% for(Member m : list){ %>
									<option value="<%= m.getMemberNo() %>">아이디 : <%= m.getMemberId() %>, 이름 : <%= m.getMemberName() %></option>
									<% } %>
							</select> <br><br>
	
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
				console.log(result)
				let user = ""
				let value = "";
                for(let i=0; i<result.length; i++){
                	
                		 user  = "<tr>"
                			   + "<th colspan='2' height='10%'>"
                		       + result[i].userNo
                		       + "</th>"
                		       + "</tr>"
        				value += "<tr>"
    					       + "<td width='550' height='10%'>"
    					       + result[i].date
    					       + "</td>"
    					       + "<td>"
    					       + result[i].status
    					       + "</td>"
    				           + "</tr>"
                	
                }
                $("#table").html(user + value);
				
			},
			error:function(){
				console.log("실패")
			}


		})



	}


	</script>
	



</body>
</html>