<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 글 상세</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_hyem.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(function(){
		let modal = document.getElementById("modal");
		
		let delete_btn = document.getElementById("delete_btn");
		delete_btn.addEventListener("click", e => {
		    modal.style.display = "flex";
		});
		
		let del = document.getElementById("delete");
		let inqu_num = document.getElementById("inqu_num").value;
		del.addEventListener("click", e => {
			location.href="inquiryDelete.do?inqu_num=" + inqu_num;
		});
		
		let cancel = document.getElementById("cancel");
		cancel.addEventListener("click", e => {
		    modal.style.display = "none";
		});
	});
</script>
</head>
<body>
<c:if test="${inquiry.inqu_check == 1}">
	<c:if test="${inquiry.mem_num != user_num && user_auth != 9}">
		<script>
			alert('비밀글입니다');
			location.href = 'inquiryList.do';
		</script>
	</c:if>
	<c:if test="${inquiry.mem_num == user_num || user_auth == 9}">
		<div class="page-main">
			<jsp:include page="/WEB-INF/views/common/header.jsp"/>
			<div class="content-main">
				<h5>${inquiry.inqu_cate}</h5>
				<h2>${inquiry.inqu_title}</h2>
				<h4>조회 : ${inquiry.inqu_hit}</h4>
				<hr size="1" noshade="noshade" width="100%">
				<c:if test="${!empty inquiry.inqu_file}">
					<div class="align-center">
						<img src="${pageContext.request.contextPath}/upload/${inquiry.inqu_file}" class="detail-img">
					</div>
				</c:if>
				<p>
					${inquiry.inqu_content}
				</p>
				<hr size="1" noshade="noshade" width="100%">
			</div>
			<div class="align-right">
				<c:if test="${inquiry.mem_num == user_num}">
					<input type="button" value="수정" onclick="location.href='inquiryUpdateForm.do?inqu_num=${inquiry.inqu_num}'">
					<input type="button" value="삭제" id="delete_btn">
					<div id="modal" class="modal-overlay">
						<div class="modal-window">
							<div class="modal-content">
								<p>삭제하시겠습니까?</p>
					            <input type="hidden" id="inqu_num" value="${inquiry.inqu_num}">
					            <div class="confirm-btn">
					                <input type="button" value="확인" id="delete">
					                <input type="button" value="취소" id="cancel">
					            </div>
					        </div>
					    </div>
					</div>
				</c:if>
				<c:if test="${user_auth == 9}">
					<input type="button" value="답글" onclick="location.href='inquiryReplyForm.do?inqu_num=${inquiry.inqu_num}'">
				</c:if>
				<input type="button" value="목록" onclick="location.href='inquiryList.do'">
			</div>
		</div>
	</c:if>
</c:if>
<c:if test="${inquiry.inqu_check == 0}">
	<div class="page-main">
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div class="content-main">
			<h5>${inquiry.inqu_cate}</h5>
			<h2>${inquiry.inqu_title}</h2>
			<h4>조회 : ${inquiry.inqu_hit}</h4>
			<hr size="1" noshade="noshade" width="100%">
			<c:if test="${!empty inquiry.inqu_file}">
				<div class="align-center">
					<img src="${pageContext.request.contextPath}/upload/${inquiry.inqu_file}" class="detail-img">
				</div>
			</c:if>
			<p>
				${inquiry.inqu_content}
			</p>
			<hr size="1" noshade="noshade" width="100%">
		</div>
		<div class="align-right">
			<c:if test="${inquiry.mem_num == user_num}">
				<input type="button" value="수정" onclick="location.href='inquiryUpdateForm.do?inqu_num=${inquiry.inqu_num}'">
				<input type="button" value="삭제" id="delete_btn">
				<div id="modal" class="modal-overlay">
					<div class="modal-window">
						<div class="modal-content">
							<p>삭제하시겠습니까?</p>
				            <input type="hidden" id="inqu_num" value="${inquiry.inqu_num}">
				            <div class="confirm-btn">
				                <input type="button" value="확인" id="delete">
				                <input type="button" value="취소" id="cancel">
				            </div>
				        </div>
				    </div>
				</div>
			</c:if>
			<c:if test="${user_auth == 9}">
				<input type="button" value="답글" onclick="location.href='inquiryReplyForm.do?inqu_num=${inquiry.inqu_num}'">
			</c:if>
			<input type="button" value="목록" onclick="location.href='inquiryList.do'">
		</div>
	</div>
</c:if>
</body>
</html>