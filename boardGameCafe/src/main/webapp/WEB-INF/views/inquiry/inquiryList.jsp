<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>문의사항</title>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_hyem.css"> --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="page-main">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<h2>문의사항</h2>
	<c:if test="${!empty user_num && user_auth == 2}">
		<div class="align-right">
			<input type="button" value="글쓰기" onclick="location.href='inquiryWriteForm.do'">
		</div>
	</c:if>
	
	<c:if test="${count == 0}">
		<div class="result-display">
			등록된 문의가 없습니다.
		</div>
	</c:if>
	
	<c:if test="${count > 0}">	
		<table>
			<tr>
				<th>글 번호</th>
				<th></th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="inquiry" items="${list}">
				<tr>
					<c:if test="${inquiry.inqu_rpl == 0}"><td>${inquiry.inqu_num}</td></c:if>
					<c:if test="${inquiry.inqu_rpl != 0}"><td></td></c:if>
					<c:if test="${inquiry.inqu_rpl == 0}"><td>${inquiry.inqu_cate}</td></c:if>
					<c:if test="${inquiry.inqu_rpl != 0}"><td></td></c:if>
					<td>
						<c:if test="${inquiry.inqu_rpl == 0}">
							<a href="inquiryDetail.do?inqu_num=${inquiry.inqu_num}">
								${inquiry.inqu_title}
								<c:if test="${inquiry.inqu_check == 1}">
									<img src="${pageContext.request.contextPath}/images/hyem/lock.png" width="10">
								</c:if>
							</a>
						</c:if>
						<c:if test="${inquiry.inqu_rpl != 0}">
							<a href="inquiryReplyDetail.do?inqu_num=${inquiry.inqu_num}">
								<img src="${pageContext.request.contextPath}/images/hyem/reply.png" width="10">
								<i>RE : </i>${inquiry.inqu_title}
								<c:if test="${inquiry.inqu_check == 1}">
									<img src="${pageContext.request.contextPath}/images/hyem/lock.png" width="10">
								</c:if>
							</a>
						</c:if>
					</td>
					<c:if test="${inquiry.inqu_rpl == 0}"><td>${inquiry.inqu_reg_date}</td></c:if>
					<c:if test="${inquiry.inqu_rpl != 0}"><td></td></c:if>
					<c:if test="${inquiry.inqu_rpl == 0}"><td>${inquiry.inqu_hit}</td></c:if>
					<c:if test="${inquiry.inqu_rpl != 0}"><td></td></c:if>
				</tr>
			</c:forEach>
		</table>
		<div class="align-center">
			${pagingHtml}
		</div>
	</c:if>
</div>
</body>
</html>