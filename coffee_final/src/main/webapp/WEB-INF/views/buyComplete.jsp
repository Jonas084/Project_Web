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
<script>
$(document).ready(function(){
	
});
</script>
<script><!-- 깃플 -->
		window.GitpleConfig = { appCode: 'p71YO5nI11i0E2xIxRHiKTb0LeXek2' };
		!function(){function e(){function e(){
			var e=t.contentDocument,a=e.createElement("script");a.type="text/javascript",
			a.async=!0,a.src=window[n]&&window[n].url?window[n].url+
					"/inapp-web/gitple-loader.js":"https://app.gitple.io/inapp-web/gitple-loader.js",a.charset="UTF-8",e.head&&e.head.appendChild(a)}var t=document.getElementById(a);t||((t=document.createElement("iframe")).id=a,t.style.display="none",t.style.width="0",t.style.height="0",t.addEventListener?t.addEventListener("load",e,!1):t.attachEvent?t.attachEvent("onload",e):t.onload=e,document.body.appendChild(t))}var t=window,n="GitpleConfig",a="gitple-loader-frame";if(!window.Gitple){document;var i=function(){i.ex&&i.ex(arguments)};i.q=[],i.ex=function(e){i.processApi?i.processApi.apply(void 0,e):i.q&&i.q.push(e)},window.Gitple=i,t.attachEvent?t.attachEvent("onload",e):t.addEventListener("load",e,!1)}}();
		Gitple('boot');
</script>
</head>
<body style="width:100%;" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
<div>
	<div class="container" style="margin-top:30px;">
		<div class="col-sm-12 well-lg panel panel-default" style="text-align:center">
			<div class="panel-body">
				<h1>결제가 완료되었습니다.</h1>
				<h5>결제 정보를 확인해 주세요</h5>
			</div>
			
		</div>
		<div class="col-sm-12">
			<filedset class="col-sm-12">
				<legend>구매 정보</legend>
				<hr>
				<table class="table table-hover table-bordered" style="width:100%;">
				<colgroup>
				<col style="width:100px;"/>
				<col style="width:auto"/>
				</colgroup>
					<tr><th>구매자</th><td>${mem.userName}</td></tr>
					<tr><th>전화번호</th><td>${mem.userPhone}</td></tr>
					<tr><th>배송지</th><td>${mem.userAddress}</td></tr>
					<tr><th>제품명</th><td>${list.coffee_name}</td></tr>
					<tr><th>가격</th><td>${coffeep} 원</td></tr>
					<tr><th>수량</th><td>${quantity*200}g</td></tr>
					<tr><th>총액</th><td>${tprice} 원</td></tr>
					<tr><th>잔액</th><td>${remain} 포인트</td></tr>
				</table>
			</filedset>
		</div>
	</div>
</div>
</body>
</html>
<div class="clear"></div>
<%@ include file="/resources/include/footer.jsp" %>