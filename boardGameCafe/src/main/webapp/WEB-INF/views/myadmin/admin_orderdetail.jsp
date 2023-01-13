<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세정보</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_0g.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="main-title">
		마이페이지
	</div>
	<div class="main-content">
		<button id="btn01" value="주문조회" onclick="location.href='orderList.do'">주문조회</button>
		<button id="btn01" value="예약조회" onclick="location.href='resList.do'">예약조회</button>
		<button id="btn01" value="회원정보" onclick="location.href='memList.do'">회원정보</button>
	</div>
	<div>
		<h3>주문내역</h3>
		<table>
			<tr>
				<th>상품명</th>
				<th>수량</th>
				<th>상품가격</th>
				<th>합계</th>
			</tr>
			<c:forEach var="detail" items="${list}">
				<tr>
					<td>${detail.pro_name}</td>
					<td>
						<fmt:formatNumber value="${detail.order_main_count}"/>
					</td>
					<td>
						<fmt:formatNumber value="${detail.pro_price}"/>원
					</td>
					<td>
						<fmt:formatNumber value="${detail.pro_total}"/>원
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="3" class="align-right">
					<b>총 구매금액</b>
				</td>
				<td class="align-center">
					<fmt:formatNumber value="${order.order_main_total}"/>원
				</td>
			</tr>
		</table>
		<div>
			<input type="button" value="취소" onclick="window.location.reload()">
			<input type="button" value="목록으로" onclick="location.href='orderList.do'">
		</div>
	</div>
</body>

</body>
</html>