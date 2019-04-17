<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원관리 로그인</title>
<link href="resources/css/bootstrap.css" rel="stylesheet" />
<link href="resources/js/bootstrap.min.js" />
<link href="resources/css/login.css" rel="stylesheet" />
<style>
</style>
</head>
<body>
	<video src="resources/images/LoginBackground.mp4" autoplay loop muted poster="resources/images/LoginWallpaper.jpg" id="bg"></video>
	<div class="container" id="loginContainer">
		<div class="title">
			<!-- <div class="modal-title ">환영합니다!</div> -->
		</div>

		<br>

		<section class="text-center" > 
		<!-- 로고: 홈으로 이동 -->
		<a href="index.jsp"> 
			<img src="resources/images/logo.jpg" class="col-lg-5 col-xl-5 col-md-12 col-sm-12" alt="Coffee Beans" style="width: 30%; margin-bottom: 30px;">
		</a>  
		<!--  로그인 폼 -->
		<form id="login-form" class="col-lg-5 col-xl-5 col-md-12 col-sm-12" style="margin: auto; " method="post" action="member_Login_ok.do"
			onsubmit="return Login_check();">

			<div class="form-group">
				<input type="text" class="form-control" name="login_id"
					id="login_id" placeholder="Username" style="margin-bottom: 3%;" autofocus>
			</div>
			<div class="form-group">
				<input type="password" class="form-control" name="login_pwd"
					id="login_pwd" style="margin-bottom: 3%;" placeholder="Password">
			</div>


			<!-- 로그인 / 회원가입 / 비밀번호 찾기 버튼 -->
			<div class="buttons">
				<button type="submit" class="btn btn-secondary btn-login"
					style="width: 100%; margin-bottom: 3%;">로그인</button>
					<br>
				<button type="submit" class="btn btn-secondary input_b"
					onclick="location='member_Join.do" style="display: inline; width: 47%; margin-right: 2%">회원가입</button>
				<button type="submit" class="btn btn-secondary input_b"
					 onclick="location='pwd_Find.do" style="display: inline; width: 47%;">비밀번호
					찾기</button>
			</div>
			<!-- <img src="resources/images/events.jpg" style="width: 600px; height:300px;"> -->
		</form>
		</section>
	</div>

</body>
</html>
<div style="clear: both;" ></div>
