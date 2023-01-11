<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>문의 글 수정</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_hyem.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#write_form').submit(function(){
			if($('#inqu_title').val().trim() == ''){
				alert('제목을 입력하세요');
				$('#inqu_title').val('').focus();
				
				return false;
			}
			
			if($('#inqu_content').val().trim() == ''){
				alert('내용을 입력하세요');
				$('#inqu_content').val('').focus();
				
				return false;
			}
			
			var check = $('#inqu_checkbox').prop('checked')? 1 : 0;
			$('#inqu_check').val(check);
		});
	});
</script>
</head>
<body>
<div class="page-main">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="content-main">
		<h2>문의 글 수정</h2>
		<form action="inquiryUpdate.do" method="post" id="write_form" enctype="multipart/form-data">
			<input type="hidden" name="inqu_num" value="${inquiry.inqu_num}">
			<ul>
				<li>
					<label for="inqu_cate">카테고리</label>
					<select name="inqu_cate">
						<option value="1" <c:if test="${inquiry.inqu_cate eq '예약문의'}">selected</c:if>>예약문의</option>
						<option value="2" <c:if test="${inquiry.inqu_cate eq '상품문의'}">selected</c:if>>상품문의</option>
						<option value="3" <c:if test="${inquiry.inqu_cate eq '주문/배송문의'}">selected</c:if>>주문/배송문의</option>
						<option value="4" <c:if test="${inquiry.inqu_cate eq '기타문의'}">selected</c:if>>기타문의</option>
					</select>
				</li>
				<li>
					<label for="inqu_title">제목</label>
					<input type="text" name="inqu_title" id="inqu_title" value="${inquiry.inqu_title}" maxlength="50">
				</li>
				<li>
					<label for="inqu_check">비밀글</label>
					<c:if test="${inquiry.inqu_check == 1}">
						<input type="checkbox" name="inqu_checkbox" id="inqu_checkbox" checked>
						<input type="hidden" name="inqu_check" id="inqu_check">
					</c:if>
					<c:if test="${inquiry.inqu_check == 0}">
						<input type="checkbox" name="inqu_checkbox" id="inqu_checkbox">
						<input type="hidden" name="inqu_check" id="inqu_check">
					</c:if>
				</li>
				<li>
					<label for="inqu_content">내용</label>
					<textarea rows="5" cols="30" name="inqu_content" id="inqu_content">${inquiry.inqu_content}</textarea>
				</li>
				<li>
					<label for="inqu_file">파일</label>
					<input type="file" name="inqu_file" id="inqu_file" accept="image/gif, image/png, image/jpeg">
					<c:if test="${!empty inquiry.inqu_file}">
						<div id="file_detail">
							(${inquiry.inqu_file})파일이 등록되어 있습니다.
							<input type="button" value="파일삭제" id="file_del">
						</div>	
						<script type="text/javascript">
							$(function(){
								$('#file_del').click(function(){
									let choice = confirm('삭제하시겠습니까?');
									if(choice){
										$.ajax({
											url:'deleteInquiryFile.do',
											type:'post',
											data:{noti_num:${inquiry.inqu_num}},
											dataType:'json',
											success:function(param){
												if(param.result == 'logout'){
													alert('로그인 후 사용하세요!');
												}else if(param.result == 'success'){
													$('#file_detail').hide();
												}else if(param.result == 'wrongAccess'){
													alert('잘못된 접속입니다.');
												}else{
													alert('파일 삭제 오류 발생');
												}
											},
											error:function(){
												alert('네트워크 오류 발생');
											}
										});
									}
								});
							});
						</script>
					</c:if>
				</li>
			</ul>
			<div class="align-center">
				<input type="submit" value="수정">
				<input type="button" value="글 상세" onclick="location.href='inquiryDetail.do?inqu_num=${inquiry.inqu_num}'">
			</div>
		</form>
	</div>
</div>
</body>
</html>