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
    .mypage-board-header{height: 10%;}

    .mypage-board-header>div{float: left;}

    .board-title{
        width: 80%;
        height: 100%;
        padding-left: 15px;
    }
    .select-board{
        width: 20%;
        height: 100%;
        padding: 23px 0px;
    }
    select>*{text-align: center;}

    .line{
        margin-top: 20px;
        margin-bottom: 20px;
        border: 1px solid lightgray;

    }

    .mypage-board-content{height: 65%;}
    .mypage-board-content table{width: 100%;}
    .board-table{
        width: 95%;
        border-top: 2px solid lightgray;
        border-bottom: 2px solid lightgray;
    }
    .board-table th{
        padding: 15px 0px;
        font-size: 18px;
        border-bottom: 1px solid lightgray;
    }
    .board-table td{text-align: center;}

    .mypage-board-footer{height: 20%;}
    .search-board{
        width: 80%;
        position: relative;
        top: 130px;
    }
    
    .search-board>select{height: 30px;}
    .search-board input{width: 450px; height: 25px;}

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
    
                <div class="header-title"><h1>게시판</h1></div>
    
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
                    <div class="mypage-board-header">
                        <div class="board-title">
                            <h1>PuppyFriends | 게시판명</h1>
                        </div>
                        <div class="select-board">
                            <select name="" id="" style="width: 150px; height: 50px;">
                                <option value="notice">공지사항</option>
                                <option value="meeting">모임게시판</option>
                                <option value="none" selected>선택안함</option>
                            </select>
                        </div>
                    </div>

                    <div class="line"></div>

                    <div class="mypage-board-content" align="center">
                        <div class="board-table">
                            <table>
                                <tr>
                                    <th width="40px">No</th>
                                    <th width="570px">제목</th>
                                    <th width="100px">작성자</th>
                                    <th width="100px">작성일</th>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>🐱‍🐉제에목</td>
                                    <td>로긴 정보 사람 닉네임</td>
                                    <td>2024/03/05</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>🐕‍🦺즈에에ㅔ에에에에ㅔ에에에에ㅔ에에에ㅔ에에에에ㅔ에에에ㅔ에에에에에에목</td>
                                    <td>로긴 정보 사람 닉네임</td>
                                    <td>2024/02/03</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>🐈🐕으ㅔ에에에에ㅔ에에에ㅔ에에에ㅔ에에에ㅔ에에에ㅔ에에에ㅔ에에에ㅔ에에에ㅔㅇ목</td>
                                    <td>로긴 정보 사람 닉네임</td>
                                    <td>2024/01/01</td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td>🐩줴에에에ㅔ에에에ㅔ에에에에ㅔ에에에ㅔ에에에에에에ㅔ에에에에목</td>
                                    <td>로긴 정보 사람 닉네임</td>
                                    <td>2023/12/25</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    
                    <div class="mypage-board-footer" align="center">
                        <div class="search-board" >
                            <select name="" id="">
                                <option value="title">글 제목</option>
                                <option value="no">글 번호</option>
                                <option value="nickname">작성자</option>
                            </select>
                            <input type="text">
                            <button>검색</button>
                        </div>
                    </div>


                </div>

            </div>

        </div>
    </div>

    
	
</body>
</html>