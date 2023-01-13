<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약목록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_0g.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$('.main_ul').click(function(){
		if($(this).find(".hide").is(":visible")){
			$(this).find(".hide").css("display","none");
        }
        else{
        	$(this).find(".hide").css("display","block");
        }
	});
});
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
		<h3>예약목록</h3>
		<c:if test="${count == 0}">
	   		<div>
	    	  등록된 예약이 없습니다.
	   		</div>
   		</c:if>
  		<c:if test="${count > 0}">
  			전체 예약수 : ${count}
  			<c:forEach var="reserve" items="${list}">
	   			<ul class="main_ul">
	   				<li>No. ${reserve.res_num}</li>
	   				<li>ROOM. ${reserve.room_name}</li>
					<li class="hide">예약일정 ${reserve.res_date} ${reserve.res_time}</li>
					<li class="hide">예약자 ${reserve.mem_name}</li>
					<li class="hide">예약인원 ${reserve.res_count} 명</li>
					<li class="hide">예약된 방 ${reserve.room_name} ${reserve.room_detail}</li>
   				</ul>
   			</c:forEach>
		   <div>
		      ${pagingHtml}
		   </div>
   		</c:if>
	</div>
</body>
</html>