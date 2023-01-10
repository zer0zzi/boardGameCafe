<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임상세</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

</script>

</head>
<body>
<h1>게임상세</h1>
<div class="page-main">
	<div class="image-detail">
		<%-- <img src="${detail.picture}}"> --%>
	</div>
	<div class="small-header">
		<b class="game-name">${detail.pro_name}</b>
		<span>${detail.pro_price}</span>
		<input type="button" value="구매하기">
		<input type="button" value="장바구니">
		<hr size="1" noshade="noshade" width="250px">
	</div>
	<div class="game-explanation">
		게임 설명 : ${detail.explanation} 
		<hr size="1" noshade="noshade" width="250px">
	</div>
	<div class="small-footer">
	<span>난이도 : ${detail.pro_level}</span>
	<span>게임 인원 : ${detail.pro_count}</span>
	</div>
	<br>
	<br>
	<!-- 평가 및 리뷰 시작 -->
	<div id="review_div">
		<span class="re-title">리뷰 쓰기</span>
		<form id="re_form">
			<input type="hidden" name="pro_num" value="${detail.pro_num}" id="pro_num">
			<textarea rows="3" cols="50" name="re_content" id="re_content" class="rev-content"
			<c:if test="${empty  mem_num}">disabled="disabled"</c:if>
			><c:if test="${empty mem_num}">로그인 후 리뷰를 남겨주세요!.</c:if></textarea>
			<c:if test="${!empty mem_num}">
			<div id="re_first">
				<span class="letter-count">500/500</span>
			</div>
			<div id="re_second" class="align-right">
				<input type="submit" value="전송">
			</div>
			</c:if>
		</form>
	</div>
	<!-- 리뷰 목록 출력 시작 -->
	<div id="output"></div>
		<div class="paging-button" style="display:none;">
			<input type="button" value="다음글 보기">
		</div>
	<!-- 리뷰 목록 출력 끝 -->
	<!-- 평가 및 리뷰 끝 -->
         
         
         
         
         
         
         
         <ul>
         	<li>${detail.pro_num}</li>
         	<li>${detail.pro_name}</li>
         </ul>
</div>
</body>
</html>