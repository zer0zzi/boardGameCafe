<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방 정보</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_hoon.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.1.4/js/bootstrap-datetimepicker.min.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.1.4/css/bootstrap-datetimepicker.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.number.min.js"></script>
<script type="text/javascript">
$(function(){ //이거 쓸거면 위에 jquery링크 걸어야함 꼭
	$('#room_size').submit(function(){
		if($('#room_size')> 4){ //공백을 인정하지 않기 때문에 trim 안씀
			alert('4인을 초과했습니다.');
			return false;
		}
	}
}
</script>


</head>
<body>
<div class="container" id="container">
	<div class="wrap_inn">
		<div class="wrap_left">
			<h3 class="align-center">${room.room_name}</h3>
			<div class="room-image">
				<img src="${pageContext.request.contextPath}/upload/${room.photo1}" width="400">
			</div>
			<div class="room-detail">
				<form id="room_reserve" method="post">
					<input type="hidden" name="room_num" value="${room.room_num}" id="room_num">
					<input type="hidden" name="room_detail" value="${room.room_detail}" id="room_detail">
					<ul class="dsccc">
						<li>참고 : <b><${room.room_detail}></b></li>
					</ul>
				</form>
			</div>
			<div class="top_line">
							<div class="item_details">
								<p class="dscc">
								4-8인실 스터디룸
								<br>
								(4인 이상 이용, 1~3명이어도 4인 비용지불 시 이용 가능)
								<br>
								-룸형태는 상이하며 교실 임의배정됩니다.
								<br>
								-내부에 카페가 있어 외부 음료는 반입이 금지되어있습니다.
								<br>
								-룸내 음식물 섭취 불가합니다(물,내부카페음료만 가능)
								<br>
								-내부에선 반드시 마스크를 착용해주셔야 합니다.
								<br>
								<br>
								전날 6시 이후 취소 및 변경과 노쇼의 경우, 위약금 12,000원이 부과되니 전날 6시까지 연락주시기 바랍니다.
								<br>
								(장시간 이용 또는 룸 여러개 사용으로 보증금을 받고 있습니다. 신청당일 18시 이전까지 보증금 확인되지 않으면
								예약이 취소됩니다. 납부하신 보증금은 3일전 저녁18시까지만 취소 및 환불이 가능하며 이후 취소시 보내주신 보증금으로 위약금 처리하여 환불되지 않습니다.)
								<br>
								<br>
								
								</p>
								<div class="panel_ineer">
								</div>
							</div><!-- end of item_details -->
						</div><!-- end of top_line -->
		</div>
		<div class="wrap_right">
			<div class="section_booking">
				<p class="in_info btm">
					<em class="in_info_tit">
						<i class="spr_book ico_i_red2"></i>
						<span>※ 알립니다</span>
					</em>
					<span class="in_info_dsc">
					[예약안내]
					<br>
					교실은 예약상황에 따라 임의배정됩니다.
					<br>
					시간추가를 원하시는 경우에는 반드시 카운터에 문의바랍니다.
					<br>
					1시간 단위로 연장이 가능합니다.
					<br>
					요금은 예약된 시간을 기준으로 정산됩니다.
					<br>
					<br>
					[교실이용안내]
					<br>
					다음 이용자들을 위해 깨끗하게 사용하시고, 5분 전 미리 퇴실바랍니다.
					<br>
					외부음료 및 외부음식 반입금지되어있습니다.
					<br>
					룸내 음식물 섭취 불가합니다.(물 및 내부 카페음료는 가능합니다.)
					<br> 
					교실 및 건물내 흡연 및 음주는 금지되어 있습니다.
					<br>
					<br>
					[취소/변경 안내]
					<br>
					시간 및 인원 변동이 있을 시 가능한 한 빠른 시일 내에 부탁드립니다.
					</span>
				</p>
				
						
			</div><!-- end of section_booking -->
		<input type="button" value="예약하기" onclick="location.href='${pageContext.request.contextPath}/reserve/reserveForm.do'">
		
		<div class="wrap">
				<a href="#pop_info_1" class="btn_open">예약하기</a>
					<div id="pop_info_1" class="pop_wrap" style="display:none;">
						<div class="pop_inner">
						<div class="page-main">
						<div class="content-main">
							<h2>예약하기</h2>
							<form action="reserve.do" method="post">
								<input type="hidden" name="mem_num" id="mem_num" value="${detail.mem_num}">
								<ul>
									<li>
										<label>예약자 이름</label>
										<input type="text" name="name" id="name" maxlength="50" value="${detail.mem_name}" readonly>
									</li>
									<li>
										<label>예약날짜</label>
										<input type="text" name="res_date" id="res_date" maxlength="10">
										<span>입력 예)23/01/13</span>
									</li>
									<li>
										<label>예약시간</label>
										<input type="text" name="res_time" id="res_time" maxlength="10">
										<span>입력 예)2-3</span>
									</li>
									<li>
										<label>인원수</label>
										<input type="number" name="res_count" id="res_count" min="1" max="30">
									</li>
									<li>
										<label>방 번호</label>
										<input type="text" name="room" id="room" value="${room.room_num}" readonly>
									</li>
								</ul>
								<input type="submit" id="reserve" value="예약완료"/>
							</form>
						</div>
					</div>
	 				<button type="button" class="btn_close">닫기</button>
						</div><!-- end of inner -->
					</div>
		</div>
		<script>
							var target = document.querySelectorAll('.btn_open');
							var btnPopClose = document.querySelectorAll('.pop_wrap .btn_close');
							var targetID;
						
						  // 팝업 열기
						  for(var i = 0; i < target.length; i++){
						    target[i].addEventListener('click', function(){
						      targetID = this.getAttribute('href');
						      document.querySelector(targetID).style.display = 'block';
						    });
						  }
						  
						  // 팝업 닫기
						  for(var j = 0; j < target.length; j++){
						    btnPopClose[j].addEventListener('click', function(){
						      this.parentNode.parentNode.style.display = 'none';
						    });
						  }
						</script>
						
		</div><!-- end of wrap_right -->
	</div><!-- end of wrap_inn -->
</div><!-- end of container -->
</body>
</html>