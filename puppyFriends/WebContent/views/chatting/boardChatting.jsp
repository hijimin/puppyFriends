<%@page import="com.kh.chatting.model.vo.Chatting"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	ArrayList<Chatting> list = (ArrayList<Chatting>)request.getAttribute("list");
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역별 채팅</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	
  <!-- jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
   <style>
       
       h1{
            text-align: center;
       }
       
    </style>

</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	
	  <div class="outer">
    
            <div class="content">
                <table class="list-area" align="center"  style="border: 1px solid gray;">
                    <br>
                    <h1>만남게시판</h1>
                    <br><br>
                    <thead align="center">
                        <tr>
                            <th width="150">채팅방번호</th>
                            <th width="150">모임도시</th>
                            <th width="150">마지막 채팅날짜</th>
                            <th>채팅선택</th>
                        </tr>
                        
                    </thead>
                  
                  <% for(Chatting ch : list) { %>
                        <tbody align="center">
                                <tr>
                                    <td id="detailInfo"><%= ch.getChattingNo() %></td>
                                    <td><%= ch.getChattingCity() %></td>
                                    <td><%= ch.getChattingDate() %></td>  
                                    <td><a href="<%= contextPath %>/chatForm.ch" class="btn bnt-sm btn-secondary">입장</a></td>                                
                                </tr>

                        </tbody>
                     <% } %>   
                </table>
                
				<script>
					$(function(){
						$(".list-area>tbody>tr>#detailInfo").click(function(){
							location.href='<%= contextPath %>/adminDog.me?mno=' + $(this).text();
						})
					})
				</script>

                <br><br>
                
            </div>
            
        </div>
        
        
    </div>
	
	
	
	
	<%@ include file="../common/footerbar.jsp" %>

</body>
</html>