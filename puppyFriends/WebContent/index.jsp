<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" rel="stylesheet" type="text/css" />
<style>
	div{
		box-sizing: border-box;
	}
	#main-outer{
		width: 1903px;
		height: 1600px;

	}
	#main-outer>div{
		width: 100%;

	}
	.main-content1{
		height: 20%;
	}
	.main-content2{
		height: 50%;
		padding: 10px 150px;
	}
	.main-content3{
		height: 30%;
		padding: 10px 30px;
	}
	.main-content3-1{
		height: 100%;
		width: 60%;
		padding-left: 150px;
		padding-right: 150px;
	}
	.main-content3-2{
		height: 100%;
		width: 40%;
	}
	.main-content3>div{
		float: left;
	}
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
		height: 50%;
		width: 50%;
	  }
	  .main-content2-1, .main-content2-2{
		float: left;
	  }
	  .main-content2-3, .main-content2-4{
		float: left;
	  }
</style>
<script src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=9165mfbte9"></script>
</head>
<body>

	<%@ include file="views/common/menubar.jsp" %>

	<div id="main-outer">
		<div class="main-content1">
			<div class="swiper mySwiper">
				<div class="swiper-wrapper">
				  <div class="swiper-slide"><img src="resources/upfiles/2024022717015057486.jpg" alt=""></div>
				  <div class="swiper-slide"><img src="resources/upfiles/2024022717015057486.jpg" alt=""></div>
				  <div class="swiper-slide"><img src="resources/upfiles/2024022717015057486.jpg" alt=""></div>
				  <div class="swiper-slide"><img src="resources/upfiles/2024022717015057486.jpg" alt=""></div>
				  <div class="swiper-slide"><img src="resources/upfiles/2024022717015057486.jpg" alt=""></div>
				  <div class="swiper-slide"><img src="resources/upfiles/2024022717015057486.jpg" alt=""></div>
				  <div class="swiper-slide"><img src="resources/upfiles/2024022717015057486.jpg" alt=""></div>
				  <div class="swiper-slide"><img src="resources/upfiles/2024022717015057486.jpg" alt=""></div>
				  
				</div>
			  </div>
		</div>
		<div class="main-content2">
			<div class="main-content2-1"><img src="resources/upfiles/2024022718261020803.jpg" style="width: 60%; height: 100%;"></div>
			<div class="main-content2-2">상품~~~</div>
			<div class="main-content2-3">호텔 유치원~~</div>
			<div class="main-content2-4"><img src="resources/upfiles/2024022717015057486.jpg" style="width: 60%; height: 100%;"></div>
		</div>
		<div class="main-content3">
			<div class="main-content3-1">
				<div id="map"></div>

				<script>
				var HOME_PATH = window.HOME_PATH || '.';

				var cityhall = new naver.maps.LatLng(37.4989934, 127.032909),
					map = new naver.maps.Map('map', {
						center: cityhall.destinationPoint(0, 0),
						zoom: 16
					}),
					marker = new naver.maps.Marker({
						map: map,
						position: cityhall
					});

				var contentString = [
						'<div class="iw_inner">',
						'   <h3>PUPPYFRIENDS</h3>',
						'   <p>서울특별시 강남구 강남구 테헤란로14길 6<br />',
						'       <img src="'+ HOME_PATH +'/img/example/hi-seoul.jpg" width="55" height="55" alt="puppyfriends" class="thumb" /><br />',
						'       <br />',
						'       <a href="http://localhost:8083/puppy/" target="_blank">http://localhost:8083/puppy//</a>',
						'   </p>',
						'</div>'
					].join('');

				var infowindow = new naver.maps.InfoWindow({
					content: contentString
				});

				naver.maps.Event.addListener(marker, "click", function(e) {
					if (infowindow.getMap()) {
						infowindow.close();
					} else {
						infowindow.open(map, marker);
					}
				});

				// infowindow.open(map, marker);
				infowindow.close();
				</script>
			</div>
			<div class="main-content3-2">
				<ul>
					<li>주소 : ~~~</li>
					<li>대중교통 : ~~</li>
					<li>이용시간 : ~~~</li>
					<li>시설물 : ~~~</li>
				</ul>
			</div>
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