<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = "";
	if(session.getAttribute("loginUser") != null){
		userId = ((Member)session.getAttribute("loginUser")).getMemberId();
	}
	String toId = "ADMIN";
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WebSocket Basic</title>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet"> 
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 
        <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script> 
<style>
        
        * {
        padding: 0;
        margin: 0;
        box-sizing: border-box;
        }
        .wrapCh {
        padding: 10px 0;
        background-color: rgb(255, 222, 239);
        width: 350px;
        height: 400px;        
        display: block; 
        position: fixed; 
        bottom: 155px; /* 탑버튼을 화면의 가장 아래에서 몇 픽셀 떨어뜨릴 것인지 정하세요*/ 
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
            height: 11%;
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
        .wrapCh .ch .icon {
        position: relative;
        overflow: hidden;
        width: 50px !important;
        height: 50px !important;
        background-color: #eee;
    }
    .wrapCh .ch .icon p {
        position: absolute;
        top: 15px;
        left: 50%;
        color: #aaa;
        transform: translateX(-50%);
        font-size: 13px !important;
    }
    .wrapCh .ch #content {
        position: relative;
        display: inline-block;
        max-width: calc(100% - 110px);
        padding: 10px;
        margin-top: 7px;
        font-size: 13px;
        border-radius: 10px;
        word-wrap:break-word;
    }
    .wrapCh .ch #content::before {
        position: absolute;
        display: block;
        top: 0;
        font-size: 1.5rem;
    }
    .wrapCh .ch1 #content {
        margin-left: 15px;
        background-color: #ddd;
    }
    .wrapCh .ch1 #content::before {
        left: -15px;
        content: "◀";
        color: #ddd;
    }
    .wrapCh .ch2 {
        flex-direction: row-reverse;
    }
    .wrapCh .ch2 #content {
        margin-right: 15px;
        background-color: #F9EB54;
    }
    .wrapCh .ch2 #content::before {
        right: -15px;
        content: "▶";
        color: #F9EB54;
    }
    #btn1{
        display: block; 
        position: fixed; 
        bottom: 90px; /* 탑버튼을 화면의 가장 아래에서 몇 픽셀 떨어뜨릴 것인지 정하세요*/ 
        right: 30px; /* 탑버튼을 화면의 가장 오른쪽에서 몇 픽셀 떨어뜨릴 것인지 정하세요*/ 
        z-index: 999; 
        border: 4px solid #ffdeef; 
        outline: none; 
        background-color:transparent;
        color: #ffdeef; 
        cursor: pointer; 
        padding: 7px 12px; 
        border-radius: 100%;
        font-size: 20px;
        font-weight: 800; 
    }
    #date{
        font-size: 10px;
    }
    #btn1:hover{
        transform: scale(1.1);
    }
    </style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


<body>

    <script> 
		AOS.init(); 
	</script>
	

   	<% if(userId.equals("") || userId.equals("ADMIN")){ %>
   	
    <% }else{ %>
   	 	<button id="btn1" onclick="chatting();">톡</button>
   	<% } %>

    <script>
        

        function chatting(){

            if($(".wrapCh").css("display") == "block"){
                $("#btn1").css("padding", "7px 12px")
                $("#btn1").html("톡");
                $(".wrapCh").slideUp();
            }else{
                $("#btn1").css("padding", "4.5px 5.5px")
                $("#btn1").html("<img src='resources/upfiles/2024032209163136986.png' style='width:33px; height=36px;'>");
                $(".wrapCh").slideDown();
                var chatContainer = document.querySelector('.chat');
    			chatContainer.scrollTop = chatContainer.scrollHeight;
            }

        }
        
        function scrollToBottom() {
        	
			var chatContainer = document.querySelector('.chat');
        	chatContainer.scrollTop = chatContainer.scrollHeight;;			
		}
        

    </script>
    
    <div class="wrapCh" style="display: none;" >
        <div class="chat">
        	
            <!-- <div class="ch ch1">
                <div class="icon" align="center"><p>a</p></div>
                <div id="content">안녕하세요. 반갑습니다.</div>
            </div>
            <div class="ch ch2">
                <div class="icon" align="center"><p>a</p></div>
                <div id="content"> 안녕하세요. 친절한효자손입니다. 그동안 잘 지내셨어요?</div>
            </div> -->
            

        </div>
        <div class="input" align="right" style="display: flex;">
            <input type="text" style="flex: 1; border-radius: 3px; margin-left: 100px; margin-right: 5px;" id="messageInput" onkeyup="if(event.keyCode==13) enter();"> <button id="btn2" onclick="submitFunction();">전송</button>
        </div>

    </div>
    
    
    <script>

	    function selectChatList(){

	    	
	        $.ajax({	
	        	type:"post",
	            url:"/puppy/chatList.do",
	            data:{
	            	fromId:"<%= userId %>",
	            	toId:"ADMIN"
	            },
	            success:function(result){
	                let value = "";
	                for(let i=0; i<result.length; i++){
	                	if(result[i].fromId == "<%= userId %>"){
	                		value += "<div class='ch ch2'>"
	             				   + "<div class='icon' align='center'>"
	             				   + "<p>"
	             				   + result[i].fromId
	             				   + "</p>"
	             				   + "</div>"
	                			   + "<div id='content'>"
	                			   + result[i].content
	                			   + "</div>"
	                			   + "<span id='date'>" + "<br>"
	                			   + result[i].chatDate
	                			   + "</span>" + "</div>";
	                	}else{
	                		value += "<div class='ch ch1'>"
                				   + "<div class='icon' align='center'>"
                				   + "<p>"
                				   + result[i].fromId
                				   + "</p>"
                				   + "</div>"
	                			   + "<div id='content'>"
	                			   + result[i].content
	                			   + "</div>"
	                			   + "<span id='date'>" + "<br>"
	                			   + result[i].chatDate 
	                			   + "</span>" + "</div>";
            
	                	}
	                }
	                   
	                $(".chat").html(value);
	                var chatContainer = document.querySelector('.chat');
	            },
	            error:function(){
	                // console.log("ajax 통신 실패");
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
	                if(result > 0){
	                	selectChatList();
	                	
	                }else {
	                	
	                }
	            }
			});
	
	        $("#messageInput").val("");
	        $("#messageInput").focus();
	        setTimeout(function() {
            	var chatContainer = document.querySelector('.chat');
    			chatContainer.scrollTop = chatContainer.scrollHeight;
            	}, 101);	        
	        
		}

        $(document).ready(function(){
            selectChatList();
        })
	
        function enter(){
            
            submitFunction();
            
            setTimeout(function() {
            	var chatContainer = document.querySelector('.chat');
    			chatContainer.scrollTop = chatContainer.scrollHeight;
            	}, 301);

        }
        
        $(function(){
        		
             selectChatList();
            
             setInterval(selectChatList, 300);
        	
            
       })


        
        var divElement = $(".chat")

            function checkScrollPosition() {
          
            var scrollTop = divElement.scrollTop();
            var scrollHeight = divElement.prop('scrollHeight');
            var clientHeight = divElement.innerHeight();
            var atBottom = scrollHeight - scrollTop - clientHeight;
    
            if (atBottom < 91) {
                yourFunction();
            }
        };

        checkScrollPosition();

        setInterval(checkScrollPosition, 300);

        function yourFunction() {
            scrollToBottom();
        }

	</script>
	
	
</body>
</html>