<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{box-sizing: border-box; border: 1px solid white;}

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
    .mypage-content2{width: 80%; height: 100%;}

    .member-info, .select-reservation,
    .product-info, .board-info, .mileage-info{
        height: 20%;
        text-align: center;
        padding-top: 60px;
        cursor: pointer;
        border-bottom: 2px solid white;
    }
    
    .reservation-header{height: 7%;}
    .reservation-title{height: 100%; padding-left: 20px;}

    .line{
        margin-top: 20px;
        margin-bottom: 20px;
        border: 1px solid lightgray;

    }

    .line2{
        margin-top: 70px;
        margin-bottom: 70px;
        border: 1px solid black;
    }

    .hotel-reservation-space{
        height: 300px;
    }

    .hotel-reservation-title{height: 10%; padding-left: 20px; padding-bottom: 40px;}
    .hotel-reservation-content{height: 90%;}
    .hotel-reservation-content th{
        border-bottom: 1px solid lightgray;
    }

    .table-content>td{border-bottom: 1px solid lightgray;}
    
    .hotel-reservation-content>table{
        border-top: 2px solid lightgray;
        border-bottom: 2px solid lightgray;
        text-align: center;
    }



    /* -------------------------------------------------------------------------------------------- */



    .class-reservation-space{
        height: 300px;
    }

    .class-reservation-title{height: 10%; padding-left: 20px; padding-bottom: 40px;}
    .class-reservation-content{height: 90%;}
    .class-reservation-content th{
        border-bottom: 1px solid lightgray;
    }

    .table-content>td{border-bottom: 1px solid lightgray;}
    
    .class-reservation-content>table{
        border-top: 2px solid lightgray;
        border-bottom: 2px solid lightgray;
        text-align: center;
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
    
                <div class="header-title"><h1>호텔 / 클래스 조회</h1></div>
    
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
                    <div class="reservation-header">
                        <div class="reservation-title">
                            <h2>예약 내역 조회</h2>
                        </div>
                        
                        
                        <div class="line"></div>

                        <div class="hotel-reservation-space">
                            <div class="hotel-reservation-title">상품 주문내역(호텔)</div>
                            <div class="hotel-reservation-content">
                                <table style="width: 100%; height: 100%;">
                                    <tr>
                                        <th>이미지</th>
                                        <th>상품정보</th>
                                        <th>예약일자</th>
                                        <th>금액</th>
                                        <th>접수상태</th>
                                    </tr>

                                    <tr class="table-content">
                                        <td>이미지가 들어갈 자리</td>
                                        <td>A호텔</td>
                                        <td>2024년 00월 00일 ~ 2024년 00월 00일</td>
                                        <td>109,000원</td>
                                        <td>예약 확정</td>
                                    </tr>
                                    <tr>
                                        <td colspan="4"></td>
                                        <td><button>예약 취소</button></td>
                                    </tr>
                                </table>
                            </div>

                            <div class="line2"></div>
                            <div class="line"></div>

                            <div class="class-reservation-space">
                                <div class="class-reservation-title">상품 주문내역(클래스)</div>
                                <div class="class-reservation-content">
                                    <table style="width: 100%; height: 100%;">
                                        <tr>
                                            <th>이미지</th>
                                            <th>상품정보</th>
                                            <th>예약일자</th>
                                            <th>금액</th>
                                            <th>접수상태</th>
                                        </tr>
    
                                        <tr class="table-content">
                                            <td>이미지가 들어갈 자리</td>
                                            <td>A호텔</td>
                                            <td>2024년 00월 00일 ~ 2024년 00월 00일</td>
                                            <td>109,000원</td>
                                            <td>예약 확정</td>
                                        </tr>
                                        <tr>
                                            <td colspan="4"></td>
                                            <td><button>예약 취소</button></td>
                                        </tr>
                                    </table>
                                </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>

    
	
</body>
</html>