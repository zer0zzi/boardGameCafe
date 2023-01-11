<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>문의 글쓰기</title>
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
		<h2>문의 글쓰기</h2>
		<form action="inquiryWrite.do" method="post" id="write_form" enctype="multipart/form-data">
			<ul>
				<li>
					<label for="inqu_cate">카테고리</label>
					<select name="inqu_cate">
						<option value="1">예약문의</option>
						<option value="2">상품문의</option>
						<option value="3">주문/배송문의</option>
						<option value="4">기타문의</option>
					</select>
				</li>
				<li>
					<label for="inqu_title">제목</label>
					<input type="text" name="inqu_title" id="inqu_title" maxlength="50">
				</li>
				<li>
					<label for="inqu_check">비밀글</label>
					<input type="checkbox" name="inqu_checkbox" id="inqu_checkbox">
					<input type="hidden" name="inqu_check" id="inqu_check">
				</li>
				<li>
					<label for="inqu_content">내용</label>
					<textarea rows="5" cols="30" name="inqu_content" id="inqu_content"></textarea>
				</li>
				<li>
					<label for="inqu_file">파일</label>
					<input type="file" name="inqu_file" id="inqu_file" accept="image/gif, image/png, image/jpeg">
				</li>
			</ul>
			<div class="align-center">
				<input type="submit" value="등록">
				<input type="button" value="목록" onclick="location.href='inquiryList.do'">
			</div>
		</form>
	</div>
</div>
</body>
</html>