<%@page import="com.kh.chatting.model.vo.Chatting"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
   Chatting chat = (Chatting)request.getAttribute("chat");
   // 채팅방번호, 회원 아이디, 모임도시, 마지막채팅날짜, 참여여부
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PuppyFriendsFamily</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<style>
    .chat-window {
        border: 1px solid black;
        width: 800px;
        height: 700px;
        overflow: hidden;
        padding: 10px;     
        padding-bottom:40px;
        padding-left:20px;
        padding-right:20px;    
        border-radius: 10px;
        border:2px solid rgb(255, 222, 239);
        border-bottom-left-radius:0%;
        border-bottom-right-radius:0%;
        background-color: rgb(255, 222, 239);
    }
    
    .chat-message {
 			line-height: 30px;
            display: block;
            float: left;
            border: none;
            padding-bottom: 0%;
            background-color: rgb(255, 222, 239);
            margin-left: 1px;     
    }
    
    .my {
        text-align: right;
        margin-right:35px;
        margin-left: auto; /* 자신의 채팅을 오른쪽으로 이동 */
    }
    
    .mych {
        text-align: right;
        margin-right:20px;
        margin-left: auto; /* 자신의 채팅을 오른쪽으로 이동 */
    }
    
    .otch{
    	text-align: left;
        margin-left: auto;
    }
    
    .myChat {
        background-color: yellow;
        margin-left: auto;
        margin-right: 15px;
        padding: 8px;
        border-radius: 10px;
        display: inline-block;
        max-width: 400px;
        text-align: left;        
    }
    
    .others {
        text-align: left;
        margin-right: auto; /* 다른 사용자의 채팅을 왼쪽으로 이동 */
    }
    
    .othersChat {
        background-color: #EDEDED;
        margin-right: auto;
        margin-left: 60px;
        padding: 8px;
        border-radius: 10px;
        display: inline-block;
        max-width: 400px;
        
    }
    
    .message-time {
        display: inline-block;
        font-size: 12px;
        color: #888888;
        margin-right: 6px; /* 시간과 채팅 메시지 사이의 간격 조정 */
        margin-left: 6px;
    }
    
     .send-btn{
            line-height: 30px;
            display: block;
            float: left;
            border: none;
            padding-bottom: 0%;
            background-color: rgb(255, 222, 239);
            margin-left: 1px;
            color:white;     
            border-bottom-right-radius: 10px;
            border-right: 2px solid rgb(255, 222, 239);
            border-bottom: 2px solid rgb(255, 222, 239);
            border-left: 1px solid rgb(255, 222, 239);
            border-top: none;
        }

        .chatWindow:scroll{
           display:none;
        }

		.chatting-send{
            margin-left: 70px;
        }
		
        #chatMessage{
            border:1px solid rgb(255, 222, 239);
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            
        }
    	
    	#chatMessage:focus{
            outline-color: rgb(255, 222, 239);   
        }
        
    
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>


    <div class="chatting-send">
        <div id="chattingMsg" class="col-md-6 offset-md-3">
            <div class="chat-window" id="chatWindow"></div>
            <div class="text-send d-flex"> 
                <textarea type="text" id="chatMessage" rows="1" cols="100" onkeyup="if(event.keyCode==13) sendMessage();"></textarea>
                <button class="send-btn" onclick="sendMessage()">전송</button>
            </div>
        </div>
    </div>


<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script>
    var serverUrl = "ws://" + window.location.hostname + ":" + window.location.port + "${pageContext.request.contextPath}/ChatingServer";
    var webSocket = new WebSocket(serverUrl);
    
    function sendMessage() {
        var chatMessage = $("#chatMessage");
        var message = {
            sender: "<%= chat.getMemberId() %>",
            content: chatMessage.val()
        };
    
        webSocket.send(JSON.stringify(message));
        chatMessage.val("");
        chatMessage.focus();
    }
    
    $(function() {
        webSocket.onmessage = function(event) {
            var message = JSON.parse(event.data);
            var chatWindow = $("#chatWindow");
            var messageContent = message.content;
            var now = new Date();
            var hours = now.getHours();
            var minutes = now.getMinutes();
            var currentTime = hours < 12 ? "오전" : "오후";
            hours = hours % 12; 
            hours = hours ? hours : 12;
            var currentTime =  currentTime + " " + hours + ":" + (minutes < 10 ? '0' : '') + minutes;
            
            if (message.sender == "<%= chat.getMemberId() %>") {
                chatWindow.append("<br>" + "<div class='mych'>" +  "My" + "<br>" + "</div>" + "<div class='my'><span class='message-time'>" + currentTime + "</span><div class='myChat'>" + messageContent + "</div></div>");
            } else {
                chatWindow.append( "<br>" + "<div class='otch'>" + "<%=chat.getMemberId()  %>" + "</div>" + "<div class='others'><div class='othersChat'>" + messageContent + "</div><span class='message-time'>" + currentTime + "</span></div>");
            }
            
            chatWindow.scrollTop(chatWindow.prop("scrollHeight"));
        };
    });
</script>


<br><br><br><br><br><br>
</body>
</html>
