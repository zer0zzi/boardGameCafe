<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="page-main">
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div class="content-main">
			<h2>예약하기</h2>
			<form action="reserve.do">
				<input type="hidden" name="mem_num" id="mem_num" value="${detail.mem_num}">
				<ul>
					<li>
						<label>예약자 이름</label>
						<input type="text" name="name" id="name" maxlength="10" value="${detail.mem_name}" readonly>
					</li>
					<!-- <li>
				         date: 날짜 필드
				         <label for="start_date">시작 날짜</label>
				         <input type="date" name="start_date" id="start_date" value="">
				    </li> -->
					<li>
						<label>예약날짜</label>
						<input type="text" name="res_date" id="reg_date" maxlength="10">
					</li>
					<li>
						<label>예약시간</label>
						<input type="text" name="res_time" id="reg_time" maxlength="10">
					</li>
					<li>
						<label>인원수</label>
						<input type="number" name="res_count" id="res_count" min="1" max="30">
					</li>
					<li>
						<label>방 번호</label>
						<input type="text" name="room_num" id="room_num" value="${detail.room_num}">
					</li>
				</ul>
				<input type="submit" id="submit_reserve" value="예약"/>
			</form>
		</div>
	</div>
</body>
</html>