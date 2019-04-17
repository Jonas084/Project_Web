<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/resources/include/header.jsp" %>
<div class="clear"></div>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link href="resources/css/bootstrap.min.css" rel="stylesheet" />
<style>
.clear{clear:both;}
</style>
<script src="./resources/js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="./resources/js/bootstrap.min.js" type="text/javascript"></script>
<script><!-- 깃플 -->
		window.GitpleConfig = { appCode: 'p71YO5nI11i0E2xIxRHiKTb0LeXek2' };
		!function(){function e(){function e(){
			var e=t.contentDocument,a=e.createElement("script");a.type="text/javascript",
			a.async=!0,a.src=window[n]&&window[n].url?window[n].url+
					"/inapp-web/gitple-loader.js":"https://app.gitple.io/inapp-web/gitple-loader.js",a.charset="UTF-8",e.head&&e.head.appendChild(a)}var t=document.getElementById(a);t||((t=document.createElement("iframe")).id=a,t.style.display="none",t.style.width="0",t.style.height="0",t.addEventListener?t.addEventListener("load",e,!1):t.attachEvent?t.attachEvent("onload",e):t.onload=e,document.body.appendChild(t))}var t=window,n="GitpleConfig",a="gitple-loader-frame";if(!window.Gitple){document;var i=function(){i.ex&&i.ex(arguments)};i.q=[],i.ex=function(e){i.processApi?i.processApi.apply(void 0,e):i.q&&i.q.push(e)},window.Gitple=i,t.attachEvent?t.attachEvent("onload",e):t.addEventListener("load",e,!1)}}();
		Gitple('boot');
	</script>
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
	<div class="container">
		<div style="margin-top:30px;text-align:center;">
			<h2>마이 페이지</h2>
		</div>
		<hr>
		<div class="col-sm-2" style="float:left">
			<ul class="list-group">
				<li class="list-group-item"><a href="mypage_basket.do">장바구니</a></li>
				<li class="list-group-item"><a href="mypage_record.do">구매내역</a></li>
				<li class="list-group-item list-group-item-dark"><a href="mypage_point.do">포인트</a></li>
				<li class="list-group-item"><a href="">회원정보수정</a></li>
			</ul>
		</div>
		<div	class="col-sm-10" style="float:left;margin-bottom:50px;">
			<div class="row" style="margin-top:30px;">
				<div	class="col-sm-2"></div>
				<div class="col-sm-7">
					<table class="table table-bordered" >
						<tr>
							<td colspan="2"><div style="text-align:center"><h3>잔여포인트 : ${mempoint} 원</h3></div></td>
						</tr>
						<tr class="form-group col-sm-12">
							<form action="coupon_input.do">
								<td class="col-sm-6">
									<input type="text" class="form-control input-lg" id="couponNum" name="couponNum">
								</td>
								<td class="col-sm-6" style="padding:0;">
									<input type="submit" class="btn" style="line-height:53px;text-align:center;font-size:1.2em;width:100%;" value="쿠폰번호 입력">
								</td>
							</form>
						</tr>
					</table>
				</div>
				<div	class="col-sm-5"></div>
			</div>
		</div>
	</div>
</body>
</html>
<div class="clear"></div>
<%@ include file="../../../../resources/include/footer.jsp" %>