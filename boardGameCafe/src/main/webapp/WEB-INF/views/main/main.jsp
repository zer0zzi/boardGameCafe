<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<style> @import url('https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap'); </style>
<style type="text/css">
/*
.page-main{
	background-color:#1f093a;
}
*/
li a:link{
	text-decoration:none;
	color:#fff87a;
}
li a:visited{
	text-decoration:none;
	color:#fff87a;
}
li a:hover{
	text-decoration:none;
	color:#a8a347;
}

.content-photo{
	height:1070px;
	align:center;
	background-image: url('../images/soon/background.jpg');
	background-repeat:no-repeat;;
	background-size:100%; 
	background-attachment:scroll;
}

.content ul{
	list-style:none;
}
.content li{
	line-height:130px; 	
}
.content{
	font-family:'Press Start 2P', cursive;
	font-size:40px;
	text-align:center;
	width:100%;
	height:600px;
}

#content-text{
	width:100%;
	height:100%;
	margin:0 auto;
	padding:0;
}
</style>
</head>
<body>
<div class="page-main">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="content-photo">
		<div class="content">
			<ul id="content-text">
				<li><a href="${pageContext.request.contextPath}/main/intro.do">CAFE</a></li>
				<li><a href="${pageContext.request.contextPath}/game/gameList.do">BOARD GAME</a></li>
				<li><a href="${pageContext.request.contextPath}/reserve/reserve.do">RESERVATION</a></li>
				<li><a href="${pageContext.request.contextPath}/notice/noticeList.do">NOTICE</a></li>
				<li><a href="${pageContext.request.contextPath}/inquiry/inquiryList.do">QUESTIONS</a></li>
			</ul>
		</div>
	</div>
	<div class="content-main">
	</div>
</div>
</body>
</html>