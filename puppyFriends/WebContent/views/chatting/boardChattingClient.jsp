<%@page import="com.kh.chatting.model.vo.Chatting"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
       ArrayList<Chatting> list = (ArrayList<Chatting>)request.getAttribute("list");
       // 채팅방번호, 회원 아이디, 모임도시, 채팅날짜, 참여여부
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강남구</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
   
    <!-- jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <style>
        .chat-window {
            border: 1px solid black;
            width: 400px;
            height: 300px;
            overflow-y: scroll;
            padding: 10px;            
        }
        
        .chat-message {
            padding: 5px 10px;
            margin-bottom: 5px;
            border-radius: 10px;
        }
        
        .my {
            text-align: right;
            margin-left: auto; /* 자신의 채팅을 오른쪽으로 이동 */
            padding-right:35px;
        }
        
        .myChat{
        	background-color: rgb(255, 222, 239);
            margin-left: auto; 
            margin-right:61px;
            width:300px;
            padding-left:10px;
        	padding-right:10px;
        	padding-top: 3px;
        	padding-bottom:3px;      
            margin-top:5px;
            text-align: right;
            width: fit-content; /* 텍스트 길이에 맞게 자동으로 늘어나도록 설정 */
            max-width: 400px;
       	    white-space: pre-wrap; /* 줄바꿈 유지 */
            word-wrap: break-word; /* 긴 단어 자동 줄바꿈 */
        }
        
        
        .others {
            text-align: left;
            margin-right: auto; /* 다른 사용자의 채팅을 왼쪽으로 이동 */
            padding-left:25px;
        }
        
        .othersChat{
            margin-right: auto; 
            margin-left:80px;
        	background-color: #d4edda;
        	color: #495057;
        	padding-left:10px;
        	padding-right:10px;
        	padding-top: 3px;
        	padding-bottom: 3px;
        	width:300px;
        	margin-top:5px;
        	width: fit-content; /* 텍스트 길이에 맞게 자동으로 늘어나도록 설정 */
        	max-width: 400px;
        	white-space: pre-wrap; /* 줄바꿈 유지 */
        	word-wrap: break-word; /* 긴 단어 자동 줄바꿈 */
        }
        
        .chatting-area{
            margin-left: 500px;
        }
        
        .chatMessage{
        	margin-left:1000px;
        }
       
        .chat-window{
            padding: 0%;
            width: 800px;
            height: 700px;
            padding-bottom: 30px;
            padding-top:20px;
        }
        
        
        .chatWindow:scroll{
        	display:none;
        }
        
        .send-btn{
        	line-height: 30px;
            display: block;
            float: left;
            border: none;
            padding-bottom: 0%;
            background-color: rgb(255, 222, 239);
            margin-left: 1px;
        }

        #chatMessage{
            display: block;
            float: left;
            border: 1px solid gray;
            border-right: none;
        }



    </style>
    
    <script>
        var serverUrl = "ws://" + window.location.hostname + ":" + window.location.port + "${pageContext.request.contextPath}/ChatingServer1";
        var webSocket = new WebSocket(serverUrl);
        
        <% for(Chatting chu : list) { %>
        $(function() {
                  webSocket.onmessage = function(event) {
                var message = JSON.parse(event.data);
                var chatWindow = $("#chatWindow");
                var messageContent = message.content;
                
                if (message.sender == "<%= list.get(0).getMemberId() %>") {
                    chatWindow.append("<br>" +"<div class='my'>" + "My" + "<br>" + "</div>" + "<div class='myChat'>" + messageContent + "</div>");
                } else {
                    chatWindow.append("<br>" + "<div class='others'>" + message.sender + "<br>" + "</div>" + "<div class='othersChat'>" + messageContent +"</div>");
                }
                
                chatWindow.scrollTop(chatWindow.prop("scrollHeight"));
            };
        });
        
       
        function sendMessage() {
            var chatMessage = $("#chatMessage");
      
            var message = {
                sender: "<%= chu.getMemberId() %>",
                content: chatMessage.val()
                
            };
        
            webSocket.send(JSON.stringify(message));
            chatMessage.val("");
            chatMessage.focus();
        }
      <% } %>
    </script>
</head>
<body>

   <%@ include file="../common/menubar.jsp" %>

	<div class="chatting-area">
	    <div id="chatWindow" class="chat-window"></div>
	    <br>
	   <div class="text-send"> 
	    <textarea type="text" id="chatMessage" rows="1" cols="100"  onkeyup="if(event.keyCode==13) sendMessage();"></textarea>
	    <button class="send-btn" onclick="sendMessage()">전송</button>
   	  </div>
    </div>
    

    <br><br><br><br><br><br><br><br><br><br>
</body>
</html>