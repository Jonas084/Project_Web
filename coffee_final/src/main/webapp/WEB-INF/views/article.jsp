<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%@ include file="/resources/include/header.jsp" %>

<html>
<head>
<title>이벤트</title>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">	
	<link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" /> 
	<link href="resources/js/bootstrap.min.js" />
		
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	
		<link href="./resources/css/CoffeeInformation.css" rel="stylesheet"
		type="text/css" media="all">
	
	
	
	<script><!--bxslider슬라이드 이용 / carousel 자동 롤링-->
		$(document).ready(function() {
			$('.bxslider').bxSlider({
				mode:'fade',
				auto:'auto', //자동실행여부
		         autoDelay:3000, //자동으로 롤링되는 딜레이시간
		         minSlides: 3, //최소 슬라이드 수
		         maxSlides: 5, //최대 슬라이드 수 알아서 조정하시면됩니다
		         slideWidth: 'auto', //슬라이드 안의 넓이, 숫자로도 가능합니다.
		         slideMargin: 37 //슬라이드 사이의 마진값
			});
		});
	</script>
	
	<script><!-- 깃플 -->
		window.GitpleConfig = { appCode: 'p71YO5nI11i0E2xIxRHiKTb0LeXek2' };
		!function(){function e(){function e(){
			var e=t.contentDocument,a=e.createElement("script");a.type="text/javascript",
			a.async=!0,a.src=window[n]&&window[n].url?window[n].url+
				"/inapp-web/gitple-loader.js":"https://app.gitple.io/inapp-web/gitple-loader.js",a.charset="UTF-8",
				e.head&&e.head.appendChild(a)}var t=document.getElementById(a);t||((t=document.createElement("iframe")).
				id=a,t.style.display="none",t.style.width="0",t.style.height="0",t.addEventListener?t.addEventListener("load",e,!1):
				t.attachEvent?t.attachEvent("onload",e):t.onload=e,document.body.appendChild(t))}var t=window,n="GitpleConfig",
				a="gitple-loader-frame";if(!window.Gitple){document;var i=function(){i.ex&&i.ex(arguments)};i.q=[],i.ex=function(e)
				{i.processApi?i.processApi.apply(void 0,e):i.q&&i.q.push(e)},window.Gitple=i,t.attachEvent?t.attachEvent("onload",e):
				t.addEventListener("load",e,!1)}}();
		Gitple('boot');
	</script>
	
	
	
	<script src="./resources/js/jquery-3.2.1.min.js" ></script>

	<script type="text/javascript">
		$(document).ready(function() {
			$('.selected').mouseenter(function() {
				$(this).css("background", "#dcd881");
			});
			$('.selected').mouseleave(function() {
				$(this).css("background", "#eeecc1");
			});
		});
	</script>

</head>


<body>
		
	<hr>
	<div class="container" style="position:relative">
	
	<!-- <section> -->	
	<c:forEach var="article" items="${list}">
		<div class="abc col-sm-12">
					
			<div class="def col-sm-4">
				<a href="${article.coffee_link}">
					<img src="resources/images/${article.coffee_img}" width="250" height="150">
				</a>
			</div>		
			
			<div class="ghi col-sm-7">
				<a class="subject" href="${article.coffee_link}">
					${article.coffee_title}
				</a>	
				<p class="title">
				<b>${article.coffee_contents}</b>
					
				</p>													
				<p class="summary">
					
				</p>										
				<span class="meta">
					<span class="date">${article.coffee_date}</span>
				</span>
			</div>
			
		</div>
		<div class="clear"></div>
	</c:forEach>
		
	<!-- </section> -->
		
	</div>

</body>
</html>
<div class="clear"></div>
<%@ include file="/resources/include/footer.jsp" %>