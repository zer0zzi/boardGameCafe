<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap')
	;
</style>
<style>
* {
	box-sizing: border-box;
}
body {
	border: 1px solid;
	font-family: Arial;
	border: 1px solid;
	font-family: Arial;
	margin: 0 auto;
	color: #c0293d
}
.page-content {
	width: 100%;
	height: 1750px;
	align: center;
	background-image: url('../images/soon/background3.jpg');
	background-position: center;
}
h2 {
	text-align: center; 
	font-family : 'Press Start 2P', cursive;
	color: #ebeadf;
	margin-top: 0;
}
h3{
	text-align: center;
	color: #FFF;
}
/* 지도 */
#map {
	margin: 0 auto;
	position: relative;
	width: 50%;
}
.container {
	position: relative;
	width: 70%;
	margin: 0 auto;
}

/* Hide the images by default */
.mySlides {
	display: none;
}

/* Add a pointer when hovering over the thumbnail images */
.cursor {
	cursor: pointer;
}

/* Number text (1/3 etc) */
.numbertext {
	color: #f2f2f2;
	font-size: 12px;
	padding: 8px 12px;
	position: absolute;
	top: 0;
}

/* Container for image text */
.caption-container {
	text-align: center;
	background-color: #222;
	padding: 2px 16px;
	color: white;
}

.row:after {
	content: "";
	display: table;
	clear: both;
}

/* Six columns side by side */
.column {
	float: left;
	width: 16.66%;
}

/* Add a transparency effect for thumnbail images */
.demo {
	opacity: 0.6;
}

.active, .demo:hover {
	opacity: 1;
}
</style>
<body>

	<div class="page-main">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="content-main"></div>
	</div>

	<div class="page-content">
		<div class="container-label">
			<div class="content-label">
				<br>
				<h2>ROOM</h2>
			</div>
			<div class="container">
				<div class="mySlides">
					<div class="numbertext">1 / 6</div>
					<img src="../images/hoon/room1.jpg" style="width: 100%">
				</div>

				<div class="mySlides">
					<div class="numbertext">2 / 6</div>
					<img src="../images/hoon/room2.jpg" style="width: 100%">
				</div>

				<div class="mySlides">
					<div class="numbertext">3 / 6</div>
					<img src="../images/hoon/room3.jpg" style="width: 100%">
				</div>

				<div class="mySlides">
					<div class="numbertext">4 / 6</div>
					<img src="../images/hoon/studyroom1.jpg" style="width: 100%">
				</div>

				<div class="mySlides">
					<div class="numbertext">5 / 6</div>
					<img src="../images/hoon/studyroom2.jpg" style="width: 100%">
				</div>

				<div class="mySlides">
					<div class="numbertext">6 / 6</div>
					<img src="../images/hoon/studyroom4.jpg" style="width: 100%">
				</div>
			</div>


			<div class="caption-container">
				<p id="caption"></p>
			</div>

			<div class="row">
				<div class="column">
					<img class="demo cursor" src="../images/hoon/room1.jpg"
						style="width: 100%" onclick="currentSlide(1)" alt="2~4인">
				</div>
				<div class="column">
					<img class="demo cursor" src="../images/hoon/room2.jpg"
						style="width: 100%" onclick="currentSlide(2)" alt="4~6인">
				</div>
				<div class="column">
					<img class="demo cursor" src="../images/hoon/room3.jpg"
						style="width: 100%" onclick="currentSlide(3)" alt="6~8인">
				</div>
				<div class="column">
					<img class="demo cursor" src="../images/hoon/studyroom1.jpg"
						style="width: 100%" onclick="currentSlide(4)" alt="8~10인">
				</div>
				<div class="column">
					<img class="demo cursor" src="../images/hoon/studyroom2.jpg"
						style="width: 100%" onclick="currentSlide(5)" alt="10~12인">
				</div>
				<div class="column">
					<img class="demo cursor" src="../images/hoon/studyroom4.jpg"
						style="width: 100%" onclick="currentSlide(6)" alt="12인 이상">
				</div>
			</div>
		</div>
		<br>
		<h2>LOCATION</h2>
		<div id="map" style="width: 500px; height: 400px;">
		</div>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e8262126fa9b69618f5829c9fcf52dc7">
			
		</script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(37.499190489487255,
						127.03332488938678), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

			// 마커가 표시될 위치입니다
			var markerPosition = new kakao.maps.LatLng(37.499190489487255,
					127.03332488938678);

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				position : markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);

			// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
			// marker.setMap(null);
		</script>
		<script>
			let slideIndex = 1;
			showSlides(slideIndex);

			function plusSlides(n) {
				showSlides(slideIndex += n);
			}

			function currentSlide(n) {
				showSlides(slideIndex = n);
			}

			function showSlides(n) {
				let i;
				let slides = document.getElementsByClassName("mySlides");
				let dots = document.getElementsByClassName("demo");
				let captionText = document.getElementById("caption");
				if (n > slides.length) {
					slideIndex = 1
				}
				if (n < 1) {
					slideIndex = slides.length
				}
				for (i = 0; i < slides.length; i++) {
					slides[i].style.display = "none";
				}
				for (i = 0; i < dots.length; i++) {
					dots[i].className = dots[i].className
							.replace(" active", "");
				}
				slides[slideIndex - 1].style.display = "block";
				dots[slideIndex - 1].className += " active";
				captionText.innerHTML = dots[slideIndex - 1].alt;
			}
		</script>
		<div>
			<h3>서울 강남구 테헤란로 132 한독약품빌딩 8층</h3>
			<h3>(우) 06235 (지번) 역삼동 735-1</h3>
		</div>
	</div>
</body>
</html>


