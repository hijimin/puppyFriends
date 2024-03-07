<%@page import="com.kh.chat.model.vo.Chat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = (String)request.getAttribute("userId");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
     * {
        padding: 0;
        margin: 0;
        box-sizing: border-box;
        }
        .wrap1 {
        background-color: rgb(255, 222, 239);
        width: 800px;
        height: 900px;        
        border-radius: 20px;
        margin: auto;
        } 
        .chat, .input, #user{
            width: 100%;
        }
        #user{
            height: 8%;
            border-bottom: 1px solid gray;
        }
        .chat{
            overflow-y: auto;
            height: 80%;
        }
        .chat{
        -ms-overflow-style: none;
        }
        .chat::-webkit-scrollbar{
        display:none;
        }
        .input{
            height: 5%;
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
        font-size: 13px !important;
    }
    .wrap1 .ch #content {
        position: relative;
        display: inline-block;
        max-width: calc(100% - 130px);
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
    #date{
        font-size: 11px;
    }
    #header{
        background-color: rgb(255, 222, 239);
        width: 1903px;
    }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	
    <!-- <div id="header">
        <br>
        <h1 align="center">puppyfriend</h1>
        <br>
    </div>
    <br> -->
    <div class="wrap1" align="center">
        <div id="user">
            <br>
            <h2><%= userId %></h2>
        </div>
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
                <span id='date'><br>plrks~!!!!!!!!!!</span>
            </div>

        </div>
        <div class="input" align="right">
            <input type="text" id="messageInput" onkeyup="if(event.keyCode==13) enter();"> <button id="btn2" onclick="submitFunction();">전송</button>
        </div>

    </div>
    
    <script>
	 function scrollToBottom() {

		var chatContainer = document.querySelector('.chat');
		chatContainer.scrollTop = chatContainer.scrollHeight;
	}
	</script>
	
	<script>
	    function selectChatList(){
	        $.ajax({	
	        	type:"post",
	            url:"/puppy/chatList.do",
	            data:{
	            	fromId:"ADMIN",
	            	toId:"<%= userId %>"
	            },
	            success:function(result){
	            	console.log(result);
	                let value = "";
	                
	                for(let i=0; i<result.length; i++){
	                	if(result[i].fromId == "ADMIN"){
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
	                scrollToBottom();
	            },
	            error:function(){
	                console.log("ajax 통신 실패");
	            }
	
	        });
	
	    }
    
    
    
    
    
		function submitFunction(){
			var fromId = 'ADMIN';
			var toId = '<%= userId %>';
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
	                if(result > 0){
	                	selectChatList();
	                	scrollToBottom();
	                }else {
	                	
	                }
	            }
			});
	
	        $("#messageInput").val("");
	
		}

        $(document).ready(function(){
            selectChatList();
            scrollToBottom();
        })
	
        function enter(){
            
            submitFunction();
            $("#messageInput").focus();

        }
        
        $(function(){
            selectChatList();
            
            setInterval(selectChatList, 300);
            
        })
        
	</script>





</body>
</html>