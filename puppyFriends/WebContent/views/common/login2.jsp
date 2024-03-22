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
<script src="https://kit.fontawesome.com/d48d14d77f.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
    div{border: 1px solid white; box-sizing: border-box;}
    .whole{width: 100%; height: 900px; margin: auto;}
    .login-header{height: 21%;}
    .login-main{width: 40%; height: 100%; padding-top: 100px;}

    .login-content{height: 60%;}
    .login-form-main{
        width: 458px;
        height: 300px;
        margin-top: 50px;
        padding: 20px 28px;
        border-radius: 7px;
        border: 2px solid lightgray;
    }
    .login-form-id, .login-form-pwd{
        width: 402px;
        height: 48px;
        padding: 14px 17px 13px;
        /* text-align: left; */
        display: flex;
        border: 1px solid lightgray;
    }
    .login-form-id{
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
    }
    .login-form-pwd{
        border-bottom-left-radius: 5px;
        border-bottom-right-radius: 5px;
        border-top:none;
    }
    span{padding-right: 10px;}
    #id-input, #pwd-input{
        flex: 1; 
        padding-right: 30px;
        border-style: none;
        font-size: 16px;
    }
    #id-input:checked{
        background-color: red;
        border-style: none;
    }
    
    #login-button{
        width: 100%;
        height: 52px;
        border-radius: 7px;
        border-style: none;
        color: white;
        background-color: rgb(255, 222, 239);
        margin-top: 90px;
    }



    .login-footer{height: 15%;}
    #footerL{padding: 0px; margin: 0px;}
    .login-main>h1{cursor: pointer;}

	
	#search-id:hover, #search-pwd:hover{
        cursor: pointer;
    }

</style>

</head>
<body>

	<% if(alertMsg != null) { %>
		<script>
			alert("<%= alertMsg %>");
		</script>
		<% session.removeAttribute("alertMsg"); %>
	<% } %>
	
    <div class="whole" align="center">
        <div class="login-header">
            <div class="login-main"><h1 onclick="location.href='<%= request.getContextPath() %>'">puppy friend</h1></div>
        </div>
        <div class="login-content">
            <form action="<%= request.getContextPath() %>/login">
                <div class="login-form-main">
                    <input type="hidden" id="userNo" name="userNo">
                    <div class="login-form-id">
                        <span class="fa-regular fa-user fa-1x"></span>
                        <input type="text" id="id-input" name="userId" required placeholder="아이디">
                    </div>
                    <div class="login-form-pwd">
                        <span class="fa-solid fa-key fa-1x"></span>
                        <input type="password" id="pwd-input" name="userPwd" required placeholder="비밀번호">
                    </div>
                    <button id="login-button">로그인</button>
                </div>
            </form>
            <br>

            <a href="<%= request.getContextPath() %>/enrollpage.me" style="text-decoration: none; color: gray;">회원가입</a> | 
            <a onclick="newIdWindow();" style="text-decoration: none; color: gray;" id="search-id">아이디 찾기</a> | 
            <a onclick="newPwdWindow();" style="text-decoration: none; color: gray;" id="search-pwd">비밀번호 찾기</a>

			<script>
               function newIdWindow() {
                   window.open('<%= request.getContextPath() %>/searchIdForm.me', 'popup', 'width=500,height=700,left=700,top=100,statusbar=no,location=no,menubar=no,scrollbars=no,resizable=no');
               }
               function newPwdWindow(){
                  window.open('<%= request.getContextPath() %>/searchPwdForm.me', 'popup',  'width=500,height=700,left=700,top=100,statusbar=no,location=no,menubar=no,scrollbars=no,resizable=no')
               }
            </script>
				

            <br><br>

            <a href="javascript:kakaoLogin()"><img src="resources/image/kakao_login_medium_narrow.png" style="width: 200px"></a>
        </div>
        <div class="login-footer">
            <div class="wrap">
                <div class="footer">
                    <ul id="footerL"><br>
                        <strong style="color: black;">이용약관    |    QNA     |    개인정보처리방침</strong> <br><br><br>
                        <strong style="color: black;">서울특별시 강남구 테헤란로 14길 6 남도빌딩</strong><br>
                        <strong style="color: black;">Tel. 02-1111-1111   |   Fax. 02-222-2222   |  사업자등록번호. 123-45-678910</strong><br><br>
                        <strong >Copyright @ 2024 PuppyFriends케어센터   |   반려견의 행복한 문화를 만들어요 All right reserved</strong>
                      
                    </ul>  
                    
                </div>
            </div>
        </div>
        <script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
        <script type="text/javascript">
            Kakao.init('6c59f1729524aa356d516aa3c7563c63');
            function kakaoLogin(){
                Kakao.Auth.login({
                    success: function(response){
                        Kakao.API.request({
                            url: '/v2/user/me',
                            success: function (response){
                                
                                let id = response.id
                                let nickname = response.properties.nickname
                                let email = response.kakao_account.email
                                
                                alert(JSON.stringify(response))
                                location.href="<%= request.getContextPath()%>/kakaologin?id=" + id + "&nickname=" + nickname + "&email=" + email;
                                                                    
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
</body>
</html>