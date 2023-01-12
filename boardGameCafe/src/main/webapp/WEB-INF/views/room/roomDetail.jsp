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
var today = new Date();
function buildCalendar(){
  var row = null
  var cnt = 0;
  var calendarTable = document.getElementById("calendar");
  var calendarTableTitle = document.getElementById("calendarTitle");
  calendarTableTitle.innerHTML = today.getFullYear()+"년"+(today.getMonth()+1)+"월";
  
  var firstDate = new Date(today.getFullYear(), today.getMonth(), 1);
  var lastDate = new Date(today.getFullYear(), today.getMonth()+1, 0);
  
  while(calendarTable.rows.length > 2){
  	calendarTable.deleteRow(calendarTable.rows.length -1);
  }

  row = calendarTable.insertRow();
  for(i = 0; i < firstDate.getDay(); i++){
  	cell = row.insertCell();
  	cnt += 1;
  }


  for(i = 1; i <= lastDate.getDate(); i++){
  	cell = row.insertCell();
  	cnt += 1;

    cell.setAttribute('id', i);
  	cell.innerHTML = i;
  	cell.align = "center";

    cell.onclick = function(){
    	clickedYear = today.getFullYear();
    	clickedMonth = ( 1 + today.getMonth() );
    	clickedDate = this.getAttribute('id');

    	clickedDate = clickedDate >= 10 ? clickedDate : '0' + clickedDate;
    	clickedMonth = clickedMonth >= 10 ? clickedMonth : '0' + clickedMonth;
    	clickedYMD = clickedYear + "-" + clickedMonth + "-" + clickedDate;

    	opener.document.getElementById("date").value = clickedYMD;
    	self.close();
    }

    if (cnt % 7 == 1) {
    	cell.innerHTML = "<font color=red>" + i + "</font>";
    }

    if (cnt % 7 == 0){
    	cell.innerHTML = "<font color=blue>" + i + "</font>";
    	row = calendar.insertRow();
    }
  }
  
  if(cnt % 7 != 0){
  	for(i = 0; i < 7 - (cnt % 7); i++){
  		cell = row.insertCell();
  	}
  }
}

function prevCalendar(){
	today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
	buildCalendar();
}

function nextCalendar(){
	today = new Date(today.getFullYear(), today.getMonth()+1, today.getDate());
	buildCalendar();
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
		
	 				
		</div><!-- end of wrap_right -->
	</div><!-- end of wrap_inn -->
</div><!-- end of container -->
</body>
</html>