<%@page import="com.google.gson.Gson"%>
<%@page import="com.kh.cart.model.vo.Cart"%>
<%@page import="com.kh.product.model.vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Cart> list = (ArrayList<Cart>)request.getAttribute("list");	

	// 카트번호, 유저이름, 상품이름, 장바구니담은수량, 원가, 장바구니수량합계, 이미지경로, 상품번호
	int productCount = list.size();
	
	Member m = (Member)request.getAttribute("m");
	// 유저이름, 유저이메일, 유저폰번호
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{
        box-sizing: border-box; 
        /* border: 1px solid red; */
    }
    
    body{
        margin: 0px;
        font-size: 1.3rem;
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

    input[type=text]{ /*주말추가*/
        
        line-height: 25px;
        padding: 2px 4px;
        border: 1px solid #97a6c0;
        font-size: 12px;
        background: transparent;
    }
    input{
        vertical-align: middle;
    }
    th{
        vertical-align: top;
    }
    table{
        width: 100%;
        text-indent: initial;
    }
    input[type="text" i] {
    padding-block: 1px;
    padding-inline: 2px;
    }
    .radder2{
        width: 460px;
        height: 24px;
    }
    .radder3{
        width: 190px;
        height: 24;
    }
    [class^='btnNormal']{
        display: inline-block;
        box-sizing: border-box;
        padding: 2px 8px;
        border: 1px solid #97a6c0;
        border-radius: 2px;
        font-size: 12px;
        line-height: 18px;
        font-weight: normal;
        color: #083681;
    }
    #content3_2 tbody th, #content2_2 tbody th{
        padding: 11px 0 10px 18px;
        border: 1px solid #eee;
        border-bottom-width: 0;
        color: #353535;
        text-align: left;
        font-weight: normal;
    }
    #content3_2, #content2_2 table{
        line-height: 1.5;
    }
    select{
        height: 24px;
    }
    #content4_2, #content6_1{
        text-align: center;
    }

    #content1_2c1{
        display: inline;
        float: right;
        margin-right: 50px;
    }

    .ec-base-table thead th{
        border-bottom: 1px solid #d7d5d5;
    }
    
     .count-wrap {position: relative;padding: 0 38px;border: 1px solid #ddd;overflow: hidden;width: 60px;}
	.count-wrap > button {border: 0;background: #ddd;color: #000;width: 38px;height: 38px;position: absolute;top: 0;font-size: 12px;} 

	.count-wrap .inp {border: 0;height: 38px;text-align: center;display: block;width: 100%;}
    .count-wrap > button.minus {left: 0;}
	.count-wrap > button.plus {right: 0;}
    

    input::-webkit-inner-spin-button {
    appearance: none;
    -moz-appearance: none;
    -webkit-appearance: none;
    }





    /*주문정보*/
    #content2{height: 300px;}
    
    #content2>div{width: 100%;}
    /* #content2_1{height: 20%;} */
    #content2_2{height: 80%;}

    .required{
        display: block;
        margin-block-start: 1em;
        margin-block-end: 1em;
        margin-inline-start: 0px;
        margin-inline-end: 0px;
        text-align: right;
        margin: -15px 0 0;;
    }

    /*배송정보*/
    #content3{
        height: 400px;
    }
    #content3>div{width: 100%;}
    /* #content3_1{height: 20%;} */
    #content3_1>h6{
    font-weight: bold;
    margin: 0;
    vertical-align: middle;
    display: inline-block;
    }
    #content2_1>h6{
    font-weight: bold;
    margin: 0;
    vertical-align: middle;
    display: inline-block;
    }
    p{
        display: block;
    }

    



    #content3_2{height: 80%;}

    /*결제수단*/
    #content4{
        height: 200px;
    }

    #content4>div{width: 100%;}
    #content4_1{height: 20%;}
    #content4_2{
        height: 80%;
        border: 1px solid #777;
    }

    /*최종결제 확인*/
    #content5{
        height: 200px;
    }
    #content5>div{width: 100%;}
    #content5_1{
        height: 20%;
        border-bottom: 1px solid #d7d5d5;

    }
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
    
    .tossimg{
        width: 180px;
        height: 50px;
    }
    
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<!-- 포트원 결제 -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <!-- 포트원 결제 -->
    
    <!-- 카카오페이 -->
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <meta charset="UTF-8">
    <title>Sample Payment</title>
</head>
<body>

	<%@ include file="../common/menubar.jsp"%>
	
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
                                <th>합계</th>
                            </tr>
                        </thead>
                    
                </div>
                <div id="content1_2b">
                    <tbody>  
                            <% int pppno = 0; %>        		
                        	<% String mprice = ""; %>
                        	<% String pName = ""; %>
                        	<% if(list.isEmpty()){ %>
                        		<h2 align="center">장바구니가 비어있습니다.</h2>
                        	<% }else{ %>
                    		<% for(Cart c : list){ %>                		              	              		
                    		<% mprice = c.getdPrice(); %> 
                    		<% pName = c.getProductNo(); %>        		             
                        <tr class="cartList">
                            <td>
                                <input type="checkbox" name="plist" value="<%= c.getPno()%>">
                                <label for="product"><img src="<%= contextPath %>/<%= c.getTitleImg() %>" width="100" height="100"></label>
                            </td>
                            <td><%= pName %></td>
                            <td>                                                    
	                            <div class="count-wrap _count" style="width:120px">
								    <button type="button" class="minus" data-product-no="<%= c.getPno() %>" onclick="minusTest();">-</button>
								    <input type="number" class="inp" value="<%= c.getCartAmount()%>" />
								    <button type="button" class="plus" data-product-no="<%= c.getPno() %>">+</button> <!-- onclick="plusTest();" 지워도됨 -->
								</div>
								
                            </td>
                            <td>기본배송</td>
                            <td>-</td>
                            <td class="mtotal"><%= mprice %>원</td>
                        </tr>                         
                        	<% } %>   
                        <% } %>               
                    </tbody>
                </div>
            </table>
            
            <script>
         
            $(function(){
            
            	let cartList = $(".cartList");
            	let plusList = $(".plus"); // 수량버튼 div
            	let minusList = $(".minus"); // 버튼
            	let inputList = $(".inp"); //인풋
            	let mtotalList = $(".mtotal");                   	    

                console.log(mtotalList);
                let sumTotal = 0;
	        	for(let i=0; i<mtotalList.length; i++){ // 장바구니에 담겨있는게 없을 수 있기에 for문을 돌림
                    sumTotal += Number(mtotalList[i].innerText.replace("원","").replace(",",""));
                    // console.log(mtotalList[i].innerText);
                }
                console.log(sumTotal);
                $('#totalprice').text(sumTotal);
                $('.toto').text(sumTotal);

                

            	$(plusList).click(function(){               		
            		let productNum = $(this).data('product-no');
            		console.log(productNum)
    	        	// let cartCount = ++cartAmount; 여기에 있으면 클릭하자마자 증가가되버림
            		let value = $(this).parent().parent().siblings('.mtotal').text();  	    
            		let cartCount = $(this).siblings('.inp').val();
            		let price = value.replace("원","");
            		let pprice = price.replace(",","");
            		let ppprice = Number(pprice);

            		let originalPrice = ppprice / cartCount;
            		
            		//console.log(ppprice)
            		//console.log(cartAmount)
            		//console.log(originalPrice)
            		
            		let cartCountA = ++cartCount; // 항상 준비해야할 값을 다 뽑고 증가시키자! 증가하지 전위연산으로!        	
	        		 $(this).parent().parent().siblings('.mtotal').text(originalPrice * cartCountA + "원");
					let apple = originalPrice
            		//console.log(plusList.index(this));
            		//inputList.eq(plusList.index(this)).val();
            		
            		plusTest(plusList.index(this),apple); // 내가 클릭한 요소가 plusList에서 몇번째 요소인지?
            								          				
					$.ajax({
            			url:"ocount.po",
            			data:{
            				count:cartCount,
            				pno:productNum
            			},
            			success:function(result){
            				if(result > 0){
            				location.reload();            					
            				}
            			}, error:function(){
            				console.log("ajax 통신 실패!");
            			}	
            		});	
            	})
	        		
            	$(minusList).click(function(){
            		let productNum = $(this).data('product-no');
            		console.log(productNum)
            		let value = $(this).parent().parent().siblings('.mtotal').text();
            		let cartCount = $(this).siblings('.inp').val();
            		
            		let price = value.replace("원","");
            		let pprice = price.replace(",","");
            		let ppprice = Number(pprice);
            		//console.log(cartAmount);
            		
            		let originalPrice = ppprice / cartCount;
            		//console.log(originalPrice)
            		let cartAmount = --cartCount;
            		
      
            		
            		$(this).parent().parent().siblings('.mtotal').text(originalPrice * cartAmount + "원");
            		
            		
            		minusTest(minusList.index(this)); 
            		
            		$.ajax({
            			url:"ocountMinus.po",
            			data:{
            				count:cartCount,
            				pno:productNum
            			},
            			success:function(result){
            				if(result > 0){
            				location.reload();            					
            				}
            			}, error:function(){
            				console.log("ajax 통신 실패!");
            			}	
            		});	
            		
            	})
            })
	            let priceStr = '<%= mprice%>';
	        	let price = parseInt(priceStr.replace(/,/g, ''), 10);
		            
		        	function getTotal() {
		                return $("#totalprice").text();
		            }
			
		            	function minusTest(index) {
		            	let cartAmount = $('input[class=inp]').eq(index).val();
		            		let total = getTotal();	            		
		            		
		                    if (cartAmount > 1) {
		                        cartAmount--;
		                        $('input[class=inp]').eq(index).val(cartAmount); 
		                        $('#totalprice').text(Number(price - cartAmount));
		                    }
		                }
	
		                function plusTest(index,apple) {
		                	let cartAmount = $('input[class=inp]').eq(index).val(); // 몇번째 인풋을 선택해올껀지?
		            		let total = getTotal();
                            let totalPrice = $("#totalprice").text();
		            		
		                	if(cartAmount++){
		                    $('input[class=inp]').eq(index).val(cartAmount); // 증가한게 여기에
		                    	//$("#totalprice").text(Number(price * cartAmount));	
		                    $("#totalprice").text(Number(totalPrice)+Number(apple));
		                	}                  
		                }            	
            </script>
            
            <script>
            
            
            </script>
            
                    <div id="content1_2c">                       
                        <span><a onclick="validate();">선택삭제</a></span>
                        <div id="content1_2c1">
                            <span>상품금액</span> <span id="totalprice"></span>                                      
                        </div>                
                    </div>
                    
                    <script>
                    function validate(){               	
                    	if ($('input[name=plist]:checked').length > 0) {
                            var selectedValue = $('input[name=plist]:checked').val();
                            
                            checkdelete(selectedValue);
                        } 
  	                         
                    }
                   	function checkdelete(pno){
                   		
                   		$.ajax({
                   			url:"deletecart.cr",
                   			data:{
                   				pno
                   			},
                   			type:"post",
                   			success:function(){
                   				alert('삭제 완료!')
                   				 location.reload();
                   			}, error:function(){
                   				console.log('ajax 통신 실패!');
                   			}
                   		});  		
                   	}
                    </script>
               
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
                            <td style="padding: 10px;">
                                <input type="text" placegolder size="15" class="radder3" value="<%= m.getMemberName()%>">
                            </td>
                        </tr>

                        <tr>
                            <th scope="row">
                                휴대전화
                                <img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif">
                            </th>

                            <td style="padding: 10px;">
                                <select name="phone" id="phone">
                                    <option value="010">010</option>
                                    <option value="011">011</option>
                                    <option value="018">018</option>
                                </select>
                                -
                                <input type="text" name="phone" value="<%= m.getPhone1()%>">
                                -
                                <input type="text" name="phone" value="<%= m.getPhone2()%>">
                            </td>
                        </tr>
                    </tbody>

                    <tbody class="email">
                        <tr>
                            <th>
                                이메일
                                <img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif">
                            </th>

                            <td style="padding: 10px;">
                                <input type="text" id="email1" name="email1" value="<%= m.getEmail1()%>">
                                @
                                <input type="text" id="email2" name="email2" readonly value="<%= m.getEmail2()%>">

                                <select name="email3" id="email3" onchange="input_email(this);">
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

                <script>
                    function input_email(result){
                        if($("#email3").val() == "etc"){
                            $("#email2").val("");
                            $("#email2").attr("readonly", false);
                        }else{
                            $("#email2").val(result.value);
                            $("#email2").attr("readonly", true);                                      
                        }
                    }
                </script>


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
                                <div class="address" style="padding: 10px;">
                                    <input type="radio" name="sameaddr0" id="sameaddr0" onclick="setSameAddress()">
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
                            <td style="padding: 10px;">
                                <input type="text" id="rname" name="rname" placeholder size="15" class="radder3">
                            </td>
                        </tr>
                        
                        <script>
                        function setSameAddress(){
                        var sameAddrRadio = document.getElementById("sameaddr0");
                        var rnameInput = document.getElementById("rname");
 
	                        if (sameAddrRadio.checked) {
	                        	rnameInput.value = '<%= m.getMemberName() %>';
	                        	}                     	
                        }
                        
                        </script>

                        <tr>
                            <th scope="row">
                                주소
                                <img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif">
                            </th>

                            <td id="ordertd" style="padding: 10px;">
                                <input type="text" id="sample2_postcode" placeholder="우편번호">
                                <a href="#none" id="btn_search_rzipcode" class="btnNormal" onclick="sample2_execDaumPostcode()">우편번호</a><br>
								<!--<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기"><br>-->
								<input type="text" id="sample2_address" placeholder="주소" placeholder size="40" class="radder2"><br>
								<input type="text" id="sample2_detailAddress" placeholder="상세주소" placeholder size="40" class="radder2">
								<input type="text" id="sample2_extraAddress" placeholder="참고항목" class="radder2">
                            </td>
                        </tr>
                    </tbody>

                    <tbody>
                        <tr>
                            <th scope="row">
                                배송메시지                             
                            </th>
                            <td style="padding: 10px;">
                                <textarea id="omessage" maxlength="255" cols="70" style="resize: none;"></textarea>
                            </td>
                        </tr>
                    </tbody>

                </table>
            </div>
        </div>

        <div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
			<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
		</div>

        <script>  
            // 우편번호 찾기 화면을 넣을 element
            var element_layer = document.getElementById('layer');
    
            function closeDaumPostcode() {
                // iframe을 넣은 element를 안보이게 한다.
                element_layer.style.display = 'none';
            }
    
            function sample2_execDaumPostcode() {           	  
                new daum.Postcode({
                    oncomplete: function(data) {
                        // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
    
                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var addr = ''; // 주소 변수
                        var extraAddr = ''; // 참고항목 변수
    
                        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                            addr = data.roadAddress;
                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                            addr = data.jibunAddress;
                        }
    
                        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                        if(data.userSelectedType === 'R'){
                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                extraAddr += data.bname;
                            }
                            // 건물명이 있고, 공동주택일 경우 추가한다.
                            if(data.buildingName !== '' && data.apartment === 'Y'){
                                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                            }
                            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                            if(extraAddr !== ''){
                                extraAddr = ' (' + extraAddr + ')';
                            }
                            // 조합된 참고항목을 해당 필드에 넣는다.
                            document.getElementById("sample2_extraAddress").value = extraAddr;
                        
                        } else {
                            document.getElementById("sample2_extraAddress").value = '';
                        }
    
                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById('sample2_postcode').value = data.zonecode;
                        document.getElementById("sample2_address").value = addr;
                        // 커서를 상세주소 필드로 이동한다.
                        document.getElementById("sample2_detailAddress").focus();
    
                        // iframe을 넣은 element를 안보이게 한다.
                        // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                        element_layer.style.display = 'none';                                        
                    },
                    width : '100%',
                    height : '100%',
                    maxSuggestItems : 5
                }).embed(element_layer);
    
                // iframe을 넣은 element를 보이게 한다.
                element_layer.style.display = 'block';
    
                // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
                initLayerPosition();
            }
    
            // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
            // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
            // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
            function initLayerPosition(){
                var width = 300; //우편번호서비스가 들어갈 element의 width
                var height = 400; //우편번호서비스가 들어갈 element의 height
                var borderWidth = 5; //샘플에서 사용하는 border의 두께
    
                // 위에서 선언한 값들을 실제 element에 넣는다.
                element_layer.style.width = width + 'px';
                element_layer.style.height = height + 'px';
                element_layer.style.border = borderWidth + 'px solid';
                // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
                element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
                element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
            }
            </script>



        <div id="content4">
            <div id="content4_1">
                <p>결제수단</p>
            </div>
            <div id="content4_2">
                
                <img class="tossimg" src="resources/image/logo-toss-pay.png">
            </div>
        </div>

        <div id="content5">
            <div id="content5_1">
                <p>결제 예정 금액</p>
            </div>
            <div id="content5_2">
                <table class="ec-base-table">
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
                                    <strong class="toto"></strong>
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
                                        <span class="toto"></span>
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
                <a href="#" onclick="requestPay();" class="btn btn-dark">결제하기</a>
                <a href="#" class="btn btn-dark">뒤로가기</a>
            </div>
        </div>
    </div>
    
    <script>   
        var IMP = window.IMP; 
        IMP.init("imp16540835"); 
      
        var today = new Date();   
        var hours = today.getHours(); // 시
        var minutes = today.getMinutes();  // 분
        var seconds = today.getSeconds();  // 초
        var milliseconds = today.getMilliseconds();
        var makeMerchantUid = hours +  minutes + seconds + milliseconds;
        
        function requestPay() {	
        	var add1 = document.getElementById("sample2_address").value; 
        	let amount = $('#totalprice').text();
        	let price = Number(amount);
        	console.log(price)
        	//let priceStr = totalPrice;
        	//let price = parseInt(priceStr.replace(/,/g, ''), 10);
        	
            IMP.request_pay({
                pg : 'tosspay',
                pay_method : 'card',
                merchant_uid: makeMerchantUid, //상점에서 생성한 고유 주문번호
                name : '주문명:결제테스트',   //필수 파라미터 입니다.
                amount : price,
                buyer_email : '<%= m.getEmail1() + '@' %><%= m.getEmail2()%>',
                buyer_name : '<%= m.getMemberName()%>',
                buyer_tel : '<%= "010" + '-' + m.getPhone1() + '-' + m.getPhone2()%>',
                buyer_addr : add1,
                buyer_postcode : '123-456',
                m_redirect_url : '{}'
            }, function (rsp) { // callback
                if (rsp.success) {
	                    test(rsp);             
                } else {
                    console.log(rsp);
                }
                
            });
        }
        
        function test(rsp){
        	let buyerAddr;
        	let buyerName;
        	let buyerTel;      		
        	var omessage = $("#omessage").val();  
        	let iu;
        	let mc;      	
        	let amount = $('#totalprice').text();
        	let price = Number(amount);       	       	
        	      	         
        		<%	
        			ArrayList<Integer> pnoList = new ArrayList<>();
        			int pno = 0;
        			for(Cart c :list){
        				pno = c.getPno();
        				pnoList.add(pno);
        			}
        			
        			String pnoArrayJSON = new Gson().toJson(pnoList);
        		%>
        		
        		<%
        			ArrayList<Integer> cartCountList = new ArrayList<>();
        			int cartCountNum = 0;
        			for(Cart c :list){
        				cartCountNum = c.getCartAmount();
        				cartCountList.add(cartCountNum);
        			}
        		
        			String cartArrayJSON = new Gson().toJson(cartCountList);
        		
        		%>
        		
        		var uniquePnoArray = JSON.parse('<%= pnoArrayJSON %>');
        		var uniqueCartArray = JSON.parse('<%= cartArrayJSON %>');
        	
        		// console.log(uniquePnoArray); // [2,3]
	        	$.ajax({
	        		url:"manyInsert.po",
	        		traditional : true,
	        		data:{
	        			buyerAddr:rsp.buyer_addr,
	        			buyerName:rsp.buyer_name,
	        			buyerTel:rsp.buyer_tel,
	        			pno:uniquePnoArray,
	        			omg:omessage,
	        			iu:rsp.imp_uid,
	        			mc:rsp.merchant_uid,
	        			pr:price,
	        			count:uniqueCartArray
	        			},
	        		success:function(result){
	        			if(result > 0){
	        				console.log("결제완료");  
	        				clear();
	        				location.href = '<%= contextPath %>/success.po'        					
	        			}
	        		}, error:function(){
	        			console.log("ajax 통신 실패!");
	        		}
	        	})       		    	
        }
        
        function clear(){
        	<%	
			ArrayList<Integer> cnoList = new ArrayList<>();
			int cno = 0;
			for(Cart c :list){
				cno = c.getCartNo();
				cnoList.add(cno);
			}
			
			String cnoArrayJSON = new Gson().toJson(cnoList);
		%>
		
		var uniqueCnoArray = JSON.parse('<%= cnoArrayJSON %>');
        	
		console.log(uniqueCnoArray);
        	
        	$.ajax({
        		url:"cstatusUpdate.cr",
        		traditional : true,
        		data:{
        			cno:uniqueCnoArray
        		},
        		success:function(result){
        			if(result > 0){
        				console.log("장바구니 비우기 성공")
        			}
        		}, error:function(){
        			console.log("ajax 통신 실패!");
        		}
        	});
        }
    </script>
	
	<%@ include file="../common/footerbar.jsp"%>

</body>
</html>