<%@page import="com.kh.common.model.vo.PageInfo"%>
<%@page import="com.kh.product.model.vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Product> list = (ArrayList<Product>) request.getAttribute("list");
	// 상품번호, 상품명, 상품상세설명, 상품원래가격, 상품할인율, 이미지경로
	
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	
	ArrayList<Product> list1 = (ArrayList<Product>) request.getAttribute("list1");
	// 상품번호, 상품명, 상품상세설명, 상품원래가격, 상품할인율, 상품할인가격, 이미지경로, 조회수, 상품업데이트일자
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
        <!DOCTYPE html>
        <html>
          <head>
            <meta charset="UTF-8" />
            <title>Insert title here</title>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            <style>
              div {
                box-sizing: border-box;
                /* border: 1px solid red; */
              }

              body {
                margin: 0px;
              }

              #content {
                /* height: 2300px; */
                height: auto;
                display: flex;
                justify-content: center;
              }

              #bestproduct {
                height: 180px;
                padding-top: 100px;
                padding-left: 1000px;
              }

              .search{
                /* padding-bottom: 100px; */
                /* padding-left: 1000px; */
              }

              #content > div {
                height: 100%;
                float: left;
              }

              #content_2 {
                /* width: 80%; */
                width: 1903px;
                min-width: 1000px;
              }

              #content_2 > div {
                width: 80%;
                margin: auto;
              }

              #content2_1 {
                /* height: 20%; */
                height: auto;
              }

              #content2_2 {
                /* height: 2%; */
                height: auto;
              }

              #content2_3 {
                height: auto;
                display: grid;
                grid-template-columns: repeat(3, 1fr);
                gap: 15px;
              }

              /*페이징바 세로길이*/
              #content2_4 {
                height: 60px;
                margin-bottom: 100px;
              }

              /* #content2_3>div{height: 100%; float: left;} */
              #content2_3 {
                padding-left: 100px;
                padding-right: 100px;
              }

              .content2_3c > img {
                height: 400px;
              }

              /*인기순 최신순 조회순 버튼*/
              #content2_2 a {
                text-decoration: none;
                font-size: 15px;
                color: black;
              }

              #content2_2 > div {
                margin-top: 10px;
              }

              /*슬라이더 스타일*/
              #slider-container {
                position: relative;
                overflow: hidden;
                width: 85%;
                margin: auto;
              }

              #slider {
                display: flex;
                transition: transform 0.5s ease-in-out;
              }

              .slide {
                min-width: 25%;
                box-sizing: border-box;
                padding: 5px;
              }

              #prev-btn,
              #next-btn {
                position: absolute;
                top: 50%;
                transform: translateY(-50%);
                font-size: 24px;
                cursor: pointer;
              }

              #prev-btn {
                left: 10px;
              }

              #next-btn {
                right: 10px;
              }

              .name_sub {
                font-size: 14px;
                color: #777;
                word-break: keep-all;
              }

              /*베스트상품 슬라이더 스타일*/
              .priceGroup {
                position: relative;
                padding: 22px 0 12px;
              }

              .custom_pro {
                position: absolute;
                bottom: 10px;
                right: 0;
                font-size: 18px;
                font-weight: 600;
                color: #e84200;
                line-height: 18px;
              }

              .prs.prsLine {
                color: rgba(0, 0, 0, 0.2);
                text-decoration: line-through;
                font-weight: normal;
                margin-right: 8px;
              }

              .prs {
                display: inline-block;
                font-size: 16px;
                font-weight: 500;
                letter-spacing: -0.63px;
                line-height: 1;
                vertical-align: middle;
              }

              .prs.prsBold {
                color: #3a3a3a;
                font-weight: 600;
                font-size: 18px !important;
              }

              .prs {
                display: inline-block;
                font-size: 16px;
                font-weight: 500;
                letter-spacing: -0.63px;
                line-height: 1;
                vertical-align: middle;
              }

              #bestproduct-p {
                /* display: inline; */
                margin-top: 100px;
              }

              /* 페이징 바*/
              .page_wrap {
                text-align: center;
                font-size: 0;
              }

              .page_nation {
                display: inline-block;
                margin-top: 10px;
                margin-left: 37%;
              }

              .page_nation .none {
                display: none;
              }

              .page_nation a {
                display: block;
                margin: 0 3px;
                float: left;
                border: 1px solid #e6e6e6;
                width: 28px;
                height: 28px;
                line-height: 28px;
                text-align: center;
                background-color: #fff;
                font-size: 13px;
                color: #999999;
                text-decoration: none;
              }

              .page_nation .arrow {
                border: 1px solid #ccc;
              }

              .page_nation .pprev {
                background: #f8f8f8 url("resources/product_img/page_pprev.png")
                  no-repeat center center;
                margin-left: 0;
              }

              .page_nation .prev {
                background: #f8f8f8 url("resources/product_img/page_prev.png")
                  no-repeat center center;
                margin-right: 7px;
              }

              .page_nation .next {
                background: #f8f8f8 url("resources/product_img/page_next.png")
                  no-repeat center center;
                margin-left: 7px;
              }

              .page_nation .nnext {
                background: #f8f8f8 url("resources/product_img/page_nnext.png")
                  no-repeat center center;
                margin-right: 0;
              }

              .page_nation a.active {
                background-color: #42454c;
                color: #fff;
                border: 1px solid #42454c;
              }

              .content2_3c img:hover {
                cursor: pointer;
              }

              /*이번주 베스트 상품*/
              #bestpd1 {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                width: 160px;
                height: 50px;
                line-height: 50px;
                font-size: 20px;
                text-align: center;
                font-family: sans-serif;
                text-decoration: none;
                text-transform: uppercase;
                letter-spacing: 2px;
                background: #ccc;
              }
              #bestpd1:before {
                content: attr(data-text);
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                text-align: center;
                background: #ff005e;
                color: #fff;
                transition: 0.5s;
                transform-origin: bottom;
                transform: translatey(-100%) rotatex(90deg);
              }
              #bestpd1:hover:before {
                transform: translatey(0) rotatex(0deg);
              }

              #bestpd1:after {
                content: attr(data-text);
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                text-align: center;
                background: #ea004f;
                color: #fff;
                transition: 0.5s;
                transform-origin: top;
                transform: translatey(0) rotatex(0deg);
              }
              #bestpd1:hover:after {
                transform: translatey(100%) rotatex(90deg);
              }

              /*검색*/
              .search {
                position: relative;
                width: 200px;
                margin: auto;
              }

              .searchclass {
                width: 100%;
                border: 1px solid #bbb;
                border-radius: 8px;
                padding: 10px 12px;
                font-size: 14px;
              }

              .searchimg {
                position: absolute;
                width: 17px;
                top: 10px;
                right: 12px;
                margin: 0;
                cursor: pointer;
              }

              .slideimgg{
                cursor: pointer;
              }
            </style>
            <link
              rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
            />

            <!-- jQuery library -->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

            <!-- Popper JS -->
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

            <!-- Latest compiled JavaScript -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
          </head>
          <body>
            <%@ include file="../common/menubar.jsp"%>

            <div id="bestproduct">
              <!-- <p align="center" id="bestproduct-p">이번주 Best Product!!</p> -->
              <a id="bestpd1" href="#" data-text="Best">Best</a>
              <% if (loginUser != null &&
              loginUser.getMemberId().equals("ADMIN")) { %>
              <div align="right" style="width: 1700px">
                <br />
                <br />
                <br />
                <br />
                <a href="<%=contextPath%>/enrollForm.pd" class="btn btn-sm btn-secondary">상품등록</a>
                <a href="<%= contextPath%>/upEnrollForm.pd" class="btn btn-sm btn-secondary">상품수정</a>
              </div>
              <% } %>

              
              <div class="search">
                <input onchange="test();" onkeyup="enterkey();" class="searchclass" type="text" placeholder="검색어 입력"/>
                <img
                  onclick="test();"
                  class="searchimg"
                  src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png"
                />
              </div>
            </div>

            <script>
            	<% if(loginUser != null && loginUser.getMemberId().equals("ADMIN")){%>
              		$(".search").css("display","none");
                  $("#bestproduct").css("padding-left", "0px").css("padding-top", "0px");
            	<% } %>
            </script>



             <script>
              function test() {
                loadMoreData();
                  let lastScroll = 0;
              
                  $(document).scroll(function(e){
                      // 현재 높이 저장
                      var currentScroll = $(this).scrollTop();
                      // 전체 문서의 높이
                      var documentHeight = $(document).height();
                      // (현재 화면상단 + 현재 화면 높이)
                      var nowHeight = $(this).scrollTop() + $(window).height();
              
                      // 스크롤이 아래로 내려갔을 때만 해당 이벤트 진행
                      if(currentScroll > lastScroll){
                          // nowHeight을 통해 현재 화면의 끝이 어디까지 내려왔는지 파악 가능
                          // 전체 문서의 높이에 일정량 근접했을 때 글 더 불러오기
                          if(documentHeight < (nowHeight + (documentHeight * 0.1))){
                              console.log("이제 여기서 데이터를 더 불러와 주면 된다.");
                              // 데이터를 더 불러와야 함
                              
                          }
                      }
              
                      // 현재 위치 최신화
                      lastScroll = currentScroll;
                  });
              
                  function loadMoreData() {
                      let keyword = $(".searchclass").val();
                      $.ajax({
                          url: "searchkeyword.pr",
                          data: {keyword: keyword},
                          success: function(result){
                              let $paging = $(".page_nation");	                        
                              $("#content2_3").html("");
                              $paging.html("");
                              let value = "";
              
                              for (let i = 0; i < result.length; i++) {
                                  let rv = result[i];
                                  let titleImg = rv.titleImg;
                                  let productName = rv.productName;
                                  let productDesc = rv.productDesc;
                                  let productNo = rv.productNo;
              
                                  value += "<div class='content2_3c'>" +
                                      "<img id='img1' src='<%=contextPath%>/" + titleImg + "' alt='Slide 4' width='100%' height='300'>" +
                                      "<input type='hidden' id='pdno' name='pno' value='productNo'>" +
                                      "<div style='margin: 0; border: 0px;'>" + productName + "</div>" +
                                      "<div class='name_sub'>" + productDesc + "</div>" +
                                      "<div class='priceGroup'>" +
                                      "<div class='custom_pro' d-price='29900' d-custom='23900'>" + rv.discount + "%</div>" +
                                      "<div class='prs prsLine'>" + rv.price + "원</div>" +
                                      "<div class='prs prsBold'>" + rv.dPrice + "원</div>" +
                                      "</div>" +
                                      "</div>";
                              }
                              $("#content2_3").append(value);
                          },
                          error: function(){
                              console.log("ajax 통신 실패!");
                          }
                      });
                  }
              
                  function enterkey(event) {
                      if (event.keyCode === 13) {
                          // Enter 키 눌렸을 때 실행할 작업
                          loadMoreData();
                      }
                  }
              };
              </script> 


<!--
            <script>
            function enterkey() {
				if (window.event.keyCode == 13) {
					let keyword = $(".searchclass").val();							
					
					$.ajax({
						url:"searchkeyword.pr",
						data:{keyword:keyword},
						success:function(result){
							let $paging = $(".page_nation");	                        
							
							 $("#content2_3").html("");
							 $paging.html("");
							 
							let value = "";

	                        for (let i = 0; i < result.length; i++) {
	                          let rv = result[i];

	                          let titleImg = rv.titleImg;
	                          let productName = rv.productName;
	                          let productDesc = rv.productDesc;
	                          let productNo = rv.productNo;

	                          value +=
	                            "<div class='content2_3c'>" +
	                            "<img id='img1' src='<%=contextPath%>/" +
	                            titleImg +
	                            "' alt='Slide 4' width='100%' height='300'>" +
	                            "<input type='hidden' id='pdno' name='pno' value='productNo'>" +
	                            "<div style='margin: 0; border: 0px;'>" +
	                            productName +
	                            "</div>" +
	                            "<div class='name_sub'>" +
	                            productDesc +
	                            "</div>" +
	                            "<div class='priceGroup'>" +
	                            "<div class='custom_pro' d-price='29900' d-custom='23900'>" +
	                            rv.discount +
	                            "%" +
	                            "</div>" +
	                            "<div class='prs prsLine'>" +
	                            rv.price +
	                            "원" +
	                            "</div>" +
	                            "<div class='prs prsBold'>" +
	                            rv.dPrice +
	                            "원" +
	                            "</div>" +
	                            "</div>" +
	                            "</div>";
	                        }
	                        $("#content2_3").html(value);
						}, error:function(){
							console.log("ajax 통신 실패!");
						}
					});
				}
            }
            </script>
            -->

            <div id="content">
              <div id="content_2">
                <div id="content2_1">
                  <!-- 상품슬라이더-->
                  <div id="slider-container">
                    <div id="slider">
                      <% for (Product p : list) { %>
                      <div class="slide">
                        <div class="tag1">
                          <span style="background-color: #f7af36">BEST</span
                            ><span style="background-color: #e84200">new</span>
                          </div>
                          
                          <img class="slideimgg" src="<%=contextPath%>/<%=p.getTitleImg()%>" alt="Slide 1" width="100%" height="350"/>
                          <input type="hidden" id="pdno" name="pno" value="<%= p.getProductNo()%>">
                        <div style="margin: 0; border: 0px">
                          <%=p.getProductName()%>
                        </div>
                        <div class="name_sub"><%=p.getProductDesc()%></div>
                        <div class="priceGroup">
                          <div class="custom_pro" d-price="29900" d-custom="23900">
                            <%=p.getDiscount() + "%"%>
                          </div>
                          <div class="prs prsLine">
                            <%=p.getPrice() + "원"%>
                          </div>
                          <div class="prs prsBold">
                            <%=p.getdPrice() + "원"%>
                          </div>
                        </div>
                      </div>
                      <% } %>

                      <!-- Add more slides as needed -->
                    </div>
                    <div id="prev-btn" onclick="prevSlide()">&#10094;</div>
                    <div id="next-btn" onclick="nextSlide()">&#10095;</div>
                  </div>
                </div>
                <br>
                <br>
                <br>

                <div id="content2_2">
                  <div align="right" style="width: 90%; margin-bottom: 5px">
                    <button onclick="orderSelect(1);">인기순|</button>
                    <button onclick="recentSelect(1);">최신순|</button>
                    <button onclick="countSelect(1);">조회순</button>
                  </div>
                </div>

                <script>
                  function orderSelect(cpage) {
                    $.ajax({
                      url: "goodAjax.pd",
                      data: { cpage: cpage },
                      success: function (map) {
                    	 
                        let pi = map.pi;
                        let currentPage = pi.currentPage;
                        let startPage = pi.startPage;
                        let endPage = pi.endPage;
                        let maxPage = pi.maxPage;
                        let $paging = $(".page_nation");
						
                        $("#content2_3").html("");
                        $paging.html("");

                        if (currentPage != 1) {
                          $paging.append(
                            "<button onclick='orderSelect(" +(currentPage - 1) +");'>&lt;</button>");
                        }

                        for (let p = startPage; p <= endPage; p++) {
                          if (p == currentPage) {
                            $paging.append("<button class='rvpagebtn'>" + p + "</button>");
                          } else {
                            $paging.append("<button class='rvpagebtn' onclick='orderSelect("+p+");'>" + p +"</button>");
                          }
                        }

                        if (currentPage != maxPage) {
                          $paging.append(
                            "<button onclick='orderSelect(" + (currentPage + 1) +");'>&gt;</button>"
                          );
                        }

                        let result = map.goodList;

                        let value = "";

                        for (let i = 0; i < result.length; i++) {
                          let rv = result[i];

                          let titleImg = rv.titleImg;
                          let productName = rv.productName;
                          let productDesc = rv.productDesc;
                          let productNo = rv.productNo;

                          value +=
                            "<div class='content2_3c'>" +
                            "<img id='img1' src='<%=contextPath%>/" +
                            titleImg +
                            "' alt='Slide 4' width='100%' height='300'>" +
                            "<input type='hidden' id='pdno' name='pno' value='" +
                            productNo +
                            "'>" +
                            "<div style='margin: 0; border: 0px;'>" +
                            productName +
                            "</div>" +
                            "<div class='name_sub'>" +
                            productDesc +
                            "</div>" +
                            "<div class='priceGroup'>" +
                            "<div class='custom_pro' d-price='29900' d-custom='23900'>" +
                            rv.discount +
                            "%" +
                            "</div>" +
                            "<div class='prs prsLine'>" +
                            rv.price +
                            "원" +
                            "</div>" +
                            "<div class='prs prsBold'>" +
                            rv.dPrice +
                            "원" +
                            "</div>" +
                            "</div>" +
                            "</div>";
                        }
                        $("#content2_3").html(value);
                      },
                      error: function () {
                        console.log("ajax 통신실패!");
                      },
                    });
                  }

                  function recentSelect(cpage) {
                    $.ajax({
                      url: "recentAjax.pd",
                      data: { cpage: cpage },
                      success: function (map) {
                    	  let pi = map.pi;
                          let currentPage = pi.currentPage;
                          let startPage = pi.startPage;
                          let endPage = pi.endPage;
                          let maxPage = pi.maxPage;
                          let $paging = $(".page_nation");
                          
                        $("#content2_3").html("");
                        $paging.html("");
                        
                        if (currentPage != 1) {
                            $paging.append(
                              "<button onclick='recentSelect(" +(currentPage - 1) +");'>&lt;</button>");
                          }

                          for (let p = startPage; p <= endPage; p++) {
                            if (p == currentPage) {
                              $paging.append("<button class='rvpagebtn'>" + p + "</button>");
                            } else {
                              $paging.append("<button class='rvpagebtn' onclick='recentSelect("+p+");'>" + p +"</button>");
                            }
                          }

                          if (currentPage != maxPage) {
                            $paging.append(
                              "<button onclick='recentSelect(" + (currentPage + 1) +");'>&gt;</button>"
                            );
                          }
                        
                        
                          let result = map.recentList;

                        let value = "";

                        for (let i = 0; i < result.length; i++) {
                          let rv = result[i];

                          let titleImg = rv.titleImg;
                          let productName = rv.productName;
                          let productDesc = rv.productDesc;
                          let productNo = rv.productNo;

                          value +=
                            "<div class='content2_3c'>" +
                            "<img id='img1' src='<%=contextPath%>/" +
                            titleImg +
                            "' alt='Slide 4' width='100%' height='300'>" +
                            "<input type='hidden' id='pdno' name='pno' value='" +
                            productNo +
                            "'>" +
                            "<div style='margin: 0; border: 0px;'>" +
                            productName +
                            "</div>" +
                            "<div class='name_sub'>" +
                            productDesc +
                            "</div>" +
                            "<div class='priceGroup'>" +
                            "<div class='custom_pro' d-price='29900' d-custom='23900'>" +
                            rv.discount +
                            "%" +
                            "</div>" +
                            "<div class='prs prsLine'>" +
                            rv.price +
                            "원" +
                            "</div>" +
                            "<div class='prs prsBold'>" +
                            rv.dPrice +
                            "원" +
                            "</div>" +
                            "</div>" +
                            "</div>";
                        }
                        $("#content2_3").html(value);
                      },
                      error: function () {
                        console.log("ajax 통신 실패!!");
                      },
                    });
                  }

                  function countSelect(cpage) {
                    $.ajax({
                      url: "countAjax.pd",
                      data: { cpage: cpage },
                      success: function (map) {
                    	  let pi = map.pi;
                          let currentPage = pi.currentPage;
                          let startPage = pi.startPage;
                          let endPage = pi.endPage;
                          let maxPage = pi.maxPage;
                          let $paging = $(".page_nation");
                    	  
                    	  
                        $("#content2_3").html("");
                        $paging.html("");

                        let value = "";
                        
                        if (currentPage != 1) {
                            $paging.append(
                              "<button onclick='countSelect(" +(currentPage - 1) +");'>&lt;</button>");
                          }

                          for (let p = startPage; p <= endPage; p++) {
                            if (p == currentPage) {
                              $paging.append("<button class='rvpagebtn'>" + p + "</button>");
                            } else {
                              $paging.append("<button class='rvpagebtn' onclick='countSelect("+p+");'>" + p +"</button>");
                            }
                          }

                          if (currentPage != maxPage) {
                            $paging.append(
                              "<button onclick='countSelect(" + (currentPage + 1) +");'>&gt;</button>"
                            );
                          }
                          
                          let result = map.countList;
                        

                        for (let i = 0; i < result.length; i++) {
                          let rv = result[i];

                          let titleImg = rv.titleImg;
                          console.log(titleImg);
                          let productName = rv.productName;
                          let productDesc = rv.productDesc;
                          let productNo = rv.productNo;

                          value +=
                            "<div class='content2_3c'>" +
                            "<img id='img1' src='<%=contextPath%>/" +
                            titleImg +
                            "' alt='Slide 4' width='100%' height='300'>" +
                            "<input type='hidden' id='pdno' name='pno' value='" +
                            productNo +
                            "'>" +
                            "<div style='margin: 0; border: 0px;'>" +
                            productName +
                            "</div>" +
                            "<div class='name_sub'>" +
                            productDesc +
                            "</div>" +
                            "<div class='priceGroup'>" +
                            "<div class='custom_pro' d-price='29900' d-custom='23900'>" +
                            rv.discount +
                            "%" +
                            "</div>" +
                            "<div class='prs prsLine'>" +
                            rv.price +
                            "원" +
                            "</div>" +
                            "<div class='prs prsBold'>" +
                            rv.dPrice +
                            "원" +
                            "</div>" +
                            "</div>" +
                            "</div>";
                        }
                        $("#content2_3").html(value);
                      },
                      error: function () {
                        console.log("ajax 통신 실패!");
                      },
                    });
                  }
                </script>

                <!-- 상품 전체목록 -->
                <div id="content2_3">
                  <% for (Product p : list1) { %>
                  <div class="content2_3c">
                    <img id="img1" src="<%=contextPath%>/<%=p.getTitleImg()%>" alt="Slide 4" width="100%" height="300"/>
                    <input type="hidden" id="pdno" name="pno" value="<%=p.getProductNo()%>"/>
                    <div style="margin: 0; border: 0px">
                      <%=p.getProductName()%>
                    </div>
                    <div class="name_sub"><%=p.getProductDesc()%></div>
                    <div class="priceGroup">
                      <div class="custom_pro" d-price="29900" d-custom="23900">
                        <%=p.getDiscount() + "%"%>
                      </div>
                      <div class="prs prsLine"><%=p.getPrice() + "원"%></div>
                      <div class="prs prsBold"><%=p.getdPrice() + "원"%></div>
                    </div>
                  </div>
                  <% } %>
                </div>               
               
                <!-- 상품상세조회 script -->
                <script>
<<<<<<< HEAD
                  $(function () {
                    $(".content2_3c").click(function () {                  	
                      location.href ="<%=contextPath%>/detail.pd?pno=" +$(this).children("input").val();                   
                    });
                    $(".slideimgg").click(function(){
                      console.log($(this).siblings("input"));
                      location.href ="<%=contextPath%>/detail.pd?pno=" +$(this).siblings("input").val();
                    })
=======
                  
                  
                  $(document).on("click", ".content2_3c", function() {
                	  location.href ="<%=contextPath%>/detail.pd?pno=" +$(this).children("input").val();
>>>>>>> 2b47743fb0523cc27117b43c6b2662478bab3cf8
                  });
      				
                  $(document).on("click", ".slideimgg", function(){
                    location.href ="<%=contextPath%>/detail.pd?pno=" +$(this).siblings("input").val();
                  })
      			
                  
                </script>
                <script>
                  // $(function () {
                  //   $(".content2_3c").click(function () {                     
                  //     location.href ="<%=contextPath%>/detail.pd?pno=" +$(this).children("input").val();                   
                  //   });
                  //   $(".slideimgg").click(function(){
                  //     console.log($(this).siblings("input"));
                  //     location.href ="<%=contextPath%>/detail.pd?pno=" +$(this).siblings("input").val();
                  //   })
                  // });
                </script>

                <br>
                <br>
                <br>


                <!-- 페이징바 -->
                <div id="content2_4">
                  <div class="page_nation">
                    <a class="arrow pprev" href="#"></a>
                    <a class="arrow prev" href="#"></a>

                    <% for (int p = startPage; p <= endPage; p++) { %> 
                    <% if (p== currentPage) { %>
                    <a href="#" class="active"><%=p%></a>
                    	<% } else { %>
                    <a href="<%=contextPath%>/list.pd?cpage=<%=p%>" class="active"><%=p%></a>
                    	<% } %> 
                    <% } %>

                    <a class="arrow next" href="#"></a>
                    <a class="arrow nnext" href="#"></a>
                  </div>
                </div>
                <!-- 페이징바 끝 -->
                
       

              
              </div>
            </div>

            <script>
              let currentIndex = 0;
              const slides = document.querySelectorAll(".slide");

              function showSlides() {
                const totalSlides = slides.length / 4;
                currentIndex = (currentIndex + totalSlides) % totalSlides;

                const translateValue = -currentIndex * 100 + "%";
                document.getElementById("slider").style.transform =
                  "translateX(" + translateValue + ")";
              }

              function prevSlide() {
                if (currentIndex > 0) {
                  currentIndex--;
                  showSlides();
                } else {
                  //
                }
              }

              function nextSlide() {
                // if(currentIndex > slides.length-1){
                // }
                currentIndex++;
                showSlides();
              }
            </script>

            <%@ include file="../chatting/chatting.jsp" %>
              
            <%@ include file="../common/topBtn.jsp" %>
            <%@ include file="../common/footerbar.jsp"%>
          </body>
        </html></Product
      ></Product
    ></Product
  ></Product
>
