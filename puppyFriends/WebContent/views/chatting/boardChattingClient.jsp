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
        width: 806px;
        height: 700px;
        overflow-y: auto;
        padding: 10px;     
        padding-bottom:40px;
        padding-left:20px;
        padding-right:20px;    
        border:2px solid rgb(255, 222, 239);
        border-radius: 10px;
        border-bottom-left-radius:0%;
        border-bottom-right-radius:0%;
        background-color: rgb(255, 222, 239);
        padding-top: 0%;
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
        text-align: left;  
        max-width: 400px;
        word-wrap: break-word;         
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
        word-wrap: break-word;   
    }
    
    .message-time {
        display: inline-block;
        font-size: 12px;
        color: #888888;
        margin-right: 6px;
        margin-left: 6px;
    }
    
     .voting-buttons{
            line-height: 30px;
            display: block;
            float: left;
            border: none;
            padding-bottom: 0%;
            background-color: rgb(255, 222, 239);
            margin-left: 1px;
            color:rgb(255, 118, 189);     
            border-bottom-right-radius: 10px;
            border-right: 2px solid rgb(255, 222, 239);
            border-bottom: 2px solid rgb(255, 222, 239);
            border-left: 1px solid rgb(255, 222, 239);
            border-top: none;
        }
        
        .send-btn{
            line-height: 30px;
            display: block;
            float: left;
            border: none;
            padding-bottom: 0%;
            background-color: rgb(255, 222, 239);
            margin-left: 1px;
            color:rgb(255, 118, 189);     
            border-right: 2px solid rgb(255, 222, 239);
            border-bottom: 2px solid rgb(255, 222, 239);
            border-left: 1px solid rgb(255, 222, 239);
            border-top: none;
        }

        .chatting-send{
                margin-left: 60px;
                margin-top: 90px;
            }
      
        #chatMessage{
            border:1px solid rgb(255, 222, 239);
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            
        }
       
       #chatMessage:focus{
            outline-color: rgb(255, 118, 189);  
        }
        
        h1{
            color: white;
        }

        hr{
             background-color: rgb(255, 118, 189); 
        }

      .chat-window::-webkit-scrollbar{
           display:none;
           background-color:rgb(255, 222, 239);
                  
       }
       
       
</style>
</head>
<body>

   <%@ include file="../common/menubar.jsp" %>


    <div class="chatting-send">
        <div id="chattingMsg" class="col-md-6 offset-md-3">     
            <div class="chat-window" id="chatWindow" align="center"></div>
            <div class="text-send d-flex"> 
                <textarea type="text" id="chatMessage" rows="1" cols="100" onkeyup="if(event.keyCode==13) sendMessage();"></textarea>
                <button class="send-btn" onclick="sendMessage()">전송</button>                
                <button class="voting-buttons" onclick="startVoting()">투표</button>                
            </div>
        </div>
    </div>
    
    


<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script>
    var serverUrl = "ws://" + window.location.hostname + ":" + window.location.port + "${pageContext.request.contextPath}/ChatingServer";
    var webSocket = new WebSocket(serverUrl);
    
    function sendMessage() {
        var chatMessage = $("#chatMessage").val().trim(); 
        if (chatMessage !== "") {
            var message = {
                sender: "<%= chat.getMemberId() %>",
                content: chatMessage
            };

            webSocket.send(JSON.stringify(message));
            $("#chatMessage").val(""); 
            $("#chatMessage").focus();
        }
    }
    
    $(function() {
        var chatWindow = $("#chatWindow");

        webSocket.onmessage = function(event) {
            var message = JSON.parse(event.data);
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
                chatWindow.append( "<br>" + "<div class='otch'>" + message.sender + "</div>" + "<div class='others'><div class='othersChat'>" + messageContent + "</div><span class='message-time'>" + currentTime + "</span></div>");
            }

            chatWindow.scrollTop(chatWindow.prop("scrollHeight"));
        };

        $(".send-btn").click(sendMessage); 
        $(".voting-buttons").click(startVoting);
    }); // send
    
    var votingInProgress = false; 

    function startVoting(event) {
        event.preventDefault(); 
        
        if (votingInProgress) {
            alert("이미 진행 중인 투표가 있습니다.");
            return;
        }
        var ask = confirm("투표를 생성 하시겠습니까?");
        if (ask) {          
            var voteOptions = prompt("투표 옵션을 입력하세요 (쉼표로 구분하여 입력)");
            if (voteOptions !== null) {
                var optionsArray = voteOptions.split(",");
                var voteHTML = "<div id='votingOptions'>";
                optionsArray.forEach(function(option) {
                voteHTML += "<input type='checkbox' name='voteOption' onclick='checkVote(this)' value='" + option.trim() + "'>" + option.trim() + "<br>";
                });
                voteHTML += "<button id='endVotingBtn' class='end-btn' onclick='endVoting()'>투표 종료</button>";
                voteHTML += "</div>";
                var message = {
                    sender: "<%= chat.getMemberId() %>",
                    content: voteHTML
                };
                webSocket.send(JSON.stringify(message));
                votingInProgress = true;
                
                var isAdmin = "<%= chat.getMemberId() %>" === "ADMIN"; 
                var isCreator = "<%= chat.getMemberId() %>" === "<%= chat.getMemberId() %>"; 

                
                
            } else {

                return;
            }
        }
        
    } // startVoting()
    
   function checkVote(clickedCheckbox) {
    var checkboxes = document.getElementsByName("voteOption");
    checkboxes.forEach(function(checkbox) {
        if (checkbox !== clickedCheckbox) {
            checkbox.checked = false;
              }
         });
   }


   function endVoting() {
	    if (votingInProgress) {
	        var isAdmin = "<%= chat.getMemberId() %>" === "ADMIN"; 
	        var isCreator = "<%= chat.getMemberId() %>" === "<%= chat.getMemberId() %>"; 

	        if (isAdmin || isCreator) {
	            var endMessage = {
	                sender: "<%= chat.getMemberId() %>",
	                content: "<strong>투표가 종료되었습니다.</strong>"
	            };
	            webSocket.send(JSON.stringify(endMessage));
	            votingInProgress = false;
	        } else {
	            alert("채팅 생성자 또는 관리자만 채팅을 종료할 수 있습니다.");
	        }
	    }
	}

 
</script>


<br><br><br><br><br><br>
</body>
</html>
