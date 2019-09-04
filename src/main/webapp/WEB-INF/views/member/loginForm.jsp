<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="../include/page_header.jsp" %>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
$(function(){
	$("#btnLogin").click(function(){
		var id = $("#userid").val();
		var passwd = $("#passwd").val();
		
		if(id == ""){
			alert("아이디를 입력해주세요.");
			$("#userid").focus();
			return;
		}
		if(passwd == "") {
			alert("비밀번호를 입력해주세요.");
			$("#passwd").focus();
			return;
		}
		document.doLogin.submit();
	});
});
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

<style type="text/css">
html, body {
	height: 100%;
	background: #fff;
}
</style>
<!-- code here -->
	<div class="center-vertical">
		<div class="center-content row">

			<form action="${path}/member/login_check.do" id="login-validation"
				name="doLogin"
				class="col-md-4 col-sm-5 col-xs-11 col-lg-3 center-margin"
				method="post">
				<h3
					class="text-center pad25B font-gray text-transform-upr font-size-23">
					LogIn <span class="opacity-80"></span>
				</h3>
				<div id="login-form" class="content-box bg-default">
					<div class="content-box-wrapper pad20A">
						<img class="mrg25B center-margin radius-all-100 display-block"
							src="../resources/assets/image-resources/gravatar.jpg" alt="">
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon addon-inside bg-gray"> <i
									class="glyph-icon icon-envelope-o"></i>
								</span> <input type="email" class="form-control" id="userid"
									name="userid" placeholder="Enter ID">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon addon-inside bg-gray"> <i
									class="glyph-icon icon-unlock-alt"></i>
								</span> <input type="password" class="form-control" id="passwd"
									name="passwd" placeholder="Password">
							</div>
						</div>
						<div class="form-group">
							<button type="button" class="btn btn-block btn-primary"
								id="btnLogin">Login</button>
						</div>
						<div class="row">
							<div class="checkbox-primary col-md-6" style="height: 20px;">
								<label> <input type="checkbox" id="loginCheckbox1"
									class="custom-checkbox"> Remember me
								</label>
							</div>
							<div class="text-right col-md-6">
								<a href="#" class="switch-button" switch-target="#login-forgot"
									switch-parent="#login-form" title="Recover password">Forgot
									your password?</a>
							</div>
						</div>
					</div>
				</div>

				<div id="login-forgot" class="content-box bg-default hide">
					<div class="content-box-wrapper pad20A">

						<div class="form-group">
							<label for="exampleInputEmail2">Email address:</label>
							<div class="input-group">
								<span class="input-group-addon addon-inside bg-gray"> <i
									class="glyph-icon icon-envelope-o"></i>
								</span> <input type="email" class="form-control"
									id="exampleInputEmail2" placeholder="Enter email">
							</div>
						</div>
					</div>
					<div class="button-pane text-center">
						<button type="submit" class="btn btn-md btn-primary">Recover
							Password</button>
						<a href="#" class="btn btn-md btn-link switch-button"
							switch-target="#login-form" switch-parent="#login-forgot"
							title="Cancel">Cancel</a>
					</div>
				</div>

			</form>

		</div>
	</div>

</body>
</html>