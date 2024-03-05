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
        height: 1000px;
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
    }

    .thum_tool{
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;

        border: 2px solid rgb(255, 222, 239);
        width: 100%;
        height: 80%;
        padding: 15px;
    }

    .thum_tool:hover{
            cursor: pointer;
        }
    .thumbnail{
        float: left;
        flex: 1 0 21%; /* flex-grow | flex-shrink | flex-basis */
        margin: 1%; /* Adjust as needed */
        width: 300px;
        height: 250px;
        margin-top: 18px;
    }

    .btn_bar{
        width: 100%;
        height: 8%;
        position: relative;
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
        border:1px solid #e6e6e6;
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
        background:#f8f8f8 url('resources/product_img/page_pprev.png') no-repeat center center;
        margin-left:0;
    }
    .page_nation .prev {
        background:#f8f8f8 url('resources/product_img/page_prev.png') no-repeat center center;
        margin-right:7px;
    }
    .page_nation .next {
        background:#f8f8f8 url('resources/product_img/page_next.png') no-repeat center center;
        margin-left:7px;
    }
    .page_nation .nnext {
        background:#f8f8f8 url('resources/product_img/page_nnext.png') no-repeat center center;
        margin-right:0;
    }
    .page_nation a.active {
        background-color:#42454c;
        color:#fff;
        border:1px solid #42454c;
    }
    
    

</style>
        
        
</head>
<body>

    <%@ include file="../common/menubar.jsp" %>

    <!-- <h2 align="center">호텔 예약: 메인바에 contextPath로 넣을지 생각 중</h2>  -->
    
    <div class="outer">
        <div class="outer_name">
            <p align="right">프로그램 > 호텔 예약 // 자동변경이면 좋을 듯</p> 
        </div>

        <div class="select_tool">
                <select class="select_text">
                    <option value="x">선택안함</option>
                    <option value="like">인기순</option>
                    <option value="sel">조회순</option>
                    <option value="end">마감제외</option>
                </select>
        </div>
        <br><br>
    
        <!-- 썸네일 -->
        <div class="list-area">
            <div class="thum_tool">
             <% for(Hotel h : list){ %>
                <div class="thumbnail" align="center" onclick="<%= contextPath %>/detail.hrv">
                        <input type="hidden" value="<%= h.getHotelNo() %>" >
                            <img src=" # " width="250px" height="190px"> <br> 이미지 들어가게
                            <div>
                                호텔명 : <%= h.getHotelName() %> <br> 
                                소개 or 사이즈 전용여부 : <%= h.getHotelText() %> <br>
                            </div>
                </div>
              <% } %>
           </div>
         

			 if = 관리자 로그인 시 등록 가능, 일반 유저는 등록하기 안 보임
            <div class="btn_bar">
        	    <a href="<%= contextPath %>/enrollForm.hrv" class="H_enroll">등록하기</a> 
            </div>
        
            <div id="content2_4">
                <div class="page_nation">
                    <a class="arrow pprev" href="#"></a>
                    <a class="arrow prev" href="#"></a>
                    <a href="#" class="active">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">4</a>
                    <a href="#">5</a>
                    <a class="arrow next" href="#"></a>
                    <a class="arrow nnext" href="#"></a>
                 </div>
                </div>

        </div>
    </div>

    
    
    
   <%@ include file="../common/topBtn.jsp" %> <br>
   <%@ include file="../common/footerbar.jsp" %>
  
</body>
</html>