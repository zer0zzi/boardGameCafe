<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<style> @import url('https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap'); </style>
<style type="text/css">
@font-face {
      src: url("../fonts/DungGeunMo.ttf");
      font-family: "DungGeunMo";
}

/* 전체 레이아웃 */
*{
	font-family: "DungGeunMo";
	font-size: 50px;
	
}
a:link{
	text-decoration:none;
	color:#fff;
}
a:visited{
	text-decoration:none;
	color:#fff;
}
a:hover{
	text-decoration:none;
	color:#fff87a;
}

*{
	margin: 0;
	padding: 0;

}

.background{
	background-image: url(../images/hyem/mainImg.png);
	background-repeat: no-repeat;
    background-position: center;
    min-height: 760px;
	position: relative;
	background-color: #000;
}

.logo{
	position: absolute;
	left: 350px;
	top: 80px;
	width: 120px;
	height: 120px;
	border: 1px solid #c3c3c3;
	border-radius: 10px;
}

.menu{
	position: absolute;
	right: 200px;
	top: 100px;
}

.menu ul li{
	margin-bottom: 20px;
}

.login{
/* 	position: absolute;
	top: 100px; */
	display: flex;/*하위 요소를 수직으로 쌓을 수 있는 공간을 만듬*/
	align-items: center;/*세로 정렬*/
	justify-content: center;/*가로 정렬*/	
	height: 600px;
}
</style>
</head>
<body>
<div class="background">
	<div class="logo">
		<img src="${pageContext.request.contextPath}/images/hyem/logo.png" width="120">
	</div>
	<div class="login">
		<a href="${pageContext.request.contextPath}/main/intro.do">START</a>
	</div>
	<div class="menu">
		<ul>
			<li><a href="${pageContext.request.contextPath}/game/gameList.do">BOARD GAME</a></li>
			<li><a href="${pageContext.request.contextPath}/reserve/reserveMain.do">RESERVATION</a></li>
			<li><a href="${pageContext.request.contextPath}/notice/noticeList.do">NOTICE</a></li>
			<li><a href="${pageContext.request.contextPath}/inquiry/inquiryList.do">QUESTIONS</a></li>
		</ul>
	</div>
</div>
</body>
</html>