<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{box-sizing: border-box; border: 1px solid red;}

    .mypage-wrap{height: 1000px;}

    .mypage-sidespace{
        width: 60%;
        height: 100%;
        margin: auto;
        border: 1px solid lightgray;
    }

    .mypage-header{height: 100px; border-bottom: 2px solid lightgray;}

    .mypage-header>div{float: left;}

    .header-logo{
        height: 100%;
        width: 20%;
        background-color: rgb(255, 222, 239);
        cursor: pointer;
    }
    .header-logo>h2{margin-top: 25px; text-align: center;}

    .header-title{width: 55%; height: 100%;}
    .header-title>h1{margin-left: 17px; margin-top: 20px;}

    .header-info{width: 25%; height: 100%; }
    .header-info>div{float: right;}
    
    .info-alram, .info-user{
        width: 50px;
        height: 50px;
        margin-top: 20px;
        
    }
    .info-alram{margin-right: 20px; margin-top: 28px;}
    
    .mypage-content{width: 100%; height: 900px;}
    .mypage-content>div{float: left;}
    .mypage-content1{width: 20%; height: 100%; background-color: rgb(255, 222, 239);}
    .mypage-content2{width: 80%; height: 100%; padding-left: 20px;}

    .member-info, .select-reservation,
    .product-info, .board-info, .mileage-info{
        height: 20%;
        text-align: center;
        padding-top: 60px;
         cursor: pointer;
        border-bottom: 2px solid white;
    }

    .mileage-header{
        width: 95%;
        height: 40%;
        border-bottom: 2px solid lightgray;
        margin-bottom: 15px;
    }
    .mileage-title{height: 20%;}
    .mileage-content{height: 60%;}
    .confirm-mileage{width: 60%; height: 80%; }
    .mileage-history{
        width: 95%;
        height: 58%;
    }
    .mileage-history-header{
        height: 10%;
        
    }
    ul>li{text-align: center;}
    li>a{
        text-decoration: none;
        color: black;
    }
</style>
<script src="https://kit.fontawesome.com/d48d14d77f.js" crossorigin="anonymous"></script>

</head>
<body>
    
	<div class="mypage-wrap">
        <div class="mypage-sidespace">
            <div class="mypage-header">
                <div class="header-logo">
                    <h2 onclick="location.href='<%= request.getContextPath() %>'">PUPPYFRIENDS</h2>
                </div>
    
                <div class="header-title"><h1>마일리지</h1></div>
    
                <div class="header-info">
                    <div class="info-user">
                        <i class="fa-regular fa-circle-user fa-3x"></i>
                    </div>
                    <div class="info-alram">
                        <i class="fa-solid fa-bell fa-2x"></i>
                    </div>
                </div>
            </div>
    
            <div class="mypage-content">
                <div class="mypage-content1">
                    <div class="member-info" onclick="location.href='<%=request.getContextPath()%>/mypage'"><h2>회원</h2></div> 
                    <div class="select-reservation" onclick="location.href='<%=request.getContextPath()%>/confirmReservation'"><h2>예약 조회</h2></div>
                    <div class="product-info" onclick="location.href='<%=request.getContextPath()%>/confirmProduct'"><h2>상품</h2></div> 
                    <div class="board-info" onclick="location.href='<%=request.getContextPath()%>/confirmBoard'"><h2>게시판</h2></div>
                    <div class="mileage-info" onclick="location.href='<%=request.getContextPath()%>/confirmMileage'"><h2>쿠폰함</h2></div>
                </div>
                <div class="mypage-content2">
                    <div class="mileage-header">
                        <div class="mileage-title"><h2><내 마일리지></h2></div>
                        <div class="mileage-content">
                            <div class="confirm-mileage">
                                <table>
                                    <tr>
                                        <td><h3>보유 마일리지</h3></td>
                                    </tr>
                                    <tr>
                                        <td><h1>nn,nnn 원</h1></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="mileage-history">
                        <div class="mileage-history-header">
                            <ul>
                                <li><a href="">적립내역</a></li>
                                <li><a href="">사용내역</a></li>
                                <li><a href="">소멸내역</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                
            </div>

        </div>
    </div>

    
	
</body>
</html>