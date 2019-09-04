<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<a href="${path}/member/joinForm.do">회원가입</a> |  
	<c:if test="${sessionScope.userid == null }">
		<a href="${path}/member/loginForm">로그인</a> |
	</c:if>
<a href="${path}/board/list.do">게시판</a> |

<div style="text-align: right;">
	<c:if test="${sessionScope.userid != null }">
		${sessionScope.name}님이 로그인중입니다.
		<a href="${path}/member/logout.do">로그아웃</a>
	</c:if>
</div>
	


