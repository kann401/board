<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/page_header.jsp" %>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<!-- 폼 형식 유효성 검사 -->
<script>
//가입폼 확인
$(function(){
	$("#btnJoin").click(function(){
		var id = $("#userid").val();
		var pw = $("#passwd").val();
		var pw2 = $("#passwd2").val();
		var name = $("#name").val();
		
		if (id.length < 3 || id.length > 13) {
			alert("아이디는 3자 ~ 13자 까지 가능합니다.");
			$("#userid").focus();
			return;
		}
		if (pw.length < 3 || pw.length > 10) {
			alert("비밀번호는 3자 ~ 13자 까지 가능합니다.");
			$("#passwd").focus();
			return;
		}
		if (pw != pw2) {
			alert("비밀번호가 일치하지 않습니다.");
			$("#passwd2").focus();
			return;
		}
		if (name == '') {
			alert("이름은 필수 입력사항 입니다.");
			$("#name").focus();
			return;
		}
		document.joinform.submit();
		alert("회원가입이 완료되었습니다. 로그인 해주세요.")
	});
});

// ID 중복확인 창 열기
function idcheckOpen() {
	window.open("${path}/member/idcheck","newwin","top=200,left=400,width=500,height=250,resizable=no");
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
<div align="center" style="background: white;">
		<div class="row" style="background: white;">
			<div style="width: 1000px; background: white;">

				<!-- Parsley -->

				<script type="text/javascript"
					src="../resources/assets/widgets/parsley/parsley.js"></script>

				
				<div class="panel">
					<div class="panel-body">
						<h3 class="title-hero">Join</h3>
						<div class="example-box-wrapper">
							<form id="joinform" action="${path}/member/join.do" name="joinform"
								class="form-horizontal bordered-row" method="post">
								<div class="form-group">
									<label class="col-sm-3 control-label">ID (필수)</label>
									<div class="col-sm-6">
										<input type="text" name="userid" id="userid"
											class="form-control" maxlength="10" placeholder="Your ID"
											readonly="readonly" /><br> <span
											class="input-group-btn">
											<button
												class="btn btn-default  btn-boarder border-green btn-block"
												type="button" onclick="idcheckOpen()">Check Your ID</button>
										</span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">PASSWORD (필수)</label>
									<div class="col-sm-6">
										<input type="password" name="passwd" id="passwd"
											class="form-control" placeholder="Insert Your Password" /> <input
											type="password" id="passwd2" class="form-control"
											placeholder="Insert Your Same Password" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">NAME (필수)</label>
									<div class="col-sm-6">
										<input type="text" class="form-control popover-button-default"
											id="name" name="name" placeholder="Insert Your Name">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">E-MAIL (선택)</label>
									<div class="col-sm-6">
										<input type="text" class="form-control popover-button-default"
											id="email" name="email" placeholder="Insert Your Email">
									</div>
								</div>
								


								<div class="form-group">
									<div>
										<button type="button" id="btnJoin"
											class="btn btn-default btn-lg btn-block btn-border border-green btn-block">JOIN</button>
										<button type="reset"
											class="btn btn-default btn-lg btn-block btn-border border-green btn-block">RESET</button>
										<button type="button"
											class="btn btn-default btn-lg btn-block btn-border border-green btn-block"
											onclick="location.href='${path}'">BACK</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					<!-- btn btn-border btn-alt border-green btn-link font-green -->
				</div>
			</div>
		</div>
	</div>
</body>
</html>