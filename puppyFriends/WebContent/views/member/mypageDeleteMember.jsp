<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    div{border: 1px solid red; box-sizing: border-box;}

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
    .mypage-content-main{
        width: 95%; 
        height: 90%; 
    }


</style>    
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
	
     <div class="mypage-wrap" align="center">
        <div class="mypage-form">
            <div class="mypage-header">
                <div class="mypage-menu-empty"></div>
                <div class="mypage-order">
                    <li><a href="">Home ></a></li>
                    <li><a href="">Mypage ></a></li>
                    <li><span>비밀번호변경</span></li>
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
                            <li><a href="javascript:"onclick="">회원탈퇴</a></li>
                        </ul>
                    </div>
                </div>
                <div class="mypage-content-zone">
                    <div class="mypage-content-side">
                        <div class="mypage-content-main">
                           

                        </div>
                    </div>
                </div>
            </div>
        </div>
     </div>
</body>
</html>