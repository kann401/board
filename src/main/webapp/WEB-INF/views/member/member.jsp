<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/page_header.jsp" %>

</head>
<body>
<div id="loading">
    <div class="spinner">
        <div class="bounce1"></div>
        <div class="bounce2"></div>
        <div class="bounce3"></div>
    </div>
</div>

<div class="hero-box full-bg-4">
    <div class="container">
        <h1 class="hero-heading wow fadeInDown" data-wow-duration="0.6s">${sessionScope.userid}(${sessionScope.name})님 반갑습니다.</h1>
        <p class="hero-text wow bounceInUp" data-wow-duration="0.9s" data-wow-delay="0.2s">Join & Board</p>
    </div>
    <div class="hero-overlay hero-light"></div>
</div>
	
</body>
</html>