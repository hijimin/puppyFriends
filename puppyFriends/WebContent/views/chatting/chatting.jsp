<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WebSocket Basic</title>
<style>
        
        * {
        padding: 0;
        margin: 0;
        box-sizing: border-box;
        }
        .wrap1 {
        padding: 10px 0;
        background-color: rgb(255, 222, 239);
        width: 350px;
        height: 350px;        
        display: block; 
        position: fixed; 
        bottom: 100px; /* 탑버튼을 화면의 가장 아래에서 몇 픽셀 떨어뜨릴 것인지 정하세요*/ 
        right: 30px; /* 탑버튼을 화면의 가장 오른쪽에서 몇 픽셀 떨어뜨릴 것인지 정하세요*/ 
        z-index: 999; 
        outline: none; 
        border-radius: 20px;
        } 
        .chat, .input{
            width: 100%;
        }
        .chat{
            overflow-y: auto;
            height: 88%;
        }
        .chat{
        -ms-overflow-style: none;
        }
        .chat::-webkit-scrollbar{
        display:none;
        }
        .input{
            height: 12%;
            padding-right: 20px;
            border-top: 1px solid gray;
            padding-top: 10px;    
        }
        input{
            width: 60%;
            height: 100%;
            overflow-y: auto;                  
        }
        .chat .ch{
            display: flex;
            align-items: flex-start;
            padding: 20px;
        }
        .wrap1 .ch .icon {
        position: relative;
        overflow: hidden;
        width: 50px;
        height: 50px;
        background-color: #eee;
    }
    .wrap1 .ch .icon p {
        position: absolute;
        top: 15px;
        left: 50%;
        color: #aaa;
        transform: translateX(-50%);
    }
    .wrap1 .ch .textbox {
        position: relative;
        display: inline-block;
        max-width: calc(100% - 70px);
        padding: 10px;
        margin-top: 7px;
        font-size: 13px;
        border-radius: 10px;
    }
    .wrap1 .ch .textbox::before {
        position: absolute;
        display: block;
        top: 0;
        font-size: 1.5rem;
    }
    .wrap1 .ch1 .textbox {
        margin-left: 20px;
        background-color: #ddd;
    }
    .wrap1 .ch1 .textbox::before {
        left: -15px;
        content: "◀";
        color: #ddd;
    }
    .wrap1 .ch2 {
        flex-direction: row-reverse;
    }
    .wrap1 .ch2 .textbox {
        margin-right: 20px;
        background-color: #F9EB54;
    }
    .wrap1 .ch2 .textbox::before {
        right: -15px;
        content: "▶";
        color: #F9EB54;
    }
    #btn{
        display: block; 
        position: fixed; 
        bottom: 35px; /* 탑버튼을 화면의 가장 아래에서 몇 픽셀 떨어뜨릴 것인지 정하세요*/ 
        right: 30px; /* 탑버튼을 화면의 가장 오른쪽에서 몇 픽셀 떨어뜨릴 것인지 정하세요*/ 
        z-index: 999; 
        border: 1px solid rgba(0,0,0,0.25); 
        outline: none; 
        background-color: white; 
        color: rgba(0,0,0,0.7); 
        cursor: pointer; 
        padding: 15px 20px; 
        border-radius: 100%; 
    }
    </style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<body>


    
    <button id="btn" onclick="chatting();">톡</button>

    <script>
        function chatting(){

            if($(".wrap1").css("display") == "block"){
                $(".wrap1").css("display", "none");
            }else{
                $(".wrap1").css("display", "block");
            }

        }

    </script>
    
    <div class="wrap1">
        <div class="chat">
            <div class="ch ch1">
                <div class="icon" align="center"><p>zzz</p></div>
                <div class="textbox">안녕하세요. 반갑습니다.</div>
            </div>
            <div class="ch ch2">
                <div class="icon" align="center"><p>zzz</p></div>
                <div class="textbox"> 안녕하세요. 친절한효자손입니다. 그동안 잘 지내셨어요?</div>
            </div>
            <div class="ch ch1">
                <div class="icon" align="center"><p>zzz</p></div>
                <div class="textbox">아유~ 너무요너무요! 요즘 어떻게 지내세요?</div>
            </div>
            <div class="ch ch2">
                <div class="icon" align="center"><p>zzz</p></div>
                <div class="textbox">뭐~ 늘 똑같은 하루 하루를 보내는 중이에요.</div>
            </div>

        </div>
        <div class="input" align="right">
            <input type="text" id="messageInput"> <button onclick="sendMessage()">전송</button>
        </div>

    </div>
    
    <script>
        
        var socket = new WebSocket("ws://" + window.location.host + "/puppy/socket");
        var chatArea = $(".chat");
        var user = $(".textbox")

        socket.onmessage = function(event) {
        	console.log(event);
            chatArea.html(chatArea.html()
	            		+ "<div class='ch ch1'>"
			            + "<div class='icon' align='center'>"
	            		+ "<p>zzz</p>"
	            		+ "</div>"
			            + "<div class='textbox'>"+event.data+"</div>"
			        	+ "</div>"
		        	);
        };

        function sendMessage() {
            var messageInput = $("#messageInput");
            var message = messageInput.val();
            socket.send(message);
            messageInput.val("");
        }
    </script>
    
    
</body>
</html>