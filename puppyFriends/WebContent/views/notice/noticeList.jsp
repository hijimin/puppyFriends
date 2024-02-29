<%@page import="com.kh.notice.model.vo.Notice"%>
<%@page import="com.kh.common.model.vo.AdminPageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%

    ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
    
    AdminPageInfo pi = (AdminPageInfo)request.getAttribute("pi");
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
            height: 950px;
            margin: auto;
        }

        .headerbar{
            width: 100%;
            height: 150px;
            background-color: rgb(255, 222, 239);
            color: white;
            line-height: 150px; 
            /* 라인 하이트 바꾸면 puppyfriends 내려옴
               근데 지금 div 한줄에 h2랑 button이 같이 있어서
                div 노나주면 될듯~ */
        }

        .sidebar{
            width: 200px;
            height: 795px;
            background-color: rgb(255, 222, 239);
            color: white;
            box-sizing: border-box;
        }

        .sidebar>ul{
            margin: 0;
            padding-left: 50px;
            padding-top: 70px;
          
        }

        .sidebar a{
            color: rgb(255, 118, 189);
            font-size: 20px;
        }

         @font-face {
            font-family: 'seolleimcool-SemiBold';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2312-1@1.1/seolleimcool-SemiBold.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }
   
        body * {
            font-family: 'seolleimcool-SemiBold';
        }
        
        body button{
            background-color: rgb(255, 167, 212);
            color : white;
            border : none;
            
        }

        .mid>*{
                float: left;
            }

        .headerbar h1{
            padding-top: 100px;
        }  

        .content{
            width: 1400px;
            height: 650px;
            margin-top: 33px;
            margin-left: 280px;
        }

        .list-area{
            font-size: 20px;
        }

        h1{
            margin-left: 560px;
        }

        .list-area td{
            margin-left: 320px;
            font-size: 20px;
        }

        th, td{
            border: 1px solid gray;
        }

        .paging-area{
            margin-right: 150px;
        }
        
        .list-area>tbody>tr>#detailInfo:hover{
        	cursor: pointer;
        }

        #deleteBtn{
            margin-left: 1278px;
            margin-bottom: 30px;
        } 
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	
	  <div class="content">
          <table class="list-area" align="center"  style="border: 1px solid gray;">
              <br>
              <h1>공지사항</h1>
              <br><br>
              <thead align="center">
                  <tr>
                  	  <th width="45">선택</th>
                      <th width="150">게시물번호</th>
                      <th width="150">작성자</th>
                      <th width="150">게시물제목</th>
                      <th width="150">조회수</th>
                      <th width="150">작성일</th>
                      <th width="250">수정일</th>
                  </tr>
                  
              </thead>
            
                  <tbody align="center">
                      <% for(Notice n : list) {  %>
                          <tr>
                              <th><input type="checkbox" value="Y" name="deleteNotice" onclick="checkList();"></th>
                              <td id="detailInfo"><%= n.getNoticeNo() %></td>
                              <td><%= n.getNoticeWriter() %></td>
                              <td><%= n.getNoticeTitile() %></td>
                              <td><%= n.getCount() %></td>
                              <td><%= n.getCreateDate() %></td>
                              <td><%= n.getModifyDate() %></td>
                          </tr>
                  <% } %>
					</tbody>
				 </table>	
				
				
				<script>
					$(function(){
						$(".list-area>tbody>tr>#detailInfo").click(function(){
							location.href='<%= contextPath %>/noticeDetail.no?nno=' + $(this).text();
						})
					})
				</script>
				

                <br><br>
                
                <div class="paging-area" align="center">
                    <% if(currentPage != 1) { %>
                    <button onclick="location.href='<%= contextPath %>/noticeList.no?cpage=<%= currentPage - 1 %>'"> &lt; </button>
                    <% } %>
                    
                    <% for(int p=startPage; p<=endPage; p++) { %>
                        <% if(p == currentPage) { %>
                        <button style="background-color:pink;"><%= p %></button>
                        <% } else { %>
                        <button onclick="location.href='<%= contextPath %>/noticeList.no?cpage=<%= p %>'"><%= p %></button>
                        <% } %>
                    <% } %>
                    
                    <% if(currentPage != maxPage) { %>
                    <button onclick="location.href='<%= contextPath %>/noticeList.no?cpage=<%= currentPage + 1 %>'"> &gt; </button>
                    <% } %>
                </div>
                <br>
            </div>
            
       
        
        
    
	
	
	
	<%@ include file="../common/footerbar.jsp" %>	

</body>
</html>