<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임 소개</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_seul.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
   $('#search_form').submit(function(){
      if($('#keyword').val().trim()==''){
         goReload();
         $('#keyword').val('').focus();
         return false;
      }
   });
});
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="page-main">
   <div class="search1">
      <!-- 검색 폼 시작 -->
      <form id="search_form" action="gameList.do" method="get">
            <ul class="search">
               <li>
                  <select name="keyfield">
                     <option value="1" <c:if test="${param.keyfield==1}">selected</c:if>>제목</option>
                     <option value="2" <c:if test="${param.keyfield==2}">selected</c:if>>난이도</option>
                     <option value="3" <c:if test="${param.keyfield==3}">selected</c:if>>추천 인원수</option>
                  </select>
               </li>
               <li>
                  <input type="search" size="20" name="keyword" id="keyword" value="${param.keyword}">
               </li>
               <li>
                  <input type="submit" value="검색">
               </li>
            </ul>
      </form>
   </div>
      <!-- 검색 폼 끝 -->
      <!-- 관리자 -> 게임관리 버튼 시작 -->
      <c:if test="${!empty user_num && user_auth == 9}">
            <input type="button" class="adminbtn" value="게임등록" onclick="location.href='gameWriteForm.do'">
            <%-- <a href="${pageContext.request.contextPath}/game/gameWriteForm.do">게임등록</a> --%>
      </c:if>
      <!-- 관리자 -> 게임관리 버튼 끝 -->
       <!-- 보드 게임 시작 -->
      <div class="image-space">
         <c:forEach var="list" items="${list}">
         <div class="horizontal-area">
              <a href="${pageContext.request.contextPath}/game/gameDetail.do?pro_num=${list.pro_num}"> 
                  <img src="${pageContext.request.contextPath}/upload/${list.pro_picture}">
                  <span id="gname">${list.pro_name}</span>
                  <br>
                  <span>추천 인원 : ${list.person}</span>
                  <br>
                  <b><fmt:formatNumber value="${list.pro_price}"/>원</b>
                  <!-- 관리자가 로그인하면 삭제 가능 -->
                     <c:if test="${!empty user_num && user_auth == 9}">
                     <input type="button" value="삭제" id="delete_btn">
                     <script type="text/javascript">
                        let delete_btn = document.getElementById('delete_btn');
                        //이벤트 연결
                        delete_btn.onclick=function(){
                           let choice = confirm('삭제하시겠습니까?');
                           if(choice){
                              location.replace('gameDelete.do?pro_num=${list.pro_num}');
                           }
                        };
                     </script>
                     </c:if>
               </a>
           </div>
         </c:forEach>
         </div>
         <div class="float-clear">
            <hr width="100%" size="1" noshade="noshade">
         </div>
        
      <!-- 보드 게임 끝 -->
      
      <!-- 페이지 표시 -->
      <div class="align-center">${page}</div>
   
</div>
</body>
</html> 