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
					<ul>
						<li>참고 : <b><${room.room_detail}></b></li>
					</ul>
				</form>
			</div>
		</div>
		<div class="wrap_right">
			<div class="section_booking">
				<table id="calendar" align="center" class="calendar">
					<tbody class="tb_body">
					<tr class="calendar_title">
						<td align="center"><label onclick="prevCalendar()"> ◀ </label></td>
						<td colspan="5" align="center" id="calendarTitle">yyyy년 m월</td>
						<td align="center"><label onclick="nextCalendar()"> ▶ </label></td>
					</tr>
					<tr>
						<td align="center"><font color ="red">일</td>
						<td align="center">월</td>
						<td align="center">화</td>
						<td align="center">수</td>
						<td align="center">목</td>
						<td align="center">금</td>
						<td align="center"><font color ="blue">토</td>
					</tr>
					<script type="text/javascript">buildCalendar();</script>
					</tbody>
				</table>
				
						
			</div><!-- end of section_booking -->
		<input type="button" value="예약하기" onclick="location.href='${pageContext.request.contextPath}/reserve/reserve.do'">
		</div><!-- end of wrap_right -->
	</div><!-- end of wrap_inn -->
</div><!-- end of container -->
</body>
</html>