<%@page import="com.kh.common.model.vo.Image"%>
<%@page import="com.kh.reservation.model.vo.Hotel"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	ArrayList<Hotel> list = (ArrayList<Hotel>)request.getAttribute("list");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    /* *{
        border: 1px solid red;
    } */

    .outer{
        margin: auto;
        margin-top: 30px;
        margin-bottom: 50px;
        width: 65%;
        height: 1200px;
        position: relative;
    }
    .outer_name{
        width: 100%;
        height: 5%;
    }
    .select_tool{
        width: 100%;
        height: 5%;
    }
    .select_tool>.select_text{
        float: right;
        width: 110px;
        height: 40px;
        background-color: rgb(255, 222, 239);
        border: rgb(241, 75, 161);
        border-radius: 20px;
    }

    .list-area{
        width: 100%;
        height: 90%;
        border: 2px solid rgb(255, 222, 239);
    }
    .list-area-thum{
        width: 100%;

    }

    .thum_tool{
        display: flex;
        flex-wrap: wrap;
        /* justify-content: flex-start; */
        /* justify-content: space-between; */
        /* border: 2px solid rgb(255, 222, 239); */
        width: 100%;
        height: auto;
        padding: 15px;
        margin-bottom: 18px;
    }

    .thum_tool:hover{
            cursor: pointer;
        }
    .thumbnail{
        margin-bottom: 50px;
        top: 0;
        padding: 2%;
        position: relative;
        /* flex: 1 0 20%; *//* flex-grow | flex-shrink | flex-basis */
        width: 300px;
        height: 250px;
        
    }

    .btn_bar{
        width: 95%;
        height: 8%;
        position: absolute; 
        bottom: 0;
    }
    .btn_bar>.H_enroll{
        padding: 10px 15px;
        border: none;
        background-color: rgb(255, 222, 239);
        position: absolute;
        bottom: 0;
        right: 0;
        border-radius: 20px;
        text-decoration: none;
        color: white;
    }
    /* 페이징 바*/
    .page_wrap {
        text-align:center;
        font-size:0;
    }
    .page_nation {
        position: absolute; 
        bottom: 0;
        display:inline-block;
        margin-top: 20px;
        margin-left: 37%;        
    }
    .page_nation .none {
        display:none;
    }
    .page_nation a {
        display:block;
        margin:0 3px;
        float:left;
        border:1px solid #FFDEEF;
        width:28px;
        height:28px;
        line-height:28px;
        text-align:center;
        background-color:#fff;
        font-size:13px;
        color:#999999;
        text-decoration:none;
    }
    .page_nation .arrow {
        border:1px solid #ccc;
    }
    .page_nation .pprev {
        background:#FFDEEF no-repeat center center;
        margin-left:0;
    }
    .page_nation .prev {
        background:#FFDEEF  no-repeat center center;
        margin-right:7px;
    }
    .page_nation .next {
        background:#FFDEEF no-repeat center center;
        margin-left:7px;
    }
    .page_nation .nnext {
        background:#FFDEEF no-repeat center center;
        margin-right:0;
    }
    .page_nation a.active {
        background-color:#FFDEEF;
        color:#fff;
        border:1px solid #f899ca;
    }
    
   
    

</style>
        
        
</head>
<body>

    <%@ include file="../common/menubar.jsp" %>
    
    
	<form action="<%= contextPath %>/hotel.hrv" id="hotelmain-form"
      method="post" enctype="multipart/form-data">
      
    <!-- <h2 align="center">호텔 예약: 메인바에 contextPath로 넣을지 생각 중</h2>  -->
    
    <div class="outer">
        <div class="outer_name">
            <p align="right">프로그램 &gt; 호텔 예약 </p> 
        </div>

        <div class="select_tool">
                <select class="select_text">
                    <option value="x">선택안함</option>
                    <option value="end">마감제외</option>
                </select>
        </div>
        <br><br>
    
        <!-- 썸네일 -->
        <div class="list-area">
            <div class="list-area-thum">
                <div class="thum_tool">
                    <% for(Hotel h : list){ %>
                        <div class="thumbnail">
                                <input type="hidden" name="hno" value="<%= h.getHotelNo() %>"  >
                                    <img src="<%= contextPath %>/<%= h.getTitleImg() %> " width="230px" height="200px" style="border-radius: 5%; "> <br>
                                    <div>
                                        호텔명 : <%= h.getHotelName() %> <br> 
                                        전용 사이즈 : <%= h.getHotelSize() %> <br>
                                    </div>
                        </div>
                    <% } %>
                </div>
            </div>
            			
            <div class="btn_bar">
      		 <% if(loginUser != null && (loginUser.getMemberId().equals("ADMIN"))) {%>
        	    <a href="<%= contextPath %>/enrollForm.hrv" class="H_enroll">등록하기</a>
        	 <% } %>
            </div>
            
            <br>
        
            <div id="content2_4">
                <div class="page_nation">
                    <a class="arrow pprev" href="#">&lt;&lt;</a>
                    <a class="arrow prev" href="#">&lt;</a>
                    <a href="#" class="active">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a class="arrow next" href="#">&gt;</a>
                    <a class="arrow nnext" href="#">&gt;&gt;</a>
                 </div>
                </div>

        </div>
    </div>
    
    <script>

	$(function(){
		$(".thumbnail").click(function(){
			location.href="<%= contextPath %>/detail.hrv?hno=" + $(this).children("input").val();
		})
	})
    
    </script>

    
    
    </form>
    
   <%@ include file="../common/topBtn.jsp" %> <br>
   <%@ include file="../common/footerbar.jsp" %>
  
</body>
</html>