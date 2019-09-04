<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/page_header.jsp" %>

<!-- 헤더에 있는 jquery 가 연동이 안되는것 같음. 일일히 파일마다 연결해주어야 할듯. -->
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

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
		document.form1.action="${path}/board/updateForm";
		document.form1.submit();
	});
	$("#btnDelete").click(function(){
		deleteConfirm();		
	});
});

function deleteConfirm(){
	if(confirm("정말 삭제하시겠습니까?")){
		location.href="${path}/board/delete.do?bno=${dto.bno}"
	} else {
		return;
	}
}
function reply(){
	var replytext=$("#replytext").val();
	var bno="${dto.bno}";
	var param={"replytext": replytext, "bno":bno}; //파라미터 설정
	$.ajax({
		type: "post",
		url: "${path}/reply/insert.do",
		data: param,
		success: function(){
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
			$("#replytext").val('');
		}
	});
}
</script>

</head>
<body>
<div id="loading">
        <div class="spinner">
            <div class="bounce1"></div>
            <div class="bounce2"></div>
            <div class="bounce3"></div>
        </div>
    </div>

    <div id="page-wrapper">
        <div id="page-content-wrapper">
            <div id="page-content">
                    <div class="container">

<div class="row mailbox-wrapper">
<div class="col-md-9">

    <div class="content-box">
<form id="form1" name="form1" method="post">
        <div class="pad15A clearfix mrg10B">
            <div class="float-left">
                <b>${dto.writer}</b> (${dto.name})
            </div>
            <div class="float-right opacity-80">
                <i class="glyph-icon icon-clock-o mrg5R"></i>
                <fmt:formatDate value="${dto.regdate}"
	pattern="yyyy-MM-dd a HH:mm"/>
            </div>
        </div>
        <div class="mail-toolbar clearfix">
            <div class="float-left">
                <h4 class="font-primary">${dto.title}</h4>
            </div>
            <div class="float-right">
            <!-- 본인이 작성한 글일 경우 삭제 수정 가능 -->
	<input type="hidden" name="bno" value="${dto.bno}">
	<!-- 본인이 작성하나 글이거나, 관리자가 로그인한 경우 수정,삭제 가능 -->
	<c:if test="${sessionScope.userid == dto.writer ||
	sessionScope.userid == 'admin'}">
		
		<button type="button" id="btnUpdate" class="btn btn-warning">
      	  <i class="glyph-icon icon-cut"></i>
        </button>
<!-- 		<button type="button" id="btnUpdate">수정</button> -->
		<button type="button" class="btn btn-danger" id="btnDelete">
        	<i class="glyph-icon icon-trash-o"></i>
        </button>
<!-- 		<button type="button" id="btnDelete">삭제</button> -->
	</c:if>
		
            </div>
        </div>
        <div class="email-body">
            <p>${dto.content}</p>
        </div>
        
        <!-- 값을 넘겨주기 위한 hidden태그들 (b태그등은 name속성을 붙일수 없기때문에 hidden으로 처리한다.) -->
        <input type="hidden" name="writer" value="${dto.writer}">
        <input type="hidden" name="name" value="${dto.name}">
        <input type="hidden" name="title" value="${dto.title}">
        <input type="hidden" name="bno" value="${dto.bno}">
        <input type="hidden" name="content" value="${dto.content}">
        
        <br>
<!-- 댓글은 form을 사용하지 않고 ajax방식을 사용 -->
<!-- 댓글 등록창은 로그인이 되어있어야만 보이게 처리한다. -->
<div style="width: 700px; text-align:center;">
<c:if test="${sessionScope.userid != null }">
	<div class="pad15A">
	<textarea rows="5" cols="80" id="replytext" placeholder="댓글을 작성하세요."></textarea>
	<br><br>
	<!-- <button type="button" id="btnReply">댓글쓰기</button> -->
	<button type="button" class="btn btn-blue-alt" id="btnReply">댓글 달기</button>&nbsp;
	<button type="button" class="btn btn-default" id="btnList">목록으로</button>
	</div>
</c:if>
</div>

<!-- 댓글 목록을 출력할 영역 -->
<div id="listReply"></div>

        </form>
    </div>
</div>
</div>
                    </div>
            </div>
        </div>
    </div>


</body>
</html>