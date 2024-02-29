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
    .btn_bar{
        border: 1px solid red;
        width: 100%;
        height: 20%;
        position: relative;
    }
    .btn_bar>button{
        border: 1px solid red;
        padding: 10px 15px;
        border: none;
        background-color: rgb(255, 222, 239);
        position: absolute;
        bottom: 0;
        right: 0;
        border-radius: 20px
    }

</style>
        
        
</head>
<body>

    <h2 align="center">유치원 예약: 메인바에 contextPath로 넣을지 생각 중</h2> 
    <br>

    <div class="outer">
        <div class="outer_name">
            <p align="right">프로그램 > 유치원 예약 // 자동변경이면 좋을 듯</p> 
        </div>


        <br> <br> <br> <br> <br> <br>


        <div class="list-area">

			<%--  <% for ( Board b : list ) { %> --%>
            <div class="thumbnail" align="center">
            <%-- <input type="hidden" value="<%= b.getBoardNo() %>" >--%>
                <img src=" # %>" width="200" height="150"> 이미지 들어가게
                <p>
                    유치원명 : <%-- <%= b.getBoardNo() %> <%= b.getBoardTitle() %> --%> <br> 
                    소개 or 사이즈 전용여부 :  <br>
                    기간 : 
                </p>

            </div>
        <%--    <% } --%> 
            
        </div>

        <div style="width: 100%; height: 30%;"> </div>
        <div style="width: 100%; height: 50%;">
            <div class="btn_bar">
                <button>등록하기// onclick 예정/ 관리자한테만 보이게</button> 
            </div>
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