<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임상세</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/game.review.js"></script>
<script type="text/javascript">

</script>

</head>
<body>
<div class="page-main">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<h1>게임상세</h1>
	<div class="image-detail">
		<img src="${pageContext.request.contextPath}/images/seul/${detail.pro_picture}">
	</div>
	<div class="small-header">
		<b class="game-name">${detail.pro_name}</b>
		<span>${detail.pro_price}</span>
		<!-- <input type="button" value="구매하기"> -->
		<input type="button" value="장바구니" onclick="${pageContext.request.contextPath}/cart/cart.do'">
		<hr size="1" noshade="noshade" width="250px">
	</div>
	<div class="game-explanation">
		게임 설명 : ${detail.explanation} 
		<hr size="1" noshade="noshade" width="250px">
	</div>
	<div class="small-footer">
	<span>난이도 : ${detail.pro_level}</span>
	<span>게임 인원 : ${detail.person}</span>
	</div>
	<br>
	<br>
	<!-- 평가 및 리뷰 시작 -->
	<div id="review_div">
		<span class="re-title">리뷰 쓰기</span>
		<form id="re_form">
			<input type="hidden" name="pro_num" value="${detail.pro_num}" id="pro_num">
			<textarea rows="3" cols="50" name="rev_content" id="rev_content" class="rev1-content"
			<c:if test="${empty  user_num}">disabled="disabled"</c:if>
			><c:if test="${empty user_num}">로그인 후 리뷰를 남겨주세요!.</c:if></textarea>
			<c:if test="${!empty user_num}">
			<div id="re_first">
				<span class="letter-count">500/500</span>
			</div>
			<div id="re_second" class="align-right">
				<input type="submit" value="전송">    <!-- 전송하면 어디로 담기는지...? -->
			</div>
			</c:if>
		</form>
	</div>
	<!-- 리뷰 목록 출력 시작 -->
	<div id="output"></div>
		<div class="paging-button" style="display:none;">
			<input type="button" value="다음글 보기">
		</div>
		<div id="loading" style="display:none;">
			<img src="${pageContext.request.contextPath}/images/loading.gif" width="50" height="50">
		</div>
	<!-- 리뷰 목록 출력 끝 -->
	<!-- 평가 및 리뷰 끝 -->
</div>
</body>
</html>