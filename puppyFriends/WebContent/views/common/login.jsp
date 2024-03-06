<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    
    .whole{width: 100%; height: 700px; margin: auto;}
    .whole>div{width: 100%;}
    div{box-sizing: border-box; border: 1px solid red;}

    #header{width: 100%; height: 10%;}
    #header>div{height: 100%; float: left; background-color: rgb(255, 222, 239);}
    #header2{width: 100%; padding: 0px;}

    #navi{
        list-style-type: none;
        padding: 0;
        margin: 0;
        height: 100%;
    }

    #navi>li{
        float: left;
        width: 20%;
        height: 100%;
        text-align: center;
    }

    #navi a{
        color: white;
        text-decoration: none;
        font-size: 20px;
        line-height: 60px;
    }

    #content{height: 90%;}
    #content>div{height: 100%; float: left;}
    #content1{width: 20%;}
    #content2{width: 60%;}
    #content3{width: 20%;}

    #content2_1{height: 15%;}
    #content2_2{height: 85%; padding-top: 100px}
    
    .kakaologin{margin-top: 15px;}
</style>
</head>
<body>

	
	<% if(alertMsg != null) { %>
		<script>
			alert("<%= alertMsg %>");
		</script>
		<% session.removeAttribute("alertMsg"); %>
	<% } %>
    <div class="whole">
        <div id="header">
            <div id="header2">
                <ul id="navi">
                    <li><a href="">홈</a></li>
                    <li><a href="">소개</a></li>
                    <li><a href="">프로그램</a></li>
                    <li><a href="">강아지 정보</a></li>
                    <li><a href="">상품</a></li>
                </ul>
            </div>
        </div>

        <div id="content">
            <div id="content1"></div>
            <div id="content2">
                <div id="content2_1"><h2 align="center" style="padding-top: 10px;">PUPPY FRIENDS</h2></div>
                <div id="content2_2" align="center">
                    <form action="<%= request.getContextPath() %>/login">
                        <h3>로그인</h3>
                        <input type="hidden" id="userNo" name="userNo">
                        <input type="text" id="userId" name="userId" placeholder="아이디" style="width: 300px; height: 50px;"><br>
                        <input type="password" id="userPwd" name="userPwd" placeholder="비밀번호" style="width: 300px; height: 50px;"><br><br>

                        <input type="submit" value="로그인" style="border-radius: 10px; width: 300px; height: 30px; background-color: rgb(255, 222, 239); border-color: rgb(255, 222, 239);">
                    </form>
                    <br>
                    <a href="<%= request.getContextPath() %>/enrollpage.me" style="text-decoration: none; color: gray;">회원가입</a> | 
                    <a href="" style="text-decoration: none; color: gray;">아이디 찾기</a> | 
                    <a href="" style="text-decoration: none; color: gray;">비밀번호 찾기</a>
                    
                    
                    <div class="kakaologin">
                        <a href="javascript:kakaoLogin()"><img src="resources/image/kakao_login_medium_narrow.png" style="width: 200px"></a>
                    </div>
                    <button>네이버 로그인</button>
                    
                    <script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
                    <script type="text/javascript">
                        Kakao.init('6c59f1729524aa356d516aa3c7563c63');
                        function kakaoLogin(){
                            Kakao.Auth.login({
                                success: function(response){
                                    Kakao.API.request({
                                        url: '/v2/user/me',
                                        success: function (response){
                                            let id = response.id;
                                            let nickname = response.properties.nickname;
                                            console.log(nickname);
                                            let email = response.kakao_account.email;
                                            console.log(email);
                                            alert(JSON.stringify(response))
                                            location.href="http://localhost:8083/puppy/kakaologin";
                                        },
                                        fail: function(error){
                                            alert(JSON.stringify(error))
                                        },
                                    })
                                },
                                fail: function(error){
                                    alert(JSON.stringify(error))
                                },
                            })
                        }
                    </script>
                    
                    
                </div>
            </div>
            <div id="content3">
            </div>
        </div>

    </div>
</body>
</html>