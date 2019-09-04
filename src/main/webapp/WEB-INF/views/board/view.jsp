<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/page_header.jsp" %>
<script>
$(function(){
	listReply("1");	//처음 글을 눌렀을때 댓글을 불러온다.
	$("#btnReply").click(function(){
		reply();
	});
	$("#btnList").click(function(){
		location.href="${path}/board/list.do";
	});
	$("#btnUpdate").click(function(){
		document.form1.action="${path}/board/update.do";
		document.form1.submit();
		alert("수정 되었습니다.");
	});
});
function reply(){
	var replytext=$("#replytext").val();
	var bno="${dto.bno}";
	var param={"replytext": replytext, "bno":bno}; //파라미터 설정
	$.ajax({
		type: "post",
		url: "${path}/reply/insert.do",
		data: param,
		success: function(){
			alert("댓글이 등록되었습니다.");
			//댓글의 리스트를 뿌려주는 함수 호출 ("댓글의 curPage") : 댓글도 페이징 처리를 해줘야 하기 때문ㅋ
			listReply("1");
		}
	});
}
function listReply(num){
	$.ajax({
		type: "post",
		url: "${path}/reply/list.do?bno=${dto.bno}&curPage="+num,
		success: function(result){
			console.log(result);
			$("#listReply").html(result);
		}
	});
}
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>게시물 보기</h2>
<form id="form1" name="form1" method="post">
<div>작성일자 : <fmt:formatDate value="${dto.regdate}"
	pattern="yyyy-MM-dd a HH:mm:ss"/></div>
<div>조회수 : ${dto.viewcnt}</div>
<div>이름 : ${dto.name}</div>	
<div>제목 : <input name="title" value="${dto.title}"></div>
<div style="width:80%;">내용 : 
<textarea rows="3" cols="80" name="content" id="content">
	${dto.content}</textarea>
</div>

<!-- 이미지 첨부 코드 자리 -->

<!-- 이미지 첨부 코드 자리 -->

<!-- 수정 삭제는 로그인되어있는 본인만 가능하도록 -->
<div>
	<input type="hidden" name="bno" value="${dto.bno}">
	<!-- 본인이 작성하나 글이거나, 관리자가 로그인한 경우 수정,삭제 가능 -->
	<c:if test="${sessionScope.userid == dto.writer ||
	sessionScope.userid == 'admin'}">
		
		<button type="button" id="btnUpdate">수정</button>
		<button type="button" id="btnDelete">삭제</button>
	</c:if>
		<button type="button" id="btnList">목록</button>
</div>
</form><br>
<!-- 댓글은 form을 사용하지 않고 ajax방식을 사용 -->
<!-- 댓글 등록창은 로그인이 되어있어야만 보이게 처리한다. -->
<div style="width: 700px; text-align:center;">
<c:if test="${sessionScope.userid != null }">
	<textarea rows="5" cols="80" id="replytext" placeholder="댓글을 작성하세요."></textarea>
	<br>
	<button type="button" id="btnReply">댓글쓰기</button>
</c:if>
</div>

<!-- 댓글 목록을 출력할 영역 -->
<div id="listReply"></div>

</body>
</html>