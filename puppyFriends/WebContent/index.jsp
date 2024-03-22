<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PuppyFriends</title>
<link rel="icon" sizes="32x32" type="image/png" href="resources/image/closeupimg.png">
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
	div{
		box-sizing: border-box;
	}
	#main-outer{
		width: 1903px;
		height: 980px;

	}
	#main-outer>div{
		width: 100%;

	}
	.main-content1{
		height: 38%;
		padding: 10px 70px;
	}
	.main-content2{
		height: 62%;
		padding: 10px 220px;
	}
	/*  */
	.main-content3{
		height: 500px;
		width: 1903px;
		padding: 10px 70px;
		margin-top: 30px;
	}
	.main-content3-1{
		height: 100%;
		width: 55%;
		padding-left: 150px;
		padding-right: 150px;
	}
	.main-content3-2{
		height: 100%;
		width: 40%;
		font-size: 30px;
	}
	.main-content3>div{
		float: left;
	}
	/*  */
	#map{
            height: 100%;
            width: 100%;
        }
		.swiper {
        width: 84%;
        height: 100%;
        padding-bottom: 20px;
		margin-left: 150px !important;
		margin-right: 150px !important;
		padding-top: 10px;
      }

      .swiper-wrapper {
        transition-timing-function: linear;
        column-gap: 30px;
      }

      .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;
        display: flex;
        justify-content: center;
        align-items: center;
        width: 20%;
        transition: transform 0.3s;
      }

      .swiper-slide img {
        display: block;
        width: 100%;
        height: 100%;
        object-fit: cover;
      }
	  .main-content2>div{
		width: 50%;
	  }
	  .main-content2-1, .main-content2-2{
		margin-top: 30px;
		float: left;
		height: 80%;
		padding-left: 80px;
	  }
	  .main-content2-3, .main-content2-4{
		float: left;
		height: 15%;
		padding-top: 20px;	
	  }
	  .img-wrapper1, .img-wrapper2 {
		width: 550px;
		height:480px;
		position:absolute;
		cursor:pointer;
		margin: auto;
		overflow: hidden;
	}
	.img-wrapper1 img, .img-wrapper2 img {
		width:100%;
		height: 100%;
		transition: all 0.3s linear;
	}
	.light {
	position:absolute;
	top:0;
	left:0;
	width:inherit;
	height:inherit;
	background:#faf6f6;
	/* 추가된 부분 */
	opacity:0;
	transition:all .1s linear;
	}

	.btn-plus1, .btn-plus2 {
	position:absolute;
	z-index: 999;
	top:205px;
	left:230px;
	background:rgb(255, 222, 239);
	width:120px;
	height:40px;
	border-radius: 20px;
	text-align:center;
	/* 추가된 부분 */
	opacity:0;
	transform:scale(2);
	transition:all .1s linear;
	}

	.btn-plus1 span, .btn-plus2 span {
		font-size:1.4em;
		color:#ffffff;
		line-height: 40px;
		font-weight: 900;
	}

	/* 추가된 부분 */
	.img-wrapper1:hover img, .img-wrapper2:hover img{
		transform: scale(1.1);
	}

	.img-wrapper1:hover .light, .img-wrapper2:hover .light{
	opacity:0.4;
	}

	/* 추가된 부분 */
	.img-wrapper1:hover .btn-plus1, .img-wrapper2:hover .btn-plus2 {
	opacity:1;
	transform:scale(1);
	}
	 #productBtn:hover, #kindBtn:hover{
		transform: scale(1.1);
	 } 
	 .way-come li{
	 font-size:25px;
	 } 
</style>
<script src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=9165mfbte9"></script>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet"> 
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 
        <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script> 
</head>
<body>

	<%@ include file="views/common/menubar.jsp" %>

	<script> 
		AOS.init(); 
	</script>
	<div id="main-outer">
		<div class="main-content1">
			<div class="swiper mySwiper">
				<div class="swiper-wrapper">
				  <div class="swiper-slide"><img src="resources/upfiles/2024022717015057486.jpg" alt=""></div>
				  <div class="swiper-slide"><img src="resources/upfiles/2024031916011178538.png" alt=""></div>
				  <div class="swiper-slide"><img src="resources/upfiles/2024031914335439204.jpg" alt=""></div>
				  <div class="swiper-slide"><img src="resources/upfiles/2024031914334488648.jpg" alt=""></div>
				  <div class="swiper-slide"><img src="resources/upfiles/2024031914333789382.jpg" alt=""></div>
				  <div class="swiper-slide"><img src="resources/upfiles/2024031914333158121.jpg" alt=""></div>
				  <div class="swiper-slide"><img src="resources/upfiles/2024031914353236074.jpg" alt=""></div>
				  <div class="swiper-slide"><img src="resources/upfiles/2024031914352576930.jpg" alt=""></div>
				  <div class="swiper-slide"><img src="resources/upfiles/2024031914371574633.jpg" alt=""></div>
				  
				</div>
			  </div>
		</div>

		
        	
            
            
        
		<div class="main-content2">
			
			<div class="main-content2-1">
					<div data-aos="fade-right" data-aos-duration="1000" data-aos-once="true">
					<div class="img-wrapper1" onclick="goProduct();">
						<img src="https://pethroom.com/pethroom/videos/Cassava_pc.gif"/>
						<div class="light"></div>
						<div class="btn-plus1"><span>둘러보기</span></div>
					</div>
				</div>
			</div>	
			<!--  -->
			<div class="main-content2-2">
				<div data-aos="fade-left" data-aos-duration="1000" data-aos-once="true">
				<div class="img-wrapper2" onclick="goKind();">
				<img src="resources/upfiles/2024031915013656200.png"/>
				<div class="light"></div>
				<div class="btn-plus2"><span>둘러보기</span></div>
				</div>
			  </div></div>
			  
			<div class="main-content2-3" align="center">
				<div data-aos="fade-up" data-aos-duration="800" data-aos-once="true">
				<button style="background-color: rgb(255, 118, 189); color: white; border: none; border-radius: 10px; width: 80px; padding-top: 5px;"  onclick="goProduct();" id="productBtn"><h2>상품</h2></button>
				</div>
			</div>
			<!--  -->
			<div class="main-content2-4" align="center">
				<div data-aos="fade-up" data-aos-duration="800" data-aos-once="true">
				<button style="background-color: rgb(255, 118, 189); color: white;  border: none; border-radius: 10px; width: 115px; padding-top: 5px;" onclick="goKind();" id="kindBtn"><h2>유치원</h2></button>
				</div>
			</div>
		</div>
		</div>
		



	<script>
		function goProduct(){
			location.href=HOME_PATH + "/list.pd?cpage=1"
		}
		function goKind(){
			location.href=HOME_PATH + "/kinderClass.crv"
		}
	</script>


	<div id="nol" style="width: 1903px; height: 2200px;" >

		<img src="resources/upfiles/놀러오개.png" alt="" style="width: 90%; height: 100%; margin-left: 90px;">
	</div>

	<div class="main-content3">
		<div class="main-content3-1">
			<div id="map" style="border: 5px solid rgb(198, 224, 255); border-radius: 50%;"></div>

			<script>
			var HOME_PATH = window.HOME_PATH || '.';
			var position = new naver.maps.LatLng(37.4989934, 127.032909);

			var map = new naver.maps.Map('map', {
				center: position,
				zoom: 19
			});

			var markerOptions = {
				position: position.destinationPoint(-30, 22),
				map: map,
				icon: 
				{content: [
			` <img src="resources/image/icon123.png" style="width: 90px; height: 70px;"/>`,
			].join(''),
				}
			};


			var marker = new naver.maps.Marker(markerOptions);
			</script>
		</div>
		<div class="main-content3-2">
			<ul class="way-come">
				<li>주소 : 서울특별시 강남구 강남구 테헤란로14길 6</li><br><br>
				<li>대중교통 : 알아서 타고오세요</li><br><br>
				<li>이용시간 : 오전 9시부터 오후 6시</li><br><br>
				<li>시설물 : 많음</li><br><br>
			</ul>
		</div>
	</div>

	<script>
		const swiperSlides = document.querySelectorAll('.swiper');
	
	swiperSlides.forEach(function (element, index) {
		element.classList.add("swiper-" + index);
		let swiper = new Swiper(".swiper-" + index, {
		  autoplay: {
				delay: 1,
				desableOnInteraction: false,
		  },
		  speed: 8e3,
		  loop: true,
		  slidesPerView: "auto",
		  freemode: true
		});
	});
	  </script>




	<%@ include file="views/chatting/chatting.jsp" %>
	
	<%@ include file="views/common/topBtn.jsp" %>
	<%@ include file="views/common/footerbar.jsp" %>





</body>
</html>