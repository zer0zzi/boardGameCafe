<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_ahn.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/cart.js"></script>
<script type="text/javascript">
	$(function() {
		//장바구니 상품 삭제
		$('.cart-del').on('click', function() {
			$.ajax({
				url:'deleteCart.do',
				type:'post',
				data:{cart_num:$(this).attr('data-cartnum')},
				dataType:'json',
				success:function(param){
					if(param.result == 'logout'){
						alert('로그인 후 사용하세요!');
					}else if(param.result == 'success'){
						alert('선택하신 상품을 삭제했습니다.');
						location.href='cart.do';
					}else{
						alert('장바구니 상품 삭제 오류!');
					}
				},
				error:function(){
					alert('네트워크 오류 발생!');
				}
			});
		});//end of click - 장바구니 삭제
	
	});
</script>
</head>
<body>
<div class="page-main">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="content-photo">
		<c:if test="${empty cart}">
		<div class="result-display">
			장바구니에 담은 상품이 없습니다.
		</div>
		</c:if>
		<c:if test="${!empty cart}">
			<h2><span class="result-display">${mem_id}</span>님의 장바구니</h2>

		<div class="result">
			<form id="cart_order" method="post"
			action="${pageContext.request.contextPath}/order/orderForm.do">
				<div class="cart-main">
				<table>
					<c:forEach var="cart" items="${cart}">
					<tr>
						<td width="160">
							<a href="${pageContext.request.contextPath}/list/detail.do?pro_num=${cart.pro_num}">
								<img src="${pageContext.request.contextPath}/upload/${cart.listVo.pro_picture}" width="80">
								${cart.listVo.pro_name}
							</a>
						</td>
						<td class="align-center">
							${cart.listVo.pro_name}
							<br><hr width="100">
							<fmt:formatNumber value="${cart.listVo.pro_price}"/>원
						</td>
						<td class="align-center">
							<c:if test="${cart.listVo.pro_status==1 or cart.listVo.pro_count < cart.cart_count}">[판매중지]</c:if>
							<c:if test="${cart.listVo.pro_status!=1 and cart.listVo.pro_count > cart.cart_count}">
							<input type="number" name="cart_count" min="1" max="${cart.listVo.pro_count}" 
									value="${cart.cart_count }" class="count_width"style=" width:40px;">
							<br>
							<input type="button" value="변경" class="cart-modify"
											data-cartnum="${cart.cart_num}" 
											data-pronum="${cart.pro_num}">
							</c:if>
						</td>
						<td class="align-center">
							<fmt:formatNumber value="${cart.sub_total}"/>원
							<input type="button" value="삭제" class="cart-del"
												data-cartnum="${cart.cart_num}">
						</td>
					</tr>	
					</c:forEach>
				</table>
				</div><!--end of cart main-->
			<div class="cart-side">
				<div class="cart-sub">
					<table>
					<c:forEach var="cart" items="${cart}">
					<tr>
						<td>
							${cart.listVo.pro_name}x${cart.cart_count}=${cart.sub_total}원
						</td>
					</tr>	
					</c:forEach>
					</table>
				</div><!--end of cart sub-->
				<div>
					<div class="price-total align-center"><b>총구매금액:</b>
					<fmt:formatNumber value="${all_total}"/>원
					</div>				
					<input type="submit" value="구매하기">
				</div><!--end of price total-->
			</div><!--end of cart side-->
			</form>
			</div>
		</c:if>
	</div><!--end of content main-->
</div><!--end of page main-->
</body>
</html>