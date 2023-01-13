<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_main.css">
</head>
<body class="main-body">
<div class="container">
	<div class="main-logo">
		<div class="main-logoBox">
			<a href="${pageContext.request.contextPath}/main/intro.do">
				<img src="${pageContext.request.contextPath}/images/hyem/logo.png" width="120">
			</a>
		</div>
	</div>
	<div class="main-background">
		<a href="${pageContext.request.contextPath}/main/intro.do">START</a>
		<a href="${pageContext.request.contextPath}/member/loginForm.do">LOGIN</a>
		<a href="${pageContext.request.contextPath}/member/registerUserForm.do">SIGN IN</a>
		<img src="${pageContext.request.contextPath}/images/hyem/mainImg.png">
	</div>
	<div class="main-menu">
		<ul>
			<li><a href="${pageContext.request.contextPath}/notice/noticeList.do">NOTICE</a></li>
			<li><a href="${pageContext.request.contextPath}/game/gameList.do">BOARDGAME</a></li>
			<li><a href="${pageContext.request.contextPath}/reserve/reserveMain.do">RESERVATION</a></li>
			<li><a href="${pageContext.request.contextPath}/inquiry/inquiryList.do">QUESTIONS</a></li>
		</ul>
	</div>
</div>
</body>
</html>