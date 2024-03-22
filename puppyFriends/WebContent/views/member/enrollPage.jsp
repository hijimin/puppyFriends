<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/d48d14d77f.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<style>

    .enroll-form-wrap{height: 800px;}

    div{
        box-sizing: border-box; border: 1px solid white;
     }
 
     .enroll-form{
        width: 25%;
        height: 100%;
        margin: auto;
     }

     .enroll-form-header{height: 10%;}
     h1{cursor: pointer;}
     .enroll-form-content{height: 90%; border: 1px solid lightgray;}
     .enroll-form-content1{
        width: 90%;
        height: 83%;
        margin: auto;
        margin-top: 30px;
    }

    .enroll-picture{
        width: 15%;
        height: 10%;
        margin: auto;
    }

    .enroll-member{
        text-align: center;
        font-size: 18px;
    }

    .enroll-member>div{height: 30px; float: left;}
    .enroll-member-radio{width: 50%; height: 100%;}
    .enroll-trainer-radio{width: 50%; height: 100%;}

    
    .enroll-member-idpwd{
        width: 100%;
        height: 150px;
        /* border: 2px solid lightgray; */
        border-radius: 5px;
    }

    

    /* id 입력  */
    .id-input{
        height: 33%;
        border: 2px solid lightgray;
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
        
    }

    .id-input>div{float: left;}
    .user-icon{width: 15%; height: 100%; padding-top: 10px;}
    .id-input-window{width: 85%; height: 100%;}
    .id-input-window>input{
        width: 100%;
        height: 100%;
        box-sizing: border-box;
        border: none;
    }

    /* pwd 입력 */
    .pwd-input{
        height: 33%;
        border: 2px solid lightgray;
        border-top: none;
    }

    .pwd-input>div{float: left;}
    .pwd-icon{width: 15%; height: 100%; padding-top: 10px;}
    .pwd-input-window{width: 85%; height: 100%;}
    .pwd-input-window>input{
        width: 100%;
        height: 100%;
        box-sizing: border-box;
        border: none;
    }
    
    /* checkpwd */
    .check-input{
        height: 33%;
        /* border: 2px solid lightgray; */
        border-bottom-left-radius: 5px;
        border-bottom-right-radius: 5px;

        border: 2px solid lightgray;
        border-top: none;

    }
    .check-input>div{float: left;}
    .check-icon{width: 15%; height: 100%; padding-top: 10px;}
    .check-input-window{width: 85%; height: 100%;}
    .check-input-window>input{
        width: 100%;
        height: 100%;
        box-sizing: border-box;
        border: none;
    }
    
    .enroll-member-info{
        width: 100%;
        height: 150px;
        /* border: 2px solid lightgray; */
        border-radius: 5px;
    }

    .name-input{
        height: 33%;
        border: 2px solid lightgray;
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;

    }
    .phone-input, .email-input{
        height: 33%;
        border: 2px solid lightgray;
        border-top: none;
    }
    .phone-input{
        border-bottom-left-radius: 5px;
        border-bottom-right-radius: 5px;
    }



    .name-input>div, .email-input>div, .phone-input>div{float: left;}
    .name-icon, .email-icon, .phone-icon{
        width: 15%;
        height: 100%;
        padding-top: 10px;
    }
    .name-input-window, .email-input-window, .phone-input-window{
        width: 85%;
        height: 100%;
    }
    .name-input-window>input, .email-input-window>input, .phone-input-window>input{
        box-sizing: border-box;
        width: 100%;
        height: 100%;
        border: none;
    }
    
    .empty-space{height: 200px;}
    .next-button{
        width: 100%;
        height: 50px;
    }

    .enroll-form-footer{
        width: 90%;
        height: 8%;
        margin: auto;
    }

    input[type=submit]{
        width: 100%;
        height: 100%;
        border-radius: 5px;
        border: 0px;
        background-color: rgb(255, 222, 239);    
        color: white;
    }

    .id-check, .pwd-check, .name-check, .email-check, .phone-check, .pwd-confirm{
        display:none;
        color:red;
        
    }
    
    /* .id-input-window>input::placeholder{
        color: #ff3f3f;
    } */

    .changeplaceholder::-webkit-input-placeholder { /* WebKit, Blink, Edge */
      color:    #ff3f3f;
    }

    .changeplaceholder2::-webkit-input-placeholder { /* WebKit, Blink, Edge */
      color:    black;
    }
</style>



</head>
<body>

    <div class="enroll-form-wrap">
        <div class="enroll-form">
            <div class="enroll-form-header">
                <h1 onclick="location.href='<%= request.getContextPath() %>'">PUPPY FRIENDS</h1>
            </div>
            <div class="enroll-form-content">
                <div class="enroll-form-content1">
                    <div class="enroll-picture">
                        <i class="fa-solid fa-user fa-3x"></i>
                    </div>

                    <br>
					<form action="<%= request.getContextPath()%>/enroll-form.dog" method="post">
	                    <div class="enroll-member-idpwd" align="center">
                            <div class="id-input">
                                <div class="user-icon">
                                    <i class="fa-regular fa-user fa-2x"></i>
                                </div>
                                <div class="id-input-window">
                                    <input type="text" name="memberId" placeholder="아이디 *" required ><br>
                                </div>
                            </div>
                            <div class="pwd-input">
                                <div class="pwd-icon">
                                    <i class="fa-solid fa-key fa-2x"></i>
                                </div>
                                <div class="pwd-input-window">
                                    <input type="password" id="memberPwd" name="memberPwd" placeholder="비밀번호 *" required><br>
                                </div>
                            </div>
                            <div class="check-input">
                                <div class="check-icon">
                                    <i class="fa-solid fa-lock fa-2x"></i>
                                </div>
                                <div class="check-input-window">
                                    <input type="password" id="checkPwd" name="checkPwd" placeholder="비밀번호 확인" required>
                                </div>
                            </div>
	                    </div>
                        <div class="id-check"></div>
                        <div class="pwd-check"></div>
                        <div class="pwd-confirm"></div>
                        
	                    <br>
	                    
	                    <div class="enroll-member-info" align="center">
                            <div class="name-input">
                                <div class="name-icon">
                                    <i class="fa-regular fa-user fa-2x"></i>
                                </div>
                                <div class="name-input-window">
                                    <input type="text" id="memberName" name="memberName" placeholder="이름 *" required >
                                </div>
                            </div>
                            <div class="email-input">
                                <div class="email-icon">
                                    <i class="fa-solid fa-envelope fa-2x"></i>
                                </div>
                                <div class="email-input-window">
                                    <input type="text" id="memberEmail" name="memberEmail" placeholder="이메일 *" required >
                                </div>
                            </div>
                            <div class="phone-input">
                                <div class="phone-icon">
                                    <i class="fa-solid fa-mobile-button fa-2x"></i>
                                </div>
                                <div class="phone-input-window">
	                                <input type="text" id="memberPhone" name="memberPhone" placeholder="전화번호 *" required>
                                </div>
                            </div>
	                    </div>
                        <div class="name-check"></div>
                        <div class="email-check"></div>
                        <div class="phone-check"></div>
                        <div class="empty-space"></div>
                        
                    </div>
                    <div class="enroll-form-footer">
                        <input type="submit" id="enroll-button" value="다음" class="next-page-button">
                    </div>
                </form>
            </div>
            
        </div>
    </div>
        

<script>
    $(function(){
        // id 입력시
        $(".id-input-window>input").focus(function(){
            $(".id-input").css("border", "2px solid rgb(255, 222, 239)");
        });

        var userIdCheck = RegExp(/^[A-Za-z0-9]{5,11}$/);
        $(".id-input-window>input").keyup(function(){
            if(!userIdCheck.test($(".id-input-window>input").val())){
                $(".id-check").html("·아이디 : 대/소문자, 숫자로 5~11자리까지 가능합니다.").css({display:"block", fontSize:"12px"});
                $(".id-input").css("border", "2px solid #ff3f3f");
                $(".id-input-window>input").addClass("changeplaceholder").css({textDecoration:"underline", color:"#ff3f3f"});
            }
        });


        // 아이디 없이 비밀번호만 입력시
        $(".pwd-input-window>input").focus(function(){
            $(".pwd-input").css("border", "2px solid rgb(255, 222, 239)").css("border-top", "none");
            
            if($(".id-input input").val() == ""){
                $(".id-check").html("·아이디 : 필수 정보입니다.").css({display:"block", fontSize:"12px"});
                $(".id-input").css("border", "2px solid #ff3f3f");
                $(".id-input-window>input").addClass("changeplaceholder").css({textDecoration:"underline", color:"#ff3f3f"});

            }else{ // id 입력창에 무언가 있을때 아이디 검사

                if(!userIdCheck.test($(".id-input-window>input").val())){
                    $(".id-check").html("·아이디는 : 대/소문자, 숫자로 5~11자리까지 가능합니다.").css({display:"block", fontSize:"12px"});
                    $(".id-input").css("border", "2px solid #ff3f3f");
                    $(".id-input-window>input").addClass("changeplaceholder").css({textDecoration:"underline", color:"#ff3f3f"});
                }else{
                    $(".id-check").css("display", "none");
                    $(".id-input").css("border", "2px solid rgb(255, 222, 239)");
                    $(".id-input-window>input").addClass("changeplaceholder2").css({textDecoration:"none", color:"black"});
                }
                
            }
            
        });
        
        var userPwdCheck = RegExp(/^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/);

        // 비밀번호 입력시
        $(".pwd-input-window>input").keyup(function(){
            if(!userPwdCheck.test($(".pwd-input-window>input").val())){
                $(".pwd-check").html("·비밀번호 : 소문자, 숫자, 특수문자를 포함한 8~16자리로 만들어야합니다.").css({display:"block", fontSize:"12px"});
                $(".pwd-input").css("border", "2px solid #ff3f3f");
                $(".pwd-input-window>input").addClass("changeplaceholder").css({textDecoration:"underline", color:"#ff3f3f"});
            }
        });

        // 비밀번호 없이 일치 여부 확인시
        $(".check-input-window>input").focus(function(){
            $(".check-input").css({border:"2px solid rgb(255, 222, 239)", borderTop:"none"})

            if($(".pwd-input input").val() == ""){
                $(".pwd-check").css("display", "block").html("·비밀번호 : 필수 정보입니다.");
                $(".pwd-input").css({border:"2px solid #ff3f3f"});
                $(".pwd-input-window>input").addClass("changeplaceholder").css({textDecoration:"underline", color:"#ff3f3f"});
                $(".id-input").css("border-bottom", "none");

            }else{ // pwd 입력창에 무언가 있을 때 pwd 검사
                if(!userPwdCheck.test($(".pwd-input-window>input").val())){
                    $(".pwd-check").html("·비밀번호 : 소문자, 숫자, 특수문자를 포함한 8~15자리로 만들어야합니다.").css({display:"block", fontSize:"12px"});
                    $(".pwd-input").css({border:"2px solid #ff3f3f"});
                    $(".pwd-input-window>input").addClass("changeplaceholder").css({textDecoration:"underline", color:"#ff3f3f"});
                }else{
                    $(".pwd-check").css("display", "none");
                    $(".pwd-input").css({border:"2px solid rgb(255, 222, 239)", borderTop:"none"});
                    $(".pwd-input-window>input").addClass("changeplaceholder2").css({textDecoration:"none", color:"black"});
                }
              
            }
        })

        // 비밀번호 확인 입력시 비밀번호 확인창 변경
        $(".pwd-input-window>input, .check-input-window>input").keyup(function(){
            let pwd1 = $("#memberPwd").val();
            let pwd2 = $("#checkPwd").val();
            if(pwd1 != "" || pwd2 != ""){
                if(pwd1 == pwd2){
                    $(".pwd-confirm").html("·비밀번호가 일치합니다").css({display:"block", color:"green"});
                    $(".check-input").css({border:"2px solid rgb(255, 222, 239)"});
                }else{
                    $(".pwd-confirm").html("·비밀번호가 일치하지 않습니다").css({display:"block", color:"red", fontSize:"12px"});
                    $(".check-input").css({border:"2px solid #ff3f3f"});
                }
            }
        })


        
    

        // name 입력
        $("#memberName").focus(function(){
            $(".name-input").css("border", "2px solid rgb(255, 222, 239)");
        });

        var nameCheck = RegExp(/^[가-힣]{2,6}$/);
        $("#memberName").keyup(function(){
            if(!nameCheck.test($("#memeberName").val())){
                $(".name-check").html("·이름 : 한글로 2~6글자로 입력해주세요.").css({display:"block", fontSize:"12px"});
                $(".name-input").css("border", "2px solid #ff3f3f");
                $("#memberName").addClass("changeplaceholder").css({textDecoration:"underline", color:"#ff3f3f"});
            }
        });



        // name 없이 email 입력
        $("#memberEmail").focus(function(){
            $(".email-input").css("border", "2px solid rgb(255, 222, 239)").css("border-top", "none");
            
            if($("#memberName").val() == ""){
                $(".name-check").html("·이름 : 필수 정보입니다.").css({display:"block", fontSize:"12px"});
                $(".name-input").css("border", "2px solid #ff3f3f");
                $(".name-input-window>input").addClass("changeplaceholder").css({textDecoration:"underline", color:"#ff3f3f"});
                
            }else{ // name 입력창에 무언가 있을때 아이디 검사

                if(!nameCheck.test($("#memberName").val())){
                    $(".name-check").html("·이름 : 한글로 2~6글자로 입력해주세요.").css({display:"block", fontSize:"12px"});
                    $(".name-input").css("border", "2px solid #ff3f3f");
                    $("#memberName").addClass("changeplaceholder").css({textDecoration:"underline", color:"#ff3f3f"});
                }else{ // name 정규식에 일치 할 시
                    $(".name-check").css("display", "none");
                    $(".name-input").css("border", "2px solid rgb(255, 222, 239)");
                    $("#memberName").addClass("changeplaceholder2").css({textDecoration:"none", color:"black"});
                }

                }
        });

        // email 입력
        var emailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
        $("#memberEmail").keyup(function(){
            if(!emailCheck.test($("#memberEmail").val())){
                $(".email-check").html("·이메일 : 형식에 맞게 작성해주세요").css({display:"block", fontSize:"12px"});
                $(".email-input").css("border", "2px solid #ff3f3f");
                $("#memberEmail").addClass("changeplaceholder").css({textDecoration:"underline", color:"#ff3f3f"});
            }
        });


        // email 값 없이 phone 입력
        $("#memberPhone").focus(function(){
            $(".phone-input").css({border:"2px solid rgb(255, 222, 239)", borderTop:"none"})

            if($("#memberEmail").val() == ""){
                $(".email-check").html("·이메일 : 필수 정보입니다.").css({display:"block", fontSize:"12px"});
                $(".email-input").css("border", "2px solid #ff3f3f");
                $("#memberEmail").addClass("changeplaceholder").css({textDecoration:"underline", color:"#ff3f3f"});
                $(".name-input").css("border-bottom", "none")
            }else{ // 이메일에 값이 있을 때
                
                if(!emailCheck.test($("#memberEmail").val())){
                    $(".email-check").html("·이메일 : 형식에 맞게 작성해주세요").css({display:"block", fontSize:"12px"});
                    $(".email-input").css("border", "2px solid #ff3f3f");
                    $("#memberEmail").addClass("changeplaceholder").css({textDecoration:"underline", color:"#ff3f3f"});
                }else{ // email 정규식에 일치 할 시
                    $(".email-check").css("display", "none");
                    $(".email-input").css("border", "2px solid rgb(255, 222, 239)");
                    $("#memberEmail").addClass("changeplaceholder2").css({textDecoration:"none", color:"black"});
                }

            }
        });


        // phone 입력
        var phoneCheck = RegExp(/(01[016789])+-([1-9]{1}[0-9]{2,3})+-([0-9]{4})$/);
        $("#memberPhone").keyup(function(){
            if(!phoneCheck.test($("#memberPhone").val())){
                $(".phone-check").html("·전화번호 : 형식에 맞게 작성해주세요").css({display:"block", fontSize:"12px"});
                $(".phone-input").css("border", "2px solid #ff3f3f");
                $("#memberPhone").addClass("changeplaceholder").css({textDecoration:"underline", color:"#ff3f3f"});
            }else{ // 형식에 맞게 처리 했을 때
                $(".phone-check").css("display", "none");
                $(".phone-input").css("border", "2px solid rgb(255, 222, 239)");
                $("#memberPhone").addClass("changeplaceholder2").css({textDecoration:"none", color:"black"});
            }

        });

    
        
    })
</script>




</body>
</html>