<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = "USER01";
	String toId = "ADMIN";
%> 
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
		flex-direction:column-reverse;
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
    .wrap1 .ch #content {
        position: relative;
        display: inline-block;
        max-width: calc(100% - 70px);
        padding: 10px;
        margin-top: 7px;
        font-size: 13px;
        border-radius: 10px;
    }
    .wrap1 .ch #content::before {
        position: absolute;
        display: block;
        top: 0;
        font-size: 1.5rem;
    }
    .wrap1 .ch1 #content {
        margin-left: 20px;
        background-color: #ddd;
    }
    .wrap1 .ch1 #content::before {
        left: -15px;
        content: "◀";
        color: #ddd;
    }
    .wrap1 .ch2 {
        flex-direction: row-reverse;
    }
    .wrap1 .ch2 #content {
        margin-right: 20px;
        background-color: #F9EB54;
    }
    .wrap1 .ch2 #content::before {
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

	<%@ include file="../common/menubar.jsp" %>
    
    <button id="btn" onclick="chatting();">톡</button>

    <script>
        function chatting(){

            if($(".wrap1").css("display") == "block"){
                $(".wrap1").css("display", "none");
            }else{
                $(".wrap1").css("display", "block");
            }

        }
        
        function scrollToBottom() {

			var chatContainer = document.querySelector('.chat');
			chatContainer.scrollTop = chatContainer.scrollHeight;
		}
        

    </script>
    
    <div class="wrap1">
        <div class="chat">
        	
            <div class="ch ch1">
                <div class="icon" align="center"><p>a</p></div>
                <div id="content">안녕하세요. 반갑습니다.</div>
            </div>
            <div class="ch ch2">
                <div class="icon" align="center"><p>a</p></div>
                <div id="content"> 안녕하세요. 친절한효자손입니다. 그동안 잘 지내셨어요?</div>
            </div>
            <div class="ch ch1">
                <div class="icon" align="center"><p>a</p></div>
                <div id="content">아유~ 너무요너무요! 요즘 어떻게 지내세요?</div>
            </div>
            <div class="ch ch2">
                <div class="icon" align="center"><p>a</p></div>
                <div id="content">뭐~ 늘 똑같은 하루 하루를 보내는 중이에요.</div>
                <span><br>plrks~!!!!!!!!!!</span>
            </div>

        </div>
        <div class="input" align="right">
            <input type="text" id="messageInput"> <button onclick="submitFunction()">전송</button>
        </div>

    </div>
    
    
    <script>
	    function selectChatList(){
	        $.ajax({
	        	type:"post",
	            url:"chatList.do",
	            data:{
	            	fromId:"USER01",
	            	toId:"ADMIN"
	            },
	            success:function(result){
	            	console.log(result);
	                let value = "";
	                for(let i=0; i<result.length; i++){
	                	if(fromId = "USER01"){
	                		value += "<div class='ch ch2'>"
	             				   + "<div class='icon' align='center'>"
	             				   + "<p>"
	             				   + "a"
	             				   + "</p>"
	             				   + "</div>"
	                			   + "<div id='content'>"
	                			   + "뭐~ 늘 똑같은 하루 하루를 보내는 중이에요."
	                			   + "</div>"
	                			   + "<span>" + "<br>"
	                			   + "plrks~!!!!!!!!!!"
	                			   + "</span>" + "</div>";
	                	}else{
	                		value += "<div class='ch ch2'>"
                				   + "<div class='icon' align='center'>"
                				   + "<p>"
                				   + "a"
                				   + "</p>"
                				   + "</div>"
	                			   + "<div id='content'>"
	                			   + "뭐~ 늘 똑같은 하루 하루를 보내는 중이에요."
	                			   + "</div>"
	                			   + "<span>" + "<br>"
	                			   + "plrks~!!!!!!!!!!"
	                			   + "</span>" + "</div>";
            
	                	}
	                }
	                   
	                $(".chat").html(value);
	                
	            },
	            error:function(){
	                console.log("ajax 통신 실패");
	            }
	
	        });
	
	    }
    
    
    
    
    
		function submitFunction(){
			var fromId = '<%= userId %>';
			var toId = '<%= toId %>';
			var content = $("#messageInput").val();
			$.ajax({
				type:"post",
	            url: "/puppy/chat.do",
	            data:{
	                fromId: fromId,
	                toId: toId,
	                content: content
	            },
	            success:function(result){
	            	console.log(result);
	                if(result == 1){
	                    
	                }else {
	                	
	                }
	            }
			});
	
	        $("#messageInput").val("");
	
		}

        $(document).ready(function(){
            selectChatList();
        })
	

        /*
        var chatContainer = document.querySelector('.chat');
			chatContainer.scrollTop = chatContainer.scrollHeight;
  
        
		function scrollToBottom() {

			var chatContainer = document.querySelector('.chat');
			chatContainer.scrollTop = chatContainer.scrollHeight;
		}
        */
		/*
		// WebSocket 메시지를 받았을 때 처리
		socket.onmessage = function(event) {
			chatArea.html(chatArea.html()
				+ "<div class='ch ch1'>"
				+ "<div class='icon' align='center'>"
				+ "<p>zzz</p>"
				+ "</div>"
				+ "<div class='textbox'>"+event.data+"</div>"
				+ "</div>");

			// 새로운 메시지가 추가되면 스크롤을 항상 아래로 이동
			scrollToBottom();
		};

		// 사용자가 메시지를 보낼 때 스크롤을 항상 아래로 이동
		function sendMessage() {
			var messageInput = $("#messageInput");
			var message = messageInput.val();
			socket.send(message);
			messageInput.val("");

			// 메시지를 보냈을 때도 스크롤을 항상 아래로 이동
			scrollToBottom();
		}
	*/
		
        
    </script>
    
    
</body>
</html>