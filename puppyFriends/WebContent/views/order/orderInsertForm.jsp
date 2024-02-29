<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{
        box-sizing: border-box; 
        border: 1px solid red;
    }
    
    body{
        margin: 0px;
    }   
    
    #content{
      /* width: 1903px; */
      margin: auto;
      width: 1600px;
      min-width: 1000px;
      height: auto;
      display: flex;
      justify-content: center;
      flex-direction: column;
    }

    #content>div{width: 100%;}

    #content1{
        height: auto;
        /* border-bottom: solid 1px rgb(180, 179, 179); */
    }

    /*상품주문내역*/
    #content1>div{width: 100%;}
    #content1_1{height: 30px; border-bottom: 1px solid rgb(180, 179, 179);}
    #content1_2{height: auto;}
    
    #content1_2>div{width: 100%;}
    #content1_2a{
        height: auto;
        border-bottom: 1px solid lightgray;
    }
    #content1_2b{height: auto;}
    #content1_2c{
        height: 40px;
        border-top: 1px solid lightgray;
    }




    /*주문정보*/
    #content2{height: 300px;}
    
    #content2>div{width: 100%;}
    #content2_1{height: 20%;}
    #content2_2{height: 80%;}

    .required{
        display: block;
        margin-block-start: 1em;
        margin-block-end: 1em;
        margin-inline-start: 0px;
        margin-inline-end: 0px;
        text-align: right;
    }

    /*배송정보*/
    #content3{
        height: 400px;
    }
    #content3>div{width: 100%;}
    #content3_1{height: 20%;}
    #content3_2{height: 80%;}

    /*결제수단*/
    #content4{
        height: 200px;
    }

    #content4>div{width: 100%;}
    #content4_1{height: 20%;}
    #content4_2{height: 80%;}

    /*최종결제 확인*/
    #content5{
        height: 200px;
    }
    #content5>div{width: 100%;}
    #content5_1{height: 20%;}
    #content5_2{height: 80%;}

    #content6{
        height: 200px;
    }
    #content6_1{
        width: 1300px; 
        height: 120px;
        margin: auto;
        margin-top: 50px;
    }

    .list-area{
        text-align: center;
    }
</style>
</head>
<body>
	
	<%@ include file="../common/menubar.jsp" %>
	
	<div id="content">
        <div id="content1">
            <div id="content1_1">
                <p>상품주문내역</p>
            </div>
            <div id="content1_2">
                <div id="content1_2a">
                    <table class="list-area" align="center">
                        <thead>
                            <tr>
                                <th>이미지</th>
                                <th width="600">상품정보</th>
                                <th width="50">수량</th>
                                <th width="100">배송구분</th>
                                <th width="100">배송비</th>
                                <th>판매가</th>
                            </tr>
                        </thead>
                    
                </div>
                <div id="content1_2b">
                    <tbody>
                        <tr>
                            <td>
                                <input type="checkbox" name="plist" value="상품번호">
                                <label for="product"><img src="https://pethroom.com/web/product/medium/202203/d8a532a1c4e90f4b81f2b727e6a2fed1.jpg" width="100" height="100"></label>
                            </td>
                            <td>치카치카셋트</td>
                            <td>1개</td>
                            <td>기본배송</td>
                            <td>3,000원</td>
                            <td>10,000원</td>
                        </tr>

                        <tr>
                            <td>
                                <input type="checkbox" name="plist" value="상품번호">
                                <label for="product"><img src="https://pethroom.com/web/product/medium/202203/d8a532a1c4e90f4b81f2b727e6a2fed1.jpg" width="100" height="100"></label>
                            </td>
                            <td>치카치카셋트</td>
                            <td>1개</td>
                            <td>기본배송</td>
                            <td>3,000원</td>
                            <td>10,000원</td>
                        </tr>

                        <tr>
                            <td>
                                <input type="checkbox" name="plist" value="상품번호">
                                <label for="product"><img src="https://pethroom.com/web/product/medium/202203/d8a532a1c4e90f4b81f2b727e6a2fed1.jpg" width="100" height="100"></label>
                            </td>
                            <td>치카치카셋트</td>
                            <td>1개</td>
                            <td>기본배송</td>
                            <td>3,000원</td>
                            <td>10,000원</td>
                        </tr>

                        <tr>
                            <td>
                                <input type="checkbox" name="plist" value="상품번호">
                                <label for="product"><img src="https://pethroom.com/web/product/medium/202203/d8a532a1c4e90f4b81f2b727e6a2fed1.jpg" width="100" height="100"></label>
                            </td>
                            <td>치카치카셋트</td>
                            <td>1개</td>
                            <td>기본배송</td>
                            <td>3,000원</td>
                            <td>10,000원</td>
                        </tr>

                        
                    </tbody>
                </div>
            </table>
                
                    <div id="content1_2c">                       
                        <span>선택삭제</span> <span>상품금액</span> <span>10000원</span>                  
                    </div>
               
                

            </div>
        </div>
     
        <div id="content2">
            <div id="content2_1">
                <h6>주문 정보</h6>
                <p class="required">
                    <img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif">필수 입력사항
                </p>
            </div>

            <div id="content2_2"> <!-- 주문하시는분 -->
                <table border="1" summary>
                    <colgroup>
                        <col style="width: 139px;">
                        <col style="width: auto;">
                    </colgroup>

                    <tbody class="address_form">
                        <tr>
                            <th scope="row">
                                주문하시는분
                                <img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif">
                            </th>
                            <td>
                                <input type="text" placegolder size="15">
                            </td>
                        </tr>

                        <tr>
                            <th scope="row">
                                휴대전화
                                <img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif">
                            </th>

                            <td>
                                <select name="phone" id="phone">
                                    <option value="010">010</option>
                                    <option value="011">011</option>
                                    <option value="018">018</option>
                                </select>
                                -
                                <input type="text" name="phone">
                                -
                                <input type="text" name="phone">
                            </td>
                        </tr>
                    </tbody>

                    <tbody class="email">
                        <tr>
                            <th>
                                이메일
                                <img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif">
                            </th>

                            <td>
                                <input type="text" id="email1" name="email1">
                                @
                                <input type="text" id="email2" name="email2" readonly>

                                <select name="email3" id="email3">
                                    <option value selected="selected">이메일 선택</option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="daum.net">daum.net</option>
                                    <option value="google.com">google.com</option>
                                    <option value="etc">직접입력</option>
                                </select>
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </div>


        <div id="content3">
            <div id="content3_1" class="title">
                <h6>배송 정보</h6>
                <p class="required">
                    <img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif">
                    필수입력사항
                </p>
            </div>

            <div id="content3_2">
                <table border="1">
                    <colgroup>
                        <col style="width: 139px;">
                        <col style="width: auto;">                    
                    </colgroup>

                    <tbody>
                        <tr>
                            <th>배송지선택</th>
                            <td>
                                <div class="address">
                                    <input type="radio" name="sameaddr">
                                    <label for="sameaddr0">주문자 정보와 동일</label>
                                    <input type="radio" name="smaeaddr">
                                    <label for="sameaddr1">새로운 배송지</label>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <th scope="row">
                                받으시는분
                                <img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif">              
                            </th>
                            <td>
                                <input type="text" name="rname" placeholder size="15">
                            </td>
                        </tr>

                        <tr>
                            <th scope="row">
                                주소
                                <img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif">
                            </th>

                            <td>
                                <input type="text" maxlength="6" placeholder size="6">
                                <a href="#">우편번호</a>
                                <br>
                                <input type="text" id="radder1" placeholder size="40">
                                <span>기본주소</span>
                                <br>
                                <input type="text" id="radder2" placeholder size="40">
                                <span>나머지주소</span>
                                <span>(선택입력가능)</span>
                            </td>
                        </tr>
                    </tbody>

                    <tbody>
                        <tr>
                            <th scope="row">
                                배송메시지                             
                            </th>
                            <td>
                                <textarea id="omessage" maxlength="255" cols="70">

                                </textarea>
                            </td>
                        </tr>
                    </tbody>

                </table>
            </div>
        </div>


        <div id="content4">
            <div id="content4_1">
                <p>결제수단</p>
            </div>
            <div id="content4_2">
                <a href="#">네이버페이</a>
            </div>
        </div>

        <div id="content5">
            <div id="content5_1">
                <p>결제 예정 금액</p>
            </div>
            <div id="content5_2">
                <table>
                    <thead>
                        <tr>
                            <th>총 주문 금액</th>
                            <th>총할인 + 부가결제 금액</th>
                            <th>총 결제예정 금액</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td>
                                <div>
                                    <strong>14,900원</strong>
                                </div>
                            </td>

                            <td>
                                <div>
                                    <strong>0원</strong>
                                </div>
                            </td>

                            <td>
                                <div>
                                    <strong>
                                        <span>14,900원</span>
                                    </strong>
                                </div>
                            </td>
                        </tr>

                    </tbody>

                </table>
            </div>

        </div>

        <div id="content6">
            <div id="content6_1">
                <button>결제하기</button>
                <button>뒤로가기</button>
            </div>

        </div>

    </div>





	<%@ include file="../common/footerbar.jsp" %>

</body>
</html>