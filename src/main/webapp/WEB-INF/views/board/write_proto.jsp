<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 인터셉터로 url을 통해 게시글 작성 페이지로의 접근 차단할 것. -->
<!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
<title> Board Write Form </title>
<!-- Jquery 연결 -->
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<%@ include file="../include/page_header.jsp" %>

<!-- Bootstrap Summernote WYSIWYG editor -->

<!--<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/summernote-wysiwyg/summernote-wysiwyg.css">-->
<script type="text/javascript" src="../resources/assets/widgets/summernote-wysiwyg/summernote-wysiwyg.js"></script>
<script type="text/javascript">
    //WYSIWYG 에디터 설정 
    $(function() { "use strict";
        $('.wysiwyg-editor').summernote({
            height: 350
        });
    });
    
    //작성 버튼 클릭시 이벤트 처리
    $(function(){
    	$("#btnSave").click(function(){
    		$("#content").html($(".wysiwyg-editor").code());
    		document.writeForm.submit();
    	});
    });
</script>

</head>
    <body>
    <div id="sb-site">
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

<!-- 필요한 게시글 작성 부분 시작  -->
<div class="col-md-9">

    <div class="content-box">
        <div class="mail-header clearfix">
            <div class="float-left">
                <span class="mail-title">Board Write</span>
            </div>
        </div>

        <div class="divider"></div>
        <form class="form-horizontal mrg15T" role="form" name="writeForm" action="${path}/board/insert.do" method="post">
            <div class="form-group row">
                <label for="inputEmail1" class="col-sm-2 control-label">Writer:</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="name" name="name" placeholder="${sessionScope.name}" readonly="readonly">
                </div>
            </div>
            <div class="form-group row">
                <label for="inputEmail4" class="col-sm-2 control-label">Title:</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요.">
                </div>
            </div>

        <div class="pad15A">
        	<input type="hidden" id="content_proto" value="${dto.content}">
            <textarea class="wysiwyg-editor" id="content" name="content"></textarea>
      
        </div>

        <div class="button-pane">
            <button type="button" id="btnSave" class="btn btn-info">Confirm</button>	
        </div>
        </form>

    </div>
</div>
</div>
                    </div>



            </div>
        </div>
    </div>
</div>
</body>
</html>
