<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.product.model.vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
    Product p1 = list.get(0); // 1
    Product p2 = list.get(1); // 2
	// 상품번호, 상품명, 상품상세설명, 상품원래가격, 할인율, 이미지경로, 할인된가격, 파일레벨(1,2)
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
        height: 700px;
        border-bottom: solid 1px rgb(180, 179, 179);
    }
    #content1>div{height: 100%; float: left;}
    #content1_1{
        width: 60%;
        padding-left: 150px;
    }
    #content1_2{width: 40%;}

    #content2{
        height: auto;
        padding-left: 170px;
        padding-top: 50px;
    }

    /*리뷰*/
    #content3{
        height: auto;
        border-bottom: solid 1px rgb(180, 179, 179);
    }
    .review{
        width: 1300px;
        height: auto;
        margin: auto;
    }
    .review>div{width: 100%;}
    
    .review1{
        height: auto;
    }
    .review-area{
        border-right: 1px solid lightgray;
    }
    .review4{
        width: 1300px;
        height: auto;
        margin: auto;
    }
    .review4>div{height: 100%; float: left;}
    .review4_1{
        width: 5%;
    }
    .review4_2{
        width: 95%;
        border-bottom: 1px solid lightgray;
    }
    .reviewin{
        display: inline;
    }
    #enroll-form textarea{
        width: 1200px;
        box-sizing: border-box;
    }

    

    #content4{
        height: auto;
    }

    /**/

    #prsLine{
        text-decoration: line-through;
    font-weight: normal;
    }

    .cart a{
        width: 223px;
        height: 55px;
    }
</style>
<script src="https://kit.fontawesome.com/5de30c093c.js" crossorigin="anonymous"></script>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>

    <div id="content">
        <div id="content1">
        
       
            <div id="content1_1">
                <img src="<%= contextPath %>/<%= p1.getTitleImg() %>" width="700px" height="650px">
            </div>
            


            <div id="content1_2">
                <div>
                    <div class="tag">
                        <span></span>
                        <span style="color: white; background-color: #E84200;">NEW</span>
                     
                        <p><%= p1.getProductName() %></p>
                        <h2><%= p1.getProductName() %></h2>
                    </div>
                    <br><br>

                    <div class="dst">
                        "FOR DOGS"
                        <br>
                        <br>
                        <%= p1.getProductDesc() %>       
                    </div>

                    <br><br><br><br><br><br>

                    <div class="info-price">
                        <span id="prsLine">
                            <strong><%= p1.getPrice() %></strong>"원"
                        </span>
                        <span>
                            <strong><%= p1.getdPrice() %></strong>"원"
							
                        </span>
                    </div>
                    <br><br><br>
				
                    <div class="cart">

                        <div>
                            <a onclick="cartTest2();" class="btn btn-sm btn-warning">장바구니</a>
                            <a href="<%= contextPath %>/order.od?pno=<%= p1.getProductNo() %>" class="btn btn-sm btn-warning">구매하기</a>
                           	<i class="fa-solid fa-bucket fa-2xl" onclick="cartTest1();"></i>
                        </div>
                    </div>
                    
                    <script>
                    	function cartTest2(){
                    		console.log("되냐?");
                    		// 중복체크하고
                    		// 상품명이 중복이면 업데이트 컨트롤러타게
                    		// 중복이 아니면 isnert함수호출 
                    		
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
        <!-- 
        <i class="fa-solid fa-heart"></i>
        <i class="fa-regular fa-heart"></i>
        -->
        
        <!-- 상품 상세설명 div -->
        <div id="content2">
            
            <img src="<%= contextPath %>/<%= p2.getTitleImg()%>">

        </div>


        <div id="content3">
        	<% if(loginUser != null){ %>
            <div class="review">
                <div class="review0"><p>리뷰작성</p></div>

                <div class="review1">
                  
                    
                        <table>
                            <tr>
                                <th width="150px"><%= p1.getProductName() %></th>
                            </tr>

                            <tr>
                                <th><%= loginUser.getMemberId() %></th>
                            </tr>

                            <tr>
                                <th>작성</th>
                                <td><textarea rows="2" style="resize: none;" id="reviewContent"></textarea></td>
                            </tr>
                        </table>
                        <br>
                        <div align="center">
                            <button onclick="insertReview();">등록하기</button>
                        </div>
                                     
                </div>
            </div>
            <% } %>
            
        </div>

        <div id="content4">
            <div class="review4"> <!-- 리뷰 큰통div-->
            

            </div>
            
            

        </div>

        <br><br>
        
        <!-- 페이징바 -->
        <div class="paging-area" align="center">
			
			
            
        </div>
        
        <script>
        
        	
        	function insertReview(){
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
        				console.log("리뷰 작석용 ajax 통신 실패!")
        			}
        			
        		});
        	}	
        	
        	</script>
        	
        	<script>
        	// 처음 최초로 한번만 실행되는 함수! window.onload는 한번 실행하고 끝나고 그냥 function은 계속 사용할 수 있다
        	// 처음 페이지를 1page로 그리기 위해서 selectReviewList를 호출하면서 매개변수로 값 1을 줌
        		$(function(){
        			selectReviewList(1);
        		})
        	</script>
        
        	<script>     	
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
        					$paging.append("<button onclick='selectReviewList(" + (currentPage - 1) + ");'>&lt;</button>");
        				}
        				
        				for(let p=startPage; p<=endPage; p++){
        					if(p == currentPage){
        						$paging.append("<button>" + p + "</button>");
        					}else{
        						$paging.append("<button onclick='selectReviewList(" + p + ");'>" + p + "</button>") // p는 "+" 방식으로 감싸줘야 변수로 인식함
        						// 위 함수가 실행이되고 이 구문은 이 구문만을 위한 함수이기 때문에 한번더 cpage값을 줘야한다.
        						// 2페이지 원해서 2페이지 버튼 클릭시 selectReviewList함수를 호출하면서 매개변수로 숫자2를 줌
        						// p에는 내가 보고있는 페이지 숫자가 들어갈꺼고 p에 2가 들어갈시 capge에 2가 들어가면서 다시 rvList.rv로가서
        						// currentPage를 2page로 요소를 그려준다
        					}
        				}
        				
        				if(currentPage != maxPage){
        					$paging.append("<button onclick='selectReviewList(" + (currentPage + 1) + ");'>&gt;</button>");
        				}
        				
        			  let list = map.reviewList
        			
        			  let review = $(".review4");
        			for(let i=0; i<list.length; i++){
        				review.append("<div class=\"review4_1\">" + "사진" + "</div>"
        							+ "<div class=\"review4_2\">"
        						   + "<div class=\"reviewin\">" + list[i].reviewWriter + " | " + "</div>"	
                            	   + "<div class=\"reviewin\">" + list[i].reviewDate + "</div>"
                            	   + "<div class=\"reviewpd\">" + "상품명 : " + list[i].product + "</div>"
                            	   + "<div class=\"reviewcontent\">" + list[i].reviewText + "</div>"
                            	   +  "</div>");
        				}       		    				
        			}, error:function(){
        				console.log("aJax 통신 실패!");
        			}
        		});
        	} 		
        		</script>

    </div>

    <%@ include file="../common/footerbar.jsp" %>
	

</body>
</html>