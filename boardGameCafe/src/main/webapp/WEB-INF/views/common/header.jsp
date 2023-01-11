<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header 시작 -->
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>@import url('https://fonts.googleapis.com/css2?family=Bungee+Shade&display=swap');</style>
<style>
a:link{
	text-decoration:none;
	color:#FFF;
}
a:visited{
	text-decoration:none;
	color:#FFF;
}
a:hover{
	text-decoration:none;
	color:#6C6C6C;
}
.overlay {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: rgb(0,0,0);
  background-color: rgba(3, 48, 64, 0.5);
  overflow-x: hidden;
  transition: 0.5s;
}
.overlay-content {
  position: relative;
  top: 25%;
  width: 100%;
  text-align: center;
  margin-top: 30px;
}
.overlay a {
  padding: 8px;
  text-decoration: none;
  font-size: 36px;
  color: #FFF;
  display: block;
  transition: 0.3s;
}
.overlay a:hover, .overlay a:focus {
  color: #f1f1f1;
}
.overlay .closebtn {
  position: absolute;
  top: 20px;
  right: 45px;
  font-size: 60px;
}
@media screen and (max-height: 450px) {
  .overlay a {font-size: 20px}
  .overlay .closebtn {
  font-size: 40px;
  top: 15px;
  right: 35px;
  }
}

/* ------------------------------ */

body{
	font-family: 'Lato', sans-serif;
	border:1px solid;
	margin:0 auto;
	width:100%;
	height:100%;
}
.page-title{
	background-color:#0891bf;
	margin:0 auto;
	width:100%;
	height:180px;
}
.title-photo{
	width:100%;
	margin:0 auto;
}
.login-part{
	width:90%;
	height:40px;
	text-align:right;
	float:right;
	font-size:15px;
}
.login-part a{
	width:90px;
}
.title-name{
	background-color:#0891bf;
	width:100%;
	height:140px;
	text-align:center
}
.title-name a{
	font-family: 'Bungee Shade', cursive;
	font-size:70px;
	vertical-align:top;
	display: block;
	hight:50px; 
}
</style>
</head>
<body>
<div class="page-title">
	<div>
	<span style="font-size:30px;color:white;cursor:pointer" onclick="openNav()">&#9776;</span>
		<div class="login-part">
		<c:if test="${!empty user_num && user_auth == 2}">
			<a href="${pageContext.request.contextPath}/cart/cart.do">Cart</a>
		</c:if>
		<c:if test="${!empty user_num && user_auth == 2}">
			<a href="${pageContext.request.contextPath}/mymember/myPage.do">My Page</a>
		</c:if>
		
		<c:if test="${!empty user_num && !empty user_photo}" >
			<img src="${pageContext.request.contextPath}/upload/${user_photo}" width="25" height="25" class="my-photo">
		</c:if>
		<c:if test="${!empty user_num && empty user_photo}" >
			<img src="${pageContext.request.contextPath}/images/face.png" width="25" height="25" class="my-photo">
		</c:if>
		<c:if test="${!empty user_num}">
				[<span>${user_id}</span>]
				<a href="${pageContext.request.contextPath}/member/logout.do">Logout</a>
		</c:if>
		<c:if test="${empty user_num}">
			<a href="${pageContext.request.contextPath}/member/registerUserForm.do">Sign in</a>
			&nbsp;
			<a href="${pageContext.request.contextPath}/member/loginForm.do">Login</a>
		</c:if>
		</div>
	
	</div>
	<div class="title-name">
		<a href="${pageContext.request.contextPath}/main/main.do">QICKBOARD</a>
	</div>
</div>
<div id="myNav" class="overlay">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <div class="overlay-content">
    <a href="${pageContext.request.contextPath}/main/intro.do">카페소개</a>
    <a href="${pageContext.request.contextPath}/game/gameList.do">게임소개</a>
    <a href="${pageContext.request.contextPath}/reserve/reserveMain.do">예약</a>
    <a href="${pageContext.request.contextPath}/notice/noticeList.do">공지</a>
    <a href="${pageContext.request.contextPath}/inquiry/inquiryList.do">문의</a>
  </div>
</div>
<script>
function openNav() {
  document.getElementById("myNav").style.width = "30%";
}
function closeNav() {
  document.getElementById("myNav").style.width = "0%";
}
</script>
     
</body>
</html>