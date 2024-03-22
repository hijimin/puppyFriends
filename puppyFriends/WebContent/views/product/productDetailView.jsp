<%@page import="java.util.ArrayList"%> <%@page
import="com.kh.product.model.vo.Product"%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
    Product p1 = list.get(0); // 1
    Product p2 = list.get(1); // 2
	// 상품번호, 상품명, 상품상세설명, 상품원래가격, 할인율, 이미지경로, 할인된가격, 파일레벨(1,2)
	
	ArrayList<Product> stockList = (ArrayList<Product>)request.getAttribute("stockList");
%> 

    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="UTF-8" />
        <title>Insert title here</title>
        <style>
          div {
            box-sizing: border-box;
            /* border: 1px solid red; */
          }

          body {
            margin: 0px;
          }

          #content {
            /* width: 1903px; */
            margin: auto;
            width: 1600px;
            min-width: 1000px;
            height: auto;
            display: flex;
            justify-content: center;
            flex-direction: column;
          }

          #content > div {
            width: 100%;
          }

          #content1 {
            height: 700px;
            border-bottom: solid 1px rgb(180, 179, 179);
          }
          #content1 > div {
            height: 100%;
            float: left;
          }
          #content1_1 {
            width: 60%;
            padding-left: 150px;
          }
          #content1_2 {
            width: 40%;
          }

          #content2 {
            height: auto;
            padding-left: 270px;
            padding-top: 50px;
          }

          /*리뷰*/
          #content3 {
            height: auto;
            border-bottom: solid 1px rgb(180, 179, 179);
          }
          .review {
            width: 1300px;
            height: auto;
            margin: auto;
            margin-top: 20px;
          }
          .review > div {
            width: 100%;
          }

          .review1 {
            height: auto;
          }
          .review-area {
            border-right: 1px solid rgb(240, 240, 240);
          }
          .review4 {
            width: 1300px;
            height: auto;
            margin: auto;
          }
          .review4 > div {
            height: 100%;
            float: left;
          }
          .review4_1 {
            width: 5%;
          }
          .review4_2 {
            width: 95%;
            border-bottom: 1px solid rgb(240, 240, 240);
          }
          .reviewin {
            display: inline;
          }
          #enroll-form textarea {
            width: 1200px;
            box-sizing: border-box;
          }

          #content4 {
            height: auto;
            border: 1px solid rgb(240, 240, 240);
            border-radius: 10px;
            margin-top: 10px;
          }

          /**/

          #prsLine {
            text-decoration: line-through;
            font-weight: normal;
          }

          .cart a {
            width: 223px;
            height: 55px;
          }

          /* 버튼 */
          @import url(https://fonts.googleapis.com/css?family=Raleway:200,300,400,500,600);
@font-face {
  font-weight: normal;
  font-style: normal;
  font-family: 'codropsicons';
  src: url("../fonts/codropsicons/codropsicons.eot");
  src: url("../fonts/codropsicons/codropsicons.eot?#iefix") format("embedded-opentype"), url("../fonts/codropsicons/codropsicons.woff") format("woff"), url("../fonts/codropsicons/codropsicons.ttf") format("truetype"), url("../fonts/codropsicons/codropsicons.svg#codropsicons") format("svg");
}
*,
*:after,
*:before {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  background: #cfd8dc;
  color: #37474f;
  font-weight: 400;
  font-size: 1em;
  font-family: 'Raleway', Arial, sans-serif;
}

a {
  color: #7986cb;
  text-decoration: none;
  outline: none;
}
a:hover,
a:focus {
  color: #3f51b5;
}


/* Box colors */
.bg-1 {
  background: #ECEFF1;
  color: #37474f;
}
.bg-2 {
  background: #7986cb;
  color: #ECEFF1;
}
.bg-3 {
  background: #37474f;
  color: #fff;
}

/* Common button styles */
.button {
  float: left;
  min-width: 150px;
  max-width: 250px;
  display: block;
  margin: 1em;
  padding: 1em 2em;
  border: none;
  background: none;
  color: inherit;
  vertical-align: middle;
  position: relative;
  z-index: 1;
  -webkit-backface-visibility: hidden;
  -moz-osx-font-smoothing: grayscale;
}
.button:focus {
  outline: none;
}
.button > span {
  vertical-align: middle;
}

/* Sizes */
.button--size-s {
  font-size: 14px;
}
.button--size-m {
  font-size: 16px;
}
.button--size-l {
  font-size: 18px;
}


/* Borders */
.button--border-thin {
  border: 1px solid;
}
.button--border-medium {
  border: 2px solid;
}
.button--border-thick {
  border: 3px solid;
}

/* Winona */
.button--winona {
  overflow: hidden;
  padding: 0;
  -webkit-transition: border-color 0.3s, background-color 0.3s;
  transition: border-color 0.3s, background-color 0.3s;
  -webkit-transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
  transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
}
.button--winona::after {
  content: attr(data-text);
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  opacity: 0;
  color: #3f51b5;
  -webkit-transform: translate3d(0, 25%, 0);
  transform: translate3d(0, 25%, 0);
}
.button--winona > span {
  display: block;
}
.button--winona.button--inverted {
  color: #7986cb;
}
.button--winona.button--inverted:after {
  color: #fff;
}
.button--winona::after,
.button--winona > span {
  padding: 1em 2em;
  -webkit-transition: -webkit-transform 0.3s, opacity 0.3s;
  transition: transform 0.3s, opacity 0.3s;
  -webkit-transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
  transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
}
.button--winona:hover {
  border-color: #3f51b5;
  background-color: rgba(63, 81, 181, 0.1);
}
.button--winona.button--inverted:hover {
  border-color: #21333C;
  background-color: #21333C;
}
.button--winona:hover::after {
  opacity: 1;
  -webkit-transform: translate3d(0, 0, 0);
  transform: translate3d(0, 0, 0);
}
.button--winona:hover > span {
  opacity: 0;
  -webkit-transform: translate3d(0, -25%, 0);
  transform: translate3d(0, -25%, 0);
}

.fa-solid{
  padding-top: 50px;
}

.insertbtn, .rvpagebtn{
  border: none;
  border-radius: 5px;
}

/*리뷰 등록 삭제버튼*/
.deleterv, .updaterv{
  /* display: inline; */
  display: flex;
  flex-direction: column;
  float: right;
}
#reviewContent, #reviewContent1{
  border: 1px solid rgb(240, 240, 240);
}
.insertbtn:active{
  transform: translateY(4px);
}
.update-review, .delete-review{
  border: 0;
  outline: 0;
  background-color:transparent;
}
.delete-review{
  color: red;
}

        </style>
        <script
          src="https://kit.fontawesome.com/5de30c093c.js"
          crossorigin="anonymous"
        ></script>
      </head>
      <body>
        <%@ include file="../common/menubar.jsp" %>

        <div id="content">
          <div id="content1">
            <div id="content1_1">
              <img
                src="<%= contextPath %>/<%= p1.getTitleImg() %>"
                width="700px"
                height="650px"
              />
            </div>

            <div id="content1_2">
              <div>
                <div class="tag">
                  <span></span>
                  <% if(p1.getStock() == 0){ %>
                  <span style="color: white; background-color: #e84200">품절</span>
                  <% }else{%>
                   <span style="color: white; background-color: #e84200">NEW</span>
                   <% } %>
                  <p><%= p1.getProductName() %></p>
                  <h2><%= p1.getProductName() %></h2>
                </div>
                <br /><br />

                <div class="dst">
                  "FOR DOGS"
                  <br />
                  <br />
                  <%= p1.getProductDesc() %>
                </div>

                <br /><br /><br /><br /><br /><br />

                <div class="info-price">
                  <span id="prsLine">
                    <strong><%= p1.getPrice() %></strong>"원"
                  </span>
                  <span> <strong><%= p1.getdPrice() %></strong>"원" </span>
                </div>
                <br /><br /><br />

                <div class="cart">
                  <div>
                    <button onclick="cartTest2();" class="button button--winona button--border-thin button--round-s" data-text="Add To Cart"><span>Add To Cart</span></button>
                    <!-- <a onclick="cartTest2();" class="btn btn-sm btn-warning"
                      >장바구니</a
                    > -->

					<% if(p1.getStock() == 0){ %>
					<button style="color: #fa0404;" disabled onclick="location.href='<%= contextPath %>/order.od?pno=<%= p1.getProductNo() %>'" class="button button--winona button--border-thin button--round-s" data-text="품절"><span>품절</span></button>
                    <% }else{ %>
                    <button onclick="testChange();" class="button button--winona button--border-thin button--round-s" data-text="구매하기"><span>구매하기</span></button>
					<% } %>
                    <!-- <a
                      href="<%= contextPath %>/order.od?pno=<%= p1.getProductNo() %>"
                      class="btn btn-sm btn-warning"
                      >구매하기</a
                    > -->
                    <i class="fa-solid fa-bucket fa-2xl" onclick="cartTest1();"></i>
                  </div>
                </div>
                
                <script>
                  function testChange(){      
                	  // button에서 onChange, onClick 2개를 같이 사용할수 없어서 onclick에 함수를 부여해서 따로 빼주었음
                	  <% if(loginUser == null){ %>
                	  alert("로그인 후 이용해주세요!");
                	  return;
                	  <% }else{%>
                	  location.href='<%= contextPath %>/order.od?pno=<%= p1.getProductNo() %>';
                	  <% }%>
                  }               
                </script>
                
                <script>
               
                
                  function cartTest2(){
                	  
                	  let login = null;
                	  <% if(loginUser != null) { %>
                	  	login = '<%= loginUser.getMemberId() %>';
                	  <%  }%>
                  	// 중복체크하고
                  	// 상품명이 중복이면 업데이트 컨트롤러타게
                  	// 중복이 아니면 isnert함수호출
                  	
                  	
                  	if(!login){ // 펄씨
                  		alert("로그인 후 이용해주세요!");
                  		return;
                  	}
                  	

                  	$.ajax({
                  		url:"cartCheck.cr",
                  		data:{
                  			pno:<%= p1.getProductNo()%>
                  		},
                  		type:"post",
                  		success:function(count){
                  			if(count == "NNNNN"){
                  				// 존재하는 장바구니가 있으니 update
                  				updateCart();
                  				console.log(count);
                  			}else{
                  				// 존재하는 장바구니가 없으면 insert
                  				cartTest();
                  				console.log(count);
                  			}
                  		}, error:function(){
                  			console.log("ajax 통신 실패!");
                  		}
                  	});
                  }

                  function updateCart(){
                  	$.ajax({
                  		url:"updatecart.cr",
                  		data:{
                  			pno:<%= p1.getProductNo()%>
                  		},
                  		type:"post",
                  		success:function(result){
                  			if(result > 0){
                  				alert('장바구니 추가 완료!');
                  			}
                  		}, error:function(){
                  			console.log("ajax 통신 실패!");
                  		}
                  	});
                  }


                  function cartTest(){
                  	$.ajax({
                  		url:"insert.cr",
                  		data:{
                  			pno:<%= p1.getProductNo()%>
                  			// 여기서 로그인 유저 뽑아도 되는데 session영역에 있기때문에 컨트롤러가서 뽑을꺼임
                  		},
                  		type:"post",
                  		success:function(result){
                  			if(result>0){
                  			alert('장바구니 추가 완료!');
                  			}
                  		}, error:function(){
                  			console.log("장바구니 추가 ajax 통신 실패!");
                  		}
                  	});
                  }

                  function cartTest1(){
                  	location.href='<%= contextPath %>/cartList.cr?pno=<%= p1.getProductNo()%>';
                  }
                 
                  
                </script>
              </div>
            </div>
          </div>

          <!-- 상품 상세설명 div -->
          <div id="content2">
            <img src="<%= contextPath %>/<%= p2.getTitleImg()%>" />
          </div>

          <div id="content3">
            <% if(loginUser != null){ %>
            <div class="review">
              <div class="review0"><p>리뷰를 작성해 주세요.</p></div>

              <div class="review1">
                <table>
                  <tr>
                    <th width="170px">상품명 : <%= p1.getProductName() %></th>
                  </tr>

                  <tr>
                    <th>작성자 : <%= loginUser.getMemberId() %></th>
                  </tr>

                  <tr>
                    <th>내용작성</th>
                    <td>
                      <textarea rows="2"style="resize: none; width: 1020px; height: 130px;" id="reviewContent"></textarea>
                      <!-- <button class="insertbtn" onclick="insertReview();">리뷰등록</button> -->
                    </td>
                    <td>
                      <button id="clickbtn" class="insertbtn" onclick="return insertReview();">리뷰등록</button>
                    </td>
                  </tr>
                </table>

                <br />

                <!-- <div align="center">
                  <button class="insertbtn" onclick="insertReview();">리뷰등록</button>
                </div> -->
                
              </div>
            </div>
            
            
           
            <% }else{ %>
            	<div><p>로그인 후 이용해주세요</p></div>
            <% } %>
          </div>

          <div id="content4">
            <div class="review4"><!-- 리뷰 큰통div--></div>
          </div>

          <br /><br />

          <!-- 페이징바 -->
          <div class="paging-area" align="center"></div>

          <script>


            function insertReview(){
                  let btnclick = document.getElementById("clickbtn")
                  let text = document.getElementById("reviewContent");
                  if(text.value == ""){
                    alert("리뷰 내용을 작성해주세요!")
                    return false;
                  }

            	$.ajax({
            		url:"rinsert.rv",
            		data:{pno:<%= p1.getProductNo()%>,
            			  content:$("#reviewContent").val()
            			  },
            		type:"post",
            		success:function(result){ // result에는 0 또는 1이 있음
            			if(result > 0){
            				$("#reviewContent").val("");
            				selectReviewList(1); // 한번 더 조회하기위해 호출해줘야함!!!
            			}
            		}, error:function(){
            			console.log("리뷰 작성용 ajax 통신 실패!")
            		}

            	});
            }
          </script>

          <script>
            // 처음 최초로 한번만 실행되는 함수! window.onload는 한번 실행하고 끝나고 그냥 function은 계속 사용할 수 있다1
            // 처음 페이지를 1page로 그리기 위해서 selectReviewList를 호출하면서 매개변수로 값 1을 줌
           
            
            function selectReviewList(cpage){
            	// capage에 1이 꽂히고 rvList.rv로 가서 1page의 currentPage를 생성함
            	$.ajax({
            		url:"rvList.rv",
            		data:{pno:<%= p1.getProductNo() %>, cpage:cpage},
            		success:function(map){
            			let pi = map.pi
            			let currentPage = pi.currentPage;
            			let startPage = pi.startPage;
            			let endPage = pi.endPage;
            			let maxPage = pi.maxPage;
            			let $paging = $(".paging-area");

            			$(".review4").empty();
            			$paging.html(""); // ajax은 페이지 전환이 없기때문에 새로운 요소를 불러와야할때는 비워줘야한다

            			if(currentPage != 1){
            				//$paging.append("<button onclick='selectReviewList(" + (currentPage-1) + ");'>" &lt; </button>)
            				$paging.append("<button class='rvpagebtn' onclick='selectReviewList(" + (currentPage - 1) + ");'>&lt;</button>");
            			}

            			for(let p=startPage; p<=endPage; p++){
            				if(p == currentPage){
            					$paging.append("<button class='rvpagebtn'>" + p + "</button>");
            				}else{
            					$paging.append("<button class='rvpagebtn' onclick='selectReviewList(" + p + ");'>" + p + "</button>") // p는 "+" 방식으로 감싸줘야 변수로 인식함
            					// 위 함수가 실행이되고 이 구문은 이 구문만을 위한 함수이기 때문에 한번더 cpage값을 줘야한다.
            					// 2페이지 원해서 2페이지 버튼 클릭시 selectReviewList함수를 호출하면서 매개변수로 숫자2를 줌
            					// p에는 내가 보고있는 페이지 숫자가 들어갈꺼고 p에 2가 들어갈시 capge에 2가 들어가면서 다시 rvList.rv로가서
            					// currentPage를 2page로 요소를 그려준다
            				}
            			}

            			if(currentPage != maxPage){
            				$paging.append("<button class='rvpagebtn' onclick='selectReviewList(" + (currentPage + 1) + ");'>&gt;</button>");
            			}

            		  let list = map.reviewList
            		  let reviewNo = list.reviewNo;
            		  let loginUserName = '';
            		  <% if(loginUser != null){ %>
            		 	 loginUserName = '<%= loginUser.getMemberId() %>';
            		  <% } %>
            		  let review = $(".review4");
            		  if(list.length == 0){
            			  review.append("<p align=\"center\" calss=\"reviewnono\">" + "작성된 리뷰가 없습니다." + "</p>"); 
            		  }else{
            			  
            			  
            			  
            			  for (let i = 0; i < list.length; i++) {
            				  let deleteLink = $("<a href=\"#\" onclick=\"deleterv(" + list[i].reviewNo + ")\">Delete</a>");
            				  
            				    let $review = $("<div class=\"review4_1\">"+ "<i class=\"fa-solid fa-circle-user fa-2xl\">" + "</i>" + "</div>"
            				        + "<div class=\"review4_2\">"
            				        + "<div class=\"reviewin\">" + list[i].reviewWriter + " | </div>"
            				        + "<div class=\"reviewin\">" + list[i].reviewDate + "</div>"
            				        + "<div class=\"reviewpd\">상품명 : " + list[i].product + "</div>"
            				        + "<div class=\"deleterv\">"+"</div>"
            				        + "<div class=\"updaterv\">"+"</div>"
            				        + "<div class=\"reviewcontent\">" + list[i].reviewText + "</div>"
            				        + "</div>");

     
            				    review.append($review);

            
            				    if (loginUserName === list[i].reviewWriter) {        				    	
            				        // $review.find('.deleterv').html("<a href=\"#\" class=\"delete-review\" data-review-no=\"" + list[i].reviewNo + "\">삭제</a>");
                            $review.find('.deleterv').html("<button class=\"delete-review\" data-review-no=\"" + list[i].reviewNo + "\">삭제</button>");
            				        // $review.find('.updaterv').html("<a href=\"#\" class=\"update-review\" data-review-text=\"" + list[i].reviewText + "\" data-review-no=\"" + list[i].reviewNo + "\">수정</a>");
            				        $review.find('.updaterv').html("<button class=\"update-review\" data-review-text=\"" + list[i].reviewText + "\" data-review-no=\"" + list[i].reviewNo + "\">수정</button>");
            				    }
            				}
            		         
            			  $('.delete-review').on('click', function(event) {
            				    event.preventDefault();
  
            				    var reviewNo = $(this).data('review-no');
            				   	
            				   	deleterv(reviewNo);
            				});
            			  
            			  
            			  $('.update-review').on('click', function(event) {
          				    event.preventDefault();

          				    var reviewNo = $(this).data('review-no');
          				    let reviewText = $(this).data('review-text');
          				  	let reviewContentDiv = $(this).closest('.review4_2').find('.reviewcontent');
          				     
          			
          				  reviewContentDiv.html('<textarea rows="2"style="resize: none; width: 1020px; height: 130px;" id="reviewContent1"></textarea>')          				        	
          				  $('.update-review').html('<button class="update-review" id="revModify"> 수정 </button>')
          				  
          				  $('#revModify').on('click', function(){
          					var newReviewText = $('#reviewContent1').val();
          					  console.log(reviewNo);
          					  console.log(newReviewText);
          					  
          				  updaterv(reviewNo,newReviewText);
          				  })
          				});  
            		  }
                  if (list.length > 0) {
      		            $paging.show(); 
      		        } else {
      		            $paging.hide(); 
      		        }
            			 
            		}, error:function(){
            			console.log("aJax 통신 실패!");
            		}
            	});
            }        
            
            
            function deleterv(reviewnum){
            	$.ajax({
            		// 리뷰번호, 로그인유저
            		url:"reviewDelete.rv",
            		data:{
            			rno:reviewnum
            		},
            		success:function(result){
            			alert("리뷰가 삭제 되었습니다!");
            			selectReviewList(1);
            		}, error:function(){
            			console.log("ajax 통신 실패!");
            		}       		
            	});
            }
            
            function updaterv(reviewNo, newReviewText){
            	$.ajax({
            		url:"reviewUpdate.rv",
            		data:{
            			rno:reviewNo,
            			rtext:newReviewText
            		},
            		success:function(result){
            			alert("리뷰가 수정 되었습니다!");
            			selectReviewList(1);
            		}
            	})          	
            }
       
            
            
            $(function () {
              selectReviewList(1);
            });
          </script>

          
        </div>
        <%@ include file="../common/footerbar.jsp" %>
      </body>
    </html>