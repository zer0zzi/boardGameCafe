<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매목록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_ddk.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="page-main">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<h1>내가 작성한 문의</h1>
	<c:if test="${count == 0}">
		<div class="result-display-x">
			구매내역 없음.
		</div>
	</c:if>
	<c:if test="${count > 0}">
	<table class="tablestyle">
		<tr>
			<th class="ordertable-1">배송상태</th>
			<th>구매목록</th>
			<th>총가격</th>
			<th class="ordertable-4">구매날짜</th>
			<th>수정 및 취소</th>
		</tr>
		<c:forEach var="myorder" items="${list}">
		<tr>
			<td>${myorder.status}</td>
			<td><a href="${pageContext.request.contextPath}/order/orderDetail.do?order_main_num=${myorder.order_main_num}">${myorder.order_main_name}</a></td>
			<td>${myorder.order_main_total}</td>
			<td>${myorder.order_main_date}</td>
			<td><a href="${pageContext.request.contextPath}/order/orderModifyForm.do?order_main_num=${myorder.order_main_num}"><img src="${pageContext.request.contextPath}/images/soon/modify.png" width="10%"></a></td>
		</tr>
		</c:forEach>
	</table>
	<div class="pageup"></div>
	<div class="align-center">${page}</div>
	<div class="pagebottom"></div>
	</c:if>
	</div>
</body>
</html>