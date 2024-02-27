<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    .outer{
        border: 1px solid red;
        margin: auto;
        margin-top: 80px;
        width: 65%;
        height: 1000px;
    }
    .outer_name{
        border: 1px solid red;
        width: 100%;
        height: 5%;
    }
</style>
        
        
</head>
<body>

    <h2 align="center">호텔 예약: 메인바에 contextPath로 넣을지 생각 중</h2> 
    <br>

    <div class="outer">
        <div class="outer_name">
            <h5 align="right">프로그램 > 호텔예약 // 자동변경이면 좋을 듯</h5> 
        </div>


        <br> <br> <br> <br> <br> <br>


        <div class="list-area">

			<%--  <% for ( Board b : list ) { %> --%>
            <div class="thumbnail" align="center">
            <%-- <input type="hidden" value="<%= b.getBoardNo() %>" >--%>
                <img src=" # %>" width="200" height="150"> 이미지 들어가게
                <p>
                    호텔명 : <%-- <%= b.getBoardNo() %> <%= b.getBoardTitle() %> --%> <br> 
                    소개 or 사이즈 전용여부 :  <br>
                </p>

            </div>
        <%--    <% } --%> 


        </div>
    </div>

<%-- 예시
	<script>
		$(function() {
			$(".thumbnail").click(function(){
				   location.href="<%= contextPath %>/detail.th?bno=" + $(this).children("input").val();
			})	
	})
	</script>
	--%> 

    <br><br><br><br><br><br><br><br><br><br>

    
   <%-- <%@ include file="../common/topBtn.jsp" %> <br> --%>
  <%--   <%@ include file="../common/footerbar.jsp" %> --%>
  
</body>
</html>