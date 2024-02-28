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
                            <a href="#" class="btn btn-sm btn-warning">장바구니</a>
                            <a href="#" class="btn btn-sm btn-warning">구매하기</a>
                        </div>

                    </div>



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
                                <th>user01</th>
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
        
        	/*
        	function insertReview(){
        		$.ajax({
        			url:"rinsert.rv",
        			data:{pno:<%= p1.getProductNo()%>,
        				  content:$("#reviewContent").val()
        				  },
        			type:"post",
        			success:function(result){ // result에는 0 또는 1이 있음
        				if(result > 0){
        					 window.onload();
        					$("#reviewContent").val("");
        				}
        			}, error:function(){
        				console.log("리뷰 작석용 ajax 통신 실패!")
        			}
        			
        		});
        	}	
        	*/
        	
        
        	window.onload=function(){
        		$.ajax({
        			url:"rvList.rv",
        			data:{pno:<%= p1.getProductNo() %>},
        			success:function(map){
        				const pi = map.pi
        				var currentPage = pi.currentPage;
        				var startPage = pi.startPage;
        				var endPage = pi.endPage;
        				var maxPage = pi.maxPage
        			var $paging = $(".paging-area");
        				
        				for(let p=startPage; p<=endPage; p++){
        					if(p == currentPage){
        						$paging.append("<button>" + p + "</button>");
        					}else{
        						$paging.append("<button>" + p + "</button>")
        					}
        				}
        				
        			  const list = map.reviewList
        			
        			  var review = $(".review4");
        			  
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