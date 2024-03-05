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
    .mypage-content2{width: 80%; height: 100%;}

    .member-info, .select-reservation,
    .product-info, .board-info, .mileage-info{
        height: 20%;
        text-align: center;
        padding-top: 60px;
        cursor: pointer;
        border-bottom: 2px solid white;
    }
    
    .update-icon{margin-left: 50px;}

    .nickname-form{height: 50px;}
    .nickname-form>div{float: left;}

    .update-nickname-header{padding-left: 15px;}

    .nickname-form1{width: 10%; height: 100%; padding-top: 20px;}
    .nickname-form2{height: 100%; padding-top: 20px;}
    .nickname-form2>input{
        border-style: none;
        border-bottom-style: solid;
    }
    .update-nickname-button{margin-top: 20px; margin-left: 10px;}

    .line{height: 11px;
        border-style: none;
        border-bottom-style: solid;
        border-color: lightgray;
    }
    .pet-info{height: 180px;}
    .pet-info div{float: left;}
    .pet-info-header{width: 100%; height: 65px;}
    .pet-info-header>div{float: left;}
    .pet-info-name{padding-left: 15px; width: 30%; height: 100%;}
    .pet-significant{padding-left: 15px; width: 70%; height: 100%;}

    .pet-info-content{width: 100%; height: 115px;}
    tr input{
        border-style: none;
        border-bottom-style: solid;
    }
    .pet-name-value{width: 30%; height: 100%;}
    .pet-significant-text{
        width: 42%;
        height: 100%; 
    }
    .pet-significant-button{margin-top: 85px; margin-left: 10px;}

    .change-password-info{height: 31%;}
    .change-password-header{height: 19%;}
    .change-password-content{height: 81%;}
    

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
    
                <div class="header-title"><h1>회원 정보 조회</h1></div>
    
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
                    <div class="update-nickname-header"><h2><프로필 변경></h2></div>
                    <div class="update-icon fa-solid fa-circle-user fa-3x"></div>
                    <div class="nickname-form">
                        <div class="nickname-form1" align="center">닉네임</div>
                        <div class="nickname-form2">
                            <input type="text">
                        </div>
                        <div class="update-nickname-button">
                            <button>수정</button>
                        </div>
                    </div>

                    <div class="line"></div>
                    
                    <div class="pet-info">
                        <div class="pet-info-header">
                            <div class="pet-info-name"><h3><반려동물 정보></h3></div>
                            <div class="pet-significant"><h3><특이사항 및 자랑></h3></div>
                        </div>

                        <div class="pet-info-content">
                            <div class="pet-name-value">
                                <table style="padding-left: 15px;">
                                    <tr>
                                        <th width="50">이름</th>
                                        <td height="50"><input type="text"></td>
                                    </tr>
                                    <tr>
                                        <th>견종</th>
                                        <td><input type="text"></td>
                                    </tr>
                                </table>
                            </div>

                            <div class="pet-significant-text">
                                <textarea name="dogSgnificant" cols="50" rows="7" style="resize: none;" placeholder="내용을 입력해주세요."></textarea>
                            </div>
                            <div class="pet-significant-button">
                                <button>수정</button>
                            </div>
                        </div>
                    </div>
                    
                    <div class="line"></div>
                    
                    <div class="change-password-info">
                        <div class="change-password-header">
                            <h2><비밀번호 변경></h2>
                        </div>
                        <div class="change-password-content">
                            <table>
                                <tr>
                                    <th width="130" height="130">현재 비밀번호</th>
                                    <td><input type="password"></td>
                                </tr>
                                <tr>
                                    <th height="38px">새로운 비밀번호</th>
                                    <td><input type="password"></td>
                                </tr>
                                <tr>
                                    <th height="38">비밀번호 확인</th>
                                    <td><input type="password"></td>
                                    <td style="padding-left: 10px;"><button>변경</button></td>
                                </tr>
                                
                            </table>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>

    
	
</body>
</html>