<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
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
		<h3>회원목록</h3>
		<c:if test="${count == 0}">
	   		<div>
	    	  등록된 회원이 없습니다.
	   		</div>
   		</c:if>
  		<c:if test="${count > 0}">
  			전체 회원수 : ${count}
  			<table>
			<tr>
				<th>번호</th>
				<th>회원 아이디</th>
				<th>회원 이름</th>
				<th>회원 등급</th>
				<th>가입일</th>
			</tr>
			<c:forEach var="member" items="${list}">
			<tr>
				<td>${member.rownum}</td>
				<td><a href="memdetail.do?mem_num=${member.mem_num}">${member.mem_id}</a></td>
				<td>${member.mem_name}</td>
				<td>${member.mem_auth}</td>
				<td>${member.mem_reg}</td>
			</tr>
			</c:forEach>
		</table>
		   <div>
		      ${pagingHtml}
		   </div>
   		</c:if>
	</div>
</body>
</html>