<%@page import="com.kh.chat.model.vo.Chat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Chat> list = (ArrayList<Chat>)request.getAttribute("list");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    tr:hover{
        background-color: rgb(255, 222, 239);
        cursor: pointer;
    }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>

	<%@ include file="../common/menubar.jsp"%>

    <h2 align="center">회원 채팅 목록</h2>
    <br>
    <table align="center" border="1">
        <tbody>
            <% for(Chat c : list){ %>
            <tr>
                <th width="100" height="50"><%= c.getFromId() %></th>
                <td width="500"><%= c.getContent() %></td>
                <td width="200"><%= c.getChatDate() %></td>
            </tr>
            <% } %>
            
        </tbody>
    </table>

	<script>
        $(function(){

            $("table tbody tr").click(function(){

            location.href='<%= contextPath %>/memberChat.ch?user=' + $(this).children().eq(0).text();

        })



})
    </script>




</body>
</html>