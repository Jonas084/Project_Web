<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%@ include file="/resources/include/header.jsp" %>

<div class="clear"></div>
<html>
<head>
<title>Home</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 부트스트립 -->
	 
	<link href="resources/css/bootstrap.min.css" rel="stylesheet" />
	<link href="resources/js/bootstrap.min.js" />
	
<style type="text/css">
		/* 본문 _ 원두 설명 또는 웹 홍보 */
.clear{clear:both;}
.coffee_img{padding:0px;}
.coffee_img:hover{
    opacity: 0.5;
    filter: alpha(opacity=50); /* For IE8 and earlier */
}
</style>
	
	<!-- 커피이미지 -->	 
<script src="./js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script type="text/javascript">

</script>

<script><!-- 깃플 -->
	window.GitpleConfig = { appCode: 'p71YO5nI11i0E2xIxRHiKTb0LeXek2' };
	!function(){function e(){function e(){var e=t.contentDocument,a=e.createElement("script");a.type="text/javascript",a.async=!0,a.src=window[n]&&window[n].url?window[n].url+"/inapp-web/gitple-loader.js":"https://app.gitple.io/inapp-web/gitple-loader.js",a.charset="UTF-8",e.head&&e.head.appendChild(a)}var t=document.getElementById(a);t||((t=document.createElement("iframe")).id=a,t.style.display="none",t.style.width="0",t.style.height="0",t.addEventListener?t.addEventListener("load",e,!1):t.attachEvent?t.attachEvent("onload",e):t.onload=e,document.body.appendChild(t))}var t=window,n="GitpleConfig",a="gitple-loader-frame";if(!window.Gitple){document;var i=function(){i.ex&&i.ex(arguments)};i.q=[],i.ex=function(e){i.processApi?i.processApi.apply(void 0,e):i.q&&i.q.push(e)},window.Gitple=i,t.attachEvent?t.attachEvent("onload",e):t.addEventListener("load",e,!1)}}();
	Gitple('boot');
</script>


</head>

<body style="width:100%;" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
<div class="contain">
<div class="container">
		<div class="jumbotron">
			<div class="order" style="float:right; margin-top:3px; margin-left: 50px;position:relative">
				정렬 > <a href="recommandbest.do"> BEST  /</a>
				<a href="recommandlowprice.do"> LowPrice  /</a>
				<a href="recommandhighprice.do" style="margin-right:5px;"> HighPrice </a>
			</div>
			
			 <div class="switch col-sm-12" style="margin-top: 50px;">
				<form action="recommand.do">
						<fieldset class="form-group col-sm-12">
							<button class="btn btn-secondary col-sm-2" type="submit"  style="float:right">Best Research</button>
							<select class="custom-select col-sm-1" id="sourness" name="sourness" style="float:right">
								<option value="1" SELECTED>신맛</option>
							      <option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option></select>
							<select class="custom-select col-sm-1" id="bitters" name="bitters" style="float:right">
									<option value="1" SELECTED>쓴맛</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									</select>		
							<select class="custom-select col-sm-1" id="sweetness" name="sweetness"  style="float:right">
									<option value="1" SELECTED>단맛</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									</select>
							<select  class="custom-select col-sm-1" id="aroma" name="aroma" style="float:right">
									<option value="1" SELECTED>향</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									</select>
							<select  class="custom-select col-sm-1" id="body" name="body"  style="float:right">
									<option value="1" SELECTED>바디감</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									</select>
							<select class="custom-select col-sm-1" id="balance" name="balance" style="float:right">
									<option value="1" SELECTED>밸런스</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									</select>
						</fieldset>
					</form>
			</div><!-- switch end -->
			
<hr class="lead">
		
			<div class="container_marketing col-sm-12">
				<c:forEach var="coffee" items="${list}" >
					<div class="coffee_thumb col-sm-4" style="float:left;">
							<!-- (boot) rounded-0 : 사각형 이미지 틀 / col-lg-4 : 타이틀 형 스페이스 -->
							<div class="col-sm-12"  style="float:left;">
									<a href="coffeeDetail.do?coffee_number=${coffee.coffee_number}" style="margin-right: 10px;">
										<img class="coffee_img col-sm-12" src="resources/images/${coffee.main_img}">
									</a>
							</div>
						<div>
							${coffee.coffee_name}
						</div>
						<hr>
					</div>
				</c:forEach>
			</div>
			<div class="clear"></div>
		</div><!-- jumbotron end -->
</div><!-- container end -->
</div>
</body>
</html>
<div class="clear"></div>
<%@ include file="/resources/include/footer.jsp" %>