<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    div{border: 1px solid white; box-sizing: border-box;}

    .mypage-wrap{width: 100%; height: 1000px;}    
    .mypage-form{height: 100%; width: 80%;}
    .mypage-header{height: 10%;}
    .mypage-menu-empty{height: 30%;} 
    .mypage-order{height: 25%; padding: 0; margin: 0;}
    .mypage-order li{
        float: left;
        padding: 0px 5px;
        height: 100%;
        /* border: 1px solid red; */
        list-style-type: none;
        margin: 0px;
    }
    
    .mypage-order a{
        /* border: 1px solid red; */
        text-decoration: none;
        font-size: 14px;
        color: black;
        width: 100%;
        height: 100%;
        display: block;
    }
    span{font-size: 14px;}

    .mypage-order a:hover{
        color: black;
        text-decoration: none;
    }

    .mypage-content{height: 90%; display: flex;}
    .mypage-select-zone{width: 15%;}
    .mypage-select-header{height: 10%;}
    .mypage-select-header>h2{text-align: left; margin-top: 20px;}
    .mypage-content-zone{width: 85%;}
    .line{border: 1px solid black; width: 100%;}
    
    .mypage-select-main{height: 90%;}
    .mypage-select-main>ul{
        /* border: 1px solid blue; */
        list-style-type: none;
        padding: 16px 0px;
        text-align: left;
        padding-left: 0px;
        height: 100%;

    }

    .mypage-select-main a{
        text-decoration: none;
        color:black;
        font-size: 16px;
        font-weight: 800;
    }

    .mypage-select-main li{margin-top: 40px;}
    .mypage-select-main a:hover{color: black;}

    .mypage-content-side{width: 98%; height: 100%; padding: 30px 0px;}
    .mypage-content-main{width: 95%; height: 100%; padding-top: 20px;}
    .input-row{
        width: 90%;
        height: 8%;  
        display: flex; 
        padding: 10px 16px;
        border-bottom: 1px solid #666666;
        
    }

    .input-title{
        width: 20%; 
        height: 100%;
        margin-right: 4px;
        padding-top: 4px;
        text-align: left;
        color:#666666;
    }

    .input-group{
        width: 90%; 
        height: 100%; 
        padding-right: 20px;
    }
    
    .input-group>input{
        flex: 1;
        border-style: none;
        background-color: #f6f6f6;
        border-radius: 5px;
    }

    .input-group-radio{
        width: 90%;
        height: 100%;
        padding-top: 7px;
        text-align: left;
        padding-left: 10px;
    }

    .change-pwd-button{height: 8%; margin-top: 40px;}
    .change-pwd-button>div{float: left;}

    .cancle-update-button, .register-update-button{width: 50%;height: 100%;}

    .cancle-update-button>button, .register-update-button>button{width: 40%;height: 100%;}

    .input-textbox{
        width: 90%;
    }
    .dogsignificant-box{
        width: 100%;
        height: 100%;
        border-radius: 5px;
        border-style: none;
        background-color: #f6f6f6;
        
    }



</style>
<script src="https://kit.fontawesome.com/d48d14d77f.js" crossorigin="anonymous"></script>

<script src="https://kit.fontawesome.com/d48d14d77f.js" crossorigin="anonymous"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
    
	 <%@ include file="../common/menubar.jsp" %>
	 
	 <%
	 	int memberNo = loginUser.getMemberNo();
	 	String memberId = loginUser.getMemberId(); // 아이디
	 	String memberName = loginUser.getMemberName(); // 회원이름
	 	String email = loginUser.getMemberEmail(); // 회원 이메일
	 	String phone = (loginUser.getMemberPhone()) == null ? "" : loginUser.getMemberPhone(); // 전화번호
	 	String dogName = loginUser.getDogName(); // 반려견 이름
	 	String dogValue = loginUser.getDogValue();// 반려견 종류
	 	int dogAge = loginUser.getDogAge();// 반려견 나이
	 	String dogGender = loginUser.getDogGender(); // 반려견 성별
	 	String dogSize = loginUser.getDogSize();
	 	String dogVaccine = loginUser.getDogVaccine(); // 반려견 접종
	 	String dogSig = loginUser.getDogSignificant(); // 반려견 특이사항
	 %>
	

     <form action="<%= contextPath %>/update.me" method="post">

     <div class="mypage-wrap" align="center">
        <div class="mypage-form">
            <div class="mypage-header">
                <div class="mypage-menu-empty"></div>
                <div class="mypage-order">
                    <li><a href="<%= request.getContextPath()%>">Home ></a></li>
                    <li><a href="<%= request.getContextPath()%>/mypage">Mypage ></a></li>
                    <li><span>회원정보수정</span></li>
                </div>
            </div>
            <div class="mypage-content">
                <div class="mypage-select-zone">
                    <div class="mypage-select-header">
                        <h2>MY PAGE</h2>
                    </div>
                    <div class="line"></div>
                    <div class="mypage-select-main">
                        <ul>
                            <li><a href="<%= request.getContextPath()%>/mypage">회원정보수정</a></li>
                            <li><a href="<%= request.getContextPath()%>/updatePwd">비밀번호변경</a></li>
                            <li><a href="<%= request.getContextPath()%>/mypageProduct">구매 내역 조회</a></li>
                            <li><a href="<%= request.getContextPath()%>/mypageReservation">예약 조회</a></li>
                            <li><a href="<%= request.getContextPath()%>/mypageBoard">내가 쓴 글</a></li>
                            <li><a href="javascript:"onclick="deleteMember();">회원탈퇴</a></li>
                        </ul>
                    </div>
                </div>
                <div class="mypage-content-zone">
                    <div class="mypage-content-side">
                        <div class="mypage-content-main">
	
                            <input type="hidden" name="memberNo" value="<%= memberNo %>">

                            <div class="input-row">
                                <div class="input-title">
                                    <b>아이디</b>
                                </div>
                                <div class="input-group">
                                    <input type="text" readonly name="memberId" value="<%= memberId %>">
                                </div>
                            </div>
                            <div class="input-row">
                                <div class="input-title">
                                    <b>이름</b>
                                </div>
                                <div class="input-group">
                                    <input type="text" readonly name="memberName" value="<%= memberName %>">
                                </div>
                            </div>
                            <div class="input-row">
                                <div class="input-title">
                                    <b>이메일</b>
                                </div>
                                <div class="input-group">
                                    <input type="text" name="memberEmail" value="<%= email %>">
                                </div>
                            </div>
                            <div class="input-row">
                                <div class="input-title">
                                    <b>전화번호</b>
                                </div>
                                <div class="input-group">
                                    <input type="text" name="memberPhone" value="<%= phone %>">
                                </div>
                            </div>
                            <div class="input-row">
                                <div class="input-title">
                                    <b>반려견 이름</b>
                                </div>
                                <div class="input-group">
                                    <input type="text" name="dogName" value="<%= dogName %>">
                                </div>
                            </div>
                            <div class="input-row">
                                <div class="input-title">
                                    <b>반려견 견종</b>
                                </div>
                                <div class="input-group">
                                    <input type="text" name="dogValue" value="<%= dogValue %>">
                                </div>
                            </div>
                            <div class="input-row">
                                <div class="input-title">
                                    <b>반려견 나이</b>
                                </div>
                                <div class="input-group">
                                    <input type="text" name="dogAge" value="<%= dogAge %>">
                                </div>
                            </div>
                            <div class="input-row">
                                <div class="input-title">
                                    <b>반려견 성별</b>
                                </div>
                                <div class="input-group-radio">
                                    <input type="radio" name="dogGender" id="male" value="M"
                                    <% if(dogGender.equals("M")) { %>
                                        checked	
                                    <% } %>
                                    > 남아
                                        
                                    <input type="radio" name="dogGender" id="female" value="F"
                                    <% if(dogGender.equals("F")) { %>
                                        checked	
                                    <% } %>
                                    > 여아
                                </div>
                            </div>
                            
                            <div class="input-row">
                                <div class="input-title">
                                    <b>반려견 크기</b>
                                </div>
                                <div class="input-group-radio">
                                    <input type="radio" name="dogSize" id="" value="S"
                                    <% if(dogSize.equals("S")) { %>
                                        checked	
                                    <% } %>
                                    > 소형견
                                    <input type="radio" name="dogSize" id="" value="M"
                                    <% if(dogSize.equals("M")) { %>
                                        checked	
                                    <% } %>
                                    > 중형견
                                    <input type="radio" name="dogSize" id="" value="L"
                                    <% if(dogSize.equals("L")) { %>
                                        checked	
                                    <% } %>
                                    > 대형견
                                </div>
                            </div>
                            <div class="input-row">
                                <div class="input-title" style="font-size: 14px;">
                                    <b >필수 예방 접종 여부</b>
                                </div>
                                <div class="input-group-radio">
                                    <input type="radio" name="dogVaccine" value="Y"
                                    <% if(dogVaccine.equals("Y")) { %>
                                        checked	
                                        <% } %>
                                        > O
                                        <input type="radio" name="dogVaccine" value="N"
                                        <% if(dogVaccine.equals("N")) { %>
                                        checked	
                                        <% } %>
                                        > X
                                    </div>
                                </div>
                                <div class="input-row" style="height: auto;">
                                    <div class="input-title">
                                        <b>특이사항</b>
                                    </div>
                                    <div class="input-textbox">
                                        <textarea class="dogsignificant-box" name="dogSignificant" style="resize: none;"><%= dogSig %></textarea>
                                        
                                    </div>
                                </div>
                                
                                
                                <div class="change-pwd-button">
                                    <div class="register-update-button">
                                        <button class="btn btn-primary btn-lg">저장</button>
                                    </div>
                                    <div class="cancle-update-button ">
                                        <button type="button" onclick="location.href='<%= contextPath %>'" class="btn btn-danger btn-lg">취소</button>
                                    </div>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
     </div>
     
     </form>


     
   
</body>
</html>