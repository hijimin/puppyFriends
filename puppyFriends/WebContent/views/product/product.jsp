<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <style>
        div{
            box-sizing: border-box; 
            /* border: 1px solid red; */
        }
        
        body{
            margin: 0px;
        }   
        
        #content{
          /* height: 2300px; */
          height: auto;
          display: flex;
            justify-content: center;
        }

        #bestproduct{height: 180px;}

        #content>div{height: 100%; float: left;}
        
        #content_2{
            /* width: 80%; */
            width: 1903px;
            min-width: 1000px;
        }
       

        #content_2>div{width: 100%;}
        #content2_1{
            /* height: 20%; */
            height: auto;
        }
        #content2_2{
            /* height: 2%; */
            height: auto;
        }
        #content2_3{
            height: auto;
            display: grid;
            grid-template-columns: repeat(4,1fr);
            gap: 15px;
        }

        /*페이징바 세로길이*/
        #content2_4{
            height: 60px;
            margin-bottom: 100px;
        }

        /* #content2_3>div{height: 100%; float: left;} */
        #content2_3{
            padding-left: 100px;
            padding-right: 100px;
        }
        .content2_3c>img{
            height: 400px;
        }


        /*인기순 최신순 조회순 버튼*/
        #content2_2 a{ 
            text-decoration: none;
            font-size: 15px;
        }
        #content2_2>div{margin-top: 10px;}





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

        .name_sub{
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
    color: rgba(0,0,0,0.2);
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
    #bestproduct-p{
        /* display: inline; */
        margin-top: 100px;
    }

    /* 페이징 바*/
    .page_wrap {
	text-align:center;
	font-size:0;
    }
    .page_nation {
        display:inline-block;
        margin-top: 10px;
        margin-left: 37%;        
    }
    .page_nation .none {
        display:none;
    }
    .page_nation a {
        display:block;
        margin:0 3px;
        float:left;
        border:1px solid #e6e6e6;
        width:28px;
        height:28px;
        line-height:28px;
        text-align:center;
        background-color:#fff;
        font-size:13px;
        color:#999999;
        text-decoration:none;
    }
    .page_nation .arrow {
        border:1px solid #ccc;
    }
    .page_nation .pprev {
        background:#f8f8f8 url('resources/product_img/page_pprev.png') no-repeat center center;
        margin-left:0;
    }
    .page_nation .prev {
        background:#f8f8f8 url('resources/product_img/page_prev.png') no-repeat center center;
        margin-right:7px;
    }
    .page_nation .next {
        background:#f8f8f8 url('resources/product_img/page_next.png') no-repeat center center;
        margin-left:7px;
    }
    .page_nation .nnext {
        background:#f8f8f8 url('resources/product_img/page_nnext.png') no-repeat center center;
        margin-right:0;
    }
    .page_nation a.active {
        background-color:#42454c;
        color:#fff;
        border:1px solid #42454c;
    }

</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<%@ include file="../common/menubar.jsp" %>

        <div id="bestproduct">
            <p align="center" id="bestproduct-p">이번주 Best Product!!</p>
            <% if(loginUser != null && loginUser.getMemberId().equals("admin")){ %>
            <div align="right" style="width: 1700px;">
                <br><br><br><br>
                <a href="<%= contextPath %>/enrollForm.pd" class="btn btn-sm btn-secondary">글작성1</a>
            </div>
            <% } %>
            
        </div>

        <div id="content">
            <div id="content_2">
                <div id="content2_1"><!-- 상품슬라이더-->
                    <div id="slider-container">
                        <div id="slider">
                          <div class="slide" id="slidefirst"><img src="https://pethroom.com/web/product/medium/202203/d8a532a1c4e90f4b81f2b727e6a2fed1.jpg" alt="Slide 1" width="100%" height="300">
                                <div style="margin: 0; border: 0px;">더스트 프리 벤토나이트 오리지널</div>
                                <div class="name_sub">먼지 최소화 & 단단 응고력 & 사막화 방지</div>
                                <div class="priceGroup">
                                    <div class="custom_pro" d-price="29900" d-custom="23900">50%</div>  
                                    <div class="prs prsLine">15,000원</div>
                                    <div class="prs prsBold">7,500원</div>
                                </div>
                            </div>

                          <div class="slide"><img src="https://pethroom.com/web/product/medium/202401/5d96fc6fc0a74c85c6e5586983842169.jpg" alt="Slide 2" width="100%" height="300">
                            <div style="margin: 0; border: 0px;">허니 터키츄 (스틱/본/링/롤리팝)</div>
                            <div class="name_sub">자연에서 얻은 황금빛 마누카꿀이 가득!</div>
                            <div class="priceGroup">
                                <div class="custom_pro" d-price="29900" d-custom="23900">50%</div>  
                                <div class="prs prsLine">30,000원</div>
                                <div class="prs prsBold">15,000원</div>
                            </div>                     
                          </div>


                          <div class="slide"><img src="https://pethroom.com/web/product/medium/202208/6406178e3005b192086b575413018e52.jpg" alt="Slide 3" width="100%" height="300">
                            <div style="margin: 0; border: 0px;">제로 워터리스 샴푸</div>
                            <div class="name_sub">물없이 간편하게 세정할 수 있는 샴푸</div>
                            <div class="priceGroup">
                                <div class="custom_pro" d-price="29900" d-custom="23900">50%</div>  
                                <div class="prs prsLine">18,000원</div>
                                <div class="prs prsBold">9,000원</div>
                            </div>

                          </div>

                          <div class="slide"><img src="https://pethroom.com/web/product/medium/202302/3501a22b0acdb62258137a837a8d7f45.jpg" alt="Slide 4" width="100%" height="300">
                            <div style="margin: 0; border: 0px;">힐링 슬리커 브러쉬</div>
                            <div class="name_sub">306개의 폴리케톤 빛살로 편안하게</div>
                            <div class="priceGroup">
                                <div class="custom_pro" d-price="29900" d-custom="23900">50%</div>  
                                <div class="prs prsLine">30,000원</div>
                                <div class="prs prsBold">15,000원</div>
                            </div>                    
                         </div>

                          <div class="slide"><img src="https://pethroom.com/web/product/medium/202401/fa7a888991bd4636431a01bcb5312ffd.jpg" alt="Slide 1" width="100%" height="300">
                            <div style="margin: 0; border: 0px;">크럼블 프리 카사바</div>
                            <div class="name_sub">부스러기 완벽 방어! 천연 카사바 모래</div>
                            <div class="priceGroup">
                                <div class="custom_pro" d-price="29900" d-custom="23900">50%</div>  
                                <div class="prs prsLine">40,000원</div>
                                <div class="prs prsBold">20,000원</div>
                            </div>
                          </div>

                          <div class="slide"><img src="https://pethroom.com/web/product/medium/202203/025c6256e23d84273e6ac8d7b344d432.jpg" alt="Slide 2" width="100%" height="300">
                            <div style="margin: 0; border: 0px;">오도어 프리 벤토나이트 포레스트</div>
                            <div class="name_sub">강력 탈취력 & 먼지 최소화</div>
                            <div class="priceGroup">
                                <div class="custom_pro" d-price="29900" d-custom="23900">50%</div>  
                                <div class="prs prsLine">30,000원</div>
                                <div class="prs prsBold">15,000원</div>
                            </div>
                         </div>

                          <div class="slide"><img src="https://pethroom.com/web/product/medium/202202/9d1877e9709444e4d4eaed3b5c284e5e.jpg" alt="Slide 3" width="100%" height="300">
                            <div style="margin: 0; border: 0px;">와이드 커브 화장실</div>
                            <div class="name_sub">초대형 돔 형태 화장실</div>
                            <div class="priceGroup">
                                <div class="custom_pro" d-price="29900" d-custom="23900">50%</div>  
                                <div class="prs prsLine">80,000원</div>
                                <div class="prs prsBold">40,000원</div>
                            </div>
                        
                          </div>

                          <div class="slide"><img src="https://pethroom.com/web/product/medium/202301/0120e2a2fd062625451a7ffad4db374e.jpg" alt="Slide 4" width="100%" height="300">
                            <div style="margin: 0; border: 0px;">페스룸X위글위글 슬로우 피더</div>
                            <div class="name_sub">급하게 먹는 아이들을 위한 급체방지식기</div>
                            <div class="priceGroup">
                                <div class="custom_pro" d-price="29900" d-custom="23900">50%</div>  
                                <div class="prs prsLine">15,000원</div>
                                <div class="prs prsBold">7,500원</div>
                            </div>
                         </div>
                          <!-- Add more slides as needed -->
                        </div>
                        <div id="prev-btn" onclick="prevSlide()">&#10094;</div>
                        <div id="next-btn" onclick="nextSlide()">&#10095;</div>
                      </div>
                </div>
                <div id="content2_2">
                    <div align="right" style="width: 90%; margin-bottom: 5px;" >
                        <a href="">인기순|</a><a href="">최신순|</a><a href="">조회순</a> 
                    </div>
                </div>
                <div id="content2_3">

                    <div class="content2_3c"><img src="https://pethroom.com/web/product/medium/202301/0120e2a2fd062625451a7ffad4db374e.jpg" alt="Slide 4" width="100%" height="300">
                        <div style="margin: 0; border: 0px;">페스룸X위글위글 슬로우 피더</div>
                        <div class="name_sub">급하게 먹는 아이들을 위한 급체방지식기</div>
                        <div class="priceGroup">
                            <div class="custom_pro" d-price="29900" d-custom="23900">50%</div>  
                            <div class="prs prsLine">15,000원</div>
                            <div class="prs prsBold">7,500원</div>
                        </div>
                     </div>

                     <div class="content2_3c"><img src="https://pethroom.com/web/product/medium/202301/0120e2a2fd062625451a7ffad4db374e.jpg" alt="Slide 4" width="100%" height="300">
                        <div style="margin: 0; border: 0px;">페스룸X위글위글 슬로우 피더</div>
                        <div class="name_sub">급하게 먹는 아이들을 위한 급체방지식기</div>
                        <div class="priceGroup">
                            <div class="custom_pro" d-price="29900" d-custom="23900">50%</div>  
                            <div class="prs prsLine">15,000원</div>
                            <div class="prs prsBold">7,500원</div>
                        </div>
                     </div>

                     <div class="content2_3c"><img src="https://pethroom.com/web/product/medium/202301/0120e2a2fd062625451a7ffad4db374e.jpg" alt="Slide 4" width="100%" height="300">
                        <div style="margin: 0; border: 0px;">페스룸X위글위글 슬로우 피더</div>
                        <div class="name_sub">급하게 먹는 아이들을 위한 급체방지식기</div>
                        <div class="priceGroup">
                            <div class="custom_pro" d-price="29900" d-custom="23900">50%</div>  
                            <div class="prs prsLine">15,000원</div>
                            <div class="prs prsBold">7,500원</div>
                        </div>
                     </div>

                     <div class="content2_3c"><img src="https://pethroom.com/web/product/medium/202301/0120e2a2fd062625451a7ffad4db374e.jpg" alt="Slide 4" width="100%" height="300">
                        <div style="margin: 0; border: 0px;">페스룸X위글위글 슬로우 피더</div>
                        <div class="name_sub">급하게 먹는 아이들을 위한 급체방지식기</div>
                        <div class="priceGroup">
                            <div class="custom_pro" d-price="29900" d-custom="23900">50%</div>  
                            <div class="prs prsLine">15,000원</div>
                            <div class="prs prsBold">7,500원</div>
                        </div>
                     </div>

                     <div class="content2_3c"><img src="https://pethroom.com/web/product/medium/202301/0120e2a2fd062625451a7ffad4db374e.jpg" alt="Slide 4" width="100%" height="300">
                        <div style="margin: 0; border: 0px;">페스룸X위글위글 슬로우 피더</div>
                        <div class="name_sub">급하게 먹는 아이들을 위한 급체방지식기</div>
                        <div class="priceGroup">
                            <div class="custom_pro" d-price="29900" d-custom="23900">50%</div>  
                            <div class="prs prsLine">15,000원</div>
                            <div class="prs prsBold">7,500원</div>
                        </div>
                     </div>

                     <div class="content2_3c"><img src="https://pethroom.com/web/product/medium/202301/0120e2a2fd062625451a7ffad4db374e.jpg" alt="Slide 4" width="100%" height="300">
                        <div style="margin: 0; border: 0px;">페스룸X위글위글 슬로우 피더</div>
                        <div class="name_sub">급하게 먹는 아이들을 위한 급체방지식기</div>
                        <div class="priceGroup">
                            <div class="custom_pro" d-price="29900" d-custom="23900">50%</div>  
                            <div class="prs prsLine">15,000원</div>
                            <div class="prs prsBold">7,500원</div>
                        </div>
                     </div>

                     <div class="content2_3c"><img src="https://pethroom.com/web/product/medium/202301/0120e2a2fd062625451a7ffad4db374e.jpg" alt="Slide 4" width="100%" height="300">
                        <div style="margin: 0; border: 0px;">페스룸X위글위글 슬로우 피더</div>
                        <div class="name_sub">급하게 먹는 아이들을 위한 급체방지식기</div>
                        <div class="priceGroup">
                            <div class="custom_pro" d-price="29900" d-custom="23900">50%</div>  
                            <div class="prs prsLine">15,000원</div>
                            <div class="prs prsBold">7,500원</div>
                        </div>
                     </div>

                     <div class="content2_3c"><img src="https://pethroom.com/web/product/medium/202301/0120e2a2fd062625451a7ffad4db374e.jpg" alt="Slide 4" width="100%" height="300">
                        <div style="margin: 0; border: 0px;">페스룸X위글위글 슬로우 피더</div>
                        <div class="name_sub">급하게 먹는 아이들을 위한 급체방지식기</div>
                        <div class="priceGroup">
                            <div class="custom_pro" d-price="29900" d-custom="23900">50%</div>  
                            <div class="prs prsLine">15,000원</div>
                            <div class="prs prsBold">7,500원</div>
                        </div>
                     </div>

                     <div class="content2_3c"><img src="https://pethroom.com/web/product/medium/202301/0120e2a2fd062625451a7ffad4db374e.jpg" alt="Slide 4" width="100%" height="300">
                        <div style="margin: 0; border: 0px;">페스룸X위글위글 슬로우 피더</div>
                        <div class="name_sub">급하게 먹는 아이들을 위한 급체방지식기</div>
                        <div class="priceGroup">
                            <div class="custom_pro" d-price="29900" d-custom="23900">50%</div>  
                            <div class="prs prsLine">15,000원</div>
                            <div class="prs prsBold">7,500원</div>
                        </div>
                     </div>

                     <div class="content2_3c"><img src="https://pethroom.com/web/product/medium/202301/0120e2a2fd062625451a7ffad4db374e.jpg" alt="Slide 4" width="100%" height="300">
                        <div style="margin: 0; border: 0px;">페스룸X위글위글 슬로우 피더</div>
                        <div class="name_sub">급하게 먹는 아이들을 위한 급체방지식기</div>
                        <div class="priceGroup">
                            <div class="custom_pro" d-price="29900" d-custom="23900">50%</div>  
                            <div class="prs prsLine">15,000원</div>
                            <div class="prs prsBold">7,500원</div>
                        </div>
                     </div>

                     <div class="content2_3c"><img src="https://pethroom.com/web/product/medium/202301/0120e2a2fd062625451a7ffad4db374e.jpg" alt="Slide 4" width="100%" height="300">
                        <div style="margin: 0; border: 0px;">페스룸X위글위글 슬로우 피더</div>
                        <div class="name_sub">급하게 먹는 아이들을 위한 급체방지식기</div>
                        <div class="priceGroup">
                            <div class="custom_pro" d-price="29900" d-custom="23900">50%</div>  
                            <div class="prs prsLine">15,000원</div>
                            <div class="prs prsBold">7,500원</div>
                        </div>
                     </div>

                     <div class="content2_3c"><img src="https://pethroom.com/web/product/medium/202301/0120e2a2fd062625451a7ffad4db374e.jpg" alt="Slide 4" width="100%" height="300">
                        <div style="margin: 0; border: 0px;">페스룸X위글위글 슬로우 피더</div>
                        <div class="name_sub">급하게 먹는 아이들을 위한 급체방지식기</div>
                        <div class="priceGroup">
                            <div class="custom_pro" d-price="29900" d-custom="23900">50%</div>  
                            <div class="prs prsLine">15,000원</div>
                            <div class="prs prsBold">7,500원</div>
                        </div>
                     </div>

                     
                </div>
                <div id="content2_4">
                    <div class="page_nation">
                        <a class="arrow pprev" href="#"></a>
                        <a class="arrow prev" href="#"></a>
                        <a href="#" class="active">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#">5</a>
                        <a href="#">6</a>
                        <a href="#">7</a>
                        <a href="#">8</a>
                        <a href="#">9</a>
                        <a href="#">10</a>
                        <a class="arrow next" href="#"></a>
                        <a class="arrow nnext" href="#"></a>
                     </div>
                    </div>
                    



                </div>
            </div>

        </div>

        
    

    <script>
        let currentIndex = 0;
        const slides = document.querySelectorAll('.slide');
      
        function showSlides() {
          const totalSlides = (slides.length/4)+1;
          currentIndex = (currentIndex + totalSlides) % totalSlides;
      
          const translateValue = -currentIndex * 100 + '%';
          document.getElementById('slider').style.transform = 'translateX(' + translateValue + ')';
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

	  <%@ include file="../common/footerbar.jsp" %>

</body>
</html>