<%@page import="com.kh.notice.model.vo.Notice"%>
<%@page import="com.kh.common.model.vo.AdminPageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%

    ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
    
   /*  AdminPageInfo pi = (AdminPageInfo)request.getAttribute("pi");
    int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage(); */
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{border: 1px solid white; box-sizing: border-box;}

    .outer{
        width: 100%;
        height: 1000px;
    }

    .notice-page{width: 60%; height: 100%;}
    .notice-header{width: 100%; height: 20%;}
    .notice-content{width: 100%; height: 80%;}
    .notice-post-top{width: 100%; height: 6%;}
    .notice-post-top>div{float: left;}
    .notice-number{
        width: 6%; 
        height: 100%;
        padding: 10px 7px;
    }

    .notice-title{
        width: 60%; 
        height: 100%;
        padding: 11px 7px;
    }

    .notice-writer, .notice-count{
        width: 10%; 
        height: 100%;
        padding: 11px 7px;
    }

    .notice-create-date{
        width: 14%;
        height: 100%;
        padding: 11px 7px;
    }
    .notice-header>div{float: right;}

    .create-notice{margin-top: 5px;}

    .notice-header{border-bottom: 2px solid #666666;}
    .notice-number, .notice-title, .notice-writer, .notice-count, .notice-create-date{
        border-bottom: 1px solid lightgray;
    }
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	
	<div class="outer" align="center">
        <div class="notice-page">
            <div class="notice-header">
                <br><br>
                <h1 align="center">공지사항</h1>
                <br>
		        <% if(loginUser != null && loginUser.getMemberId().equals("ADMIN")) { %>
                    <div class="create-notice">
                        <button onclick="location.href='<%= contextPath %>/enrollForm.no'" class="btn btn-sm btn-secondary">글작성</button>
                    </div>
	        	<% } %>

            </div>
            <div class="notice-content">
                <div class="notice-post-top">
                    <div class="notice-number">NO</div>
                    <div class="notice-title">제목</div>
                    <div class="notice-writer">작성자</div>
                    <div class="notice-count">조회수</div>
                    <div class="notice-create-date">작성일</div>
                </div>
                <% if(list.isEmpty()) { %>
                    <div class="notice-none">존재하는 공지사항이 없습니다.</div>
                <% }else { %>
	                <% for(Notice n : list) { %>
                        <div class="notice-post-top">
                            <div class="notice-number"><%= n.getNoticeNo() %></div>
                            <div class="notice-title"><%= n.getnoticeTitle() %></div>
                            <div class="notice-writer"><%= n.getNoticeWriter() %></div>
                            <div class="notice-count"><%= n.getCount() %></div>
                            <div class="notice-create-date"><%= n.getCreateDate() %></div>
                        </div>
                    <% } %>
                <% } %>
            </div>
           
	      

        </div>
    </div>
    
    <script>
    	$(function(){
    		$(".notice-post-top").click(function(){
    			const num = $(this).children().eq(0).text();
    			
    			
    			// /jsp/요청할url?키=벨류&키=벨류
    			// 요청시전달값(키=벨류) == 쿼리스트링
    			
    			// /jsp/detail.no?num=클릭한 글번호
    			location.href = '<%= contextPath %>/detail.no?num=' + num;
    		});
    	})
    </script>
    
	
	
	<%@ include file="../chatting/chatting.jsp" %>
	
	<%@ include file="../common/topBtn.jsp" %>
	
	<%@ include file="../common/footerbar.jsp" %>	

</body>
</html>