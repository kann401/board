<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    
    //수정완료 버튼 클릭시 이벤트 처리
    $(function(){
    	$("#btnSave").click(function(){
    		$("#content").html($(".wysiwyg-editor").code());
    		document.updateForm.submit();
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
                <span class="mail-title">Board Update</span>
            </div>
        </div>

        <div class="divider"></div>
        <form class="form-horizontal mrg15T" role="form" name="updateForm" action="${path}/board/update.do" method="post">
            <div class="form-group row">
                <label for="inputEmail1" class="col-sm-2 control-label">Writer:</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="name" name="name" value="${dto.name}" readonly="readonly">
                </div>
            </div>
            <div class="form-group row">
                <label for="inputEmail4" class="col-sm-2 control-label">Title:</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="title" name="title" value="${dto.title}">
                </div>
            </div>

        <div class="pad15A">
            <textarea class="wysiwyg-editor" id="content" name="content">${dto.content}</textarea>
      
        </div>

        <div class="button-pane">
            <button type="button" id="btnSave" class="btn btn-info">Confirm</button>	
        </div>
        <!-- primary key인 bno를 통해 sql을 수정해야한다. -->
        <input type="hidden" name="bno" value="${dto.bno}">
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