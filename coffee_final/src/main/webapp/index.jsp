<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%@ include file="resources/include/header.jsp" %>
<div class="clear"></div>
<html>
<head>
<title>Home</title>
	<!-- 부트스트립 -->
	<link href="resources/css/bootstrap.min.css" rel="stylesheet" />
	<link href="resources/js/bootstrap.min.js" />
	<!-- 슬라이드 -->	
	<link rel="stylesheet" href="resources/css/jquery.bxslider.css?ver=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="resources/js/jquery.bxslider.js?ver=2"></script>
	<!-- 팝업창 -->
	<link rel="stylesheet" href="http://www.jacklmoore.com/colorbox/example1/colorbox.css" />
	<!-- 툴팁 -->
	<link rel="stylesheet" href="resources/css/tooltips.css">
	
	<style type="text/css">
		.clear{clear:both;}
		 /* 무한 롤링 */   
		 .bx-wrapper{
		 	margin-bottom: 0px;
		 }
		 img { max-width: 100%; height: auto; }
		 .wrap{ position: relative;}
	</style>
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
					"/inapp-web/gitple-loader.js":"https://app.gitple.io/inapp-web/gitple-loader.js",a.charset="UTF-8",e.head&&e.head.appendChild(a)}var t=document.getElementById(a);t||((t=document.createElement("iframe")).id=a,t.style.display="none",t.style.width="0",t.style.height="0",t.addEventListener?t.addEventListener("load",e,!1):t.attachEvent?t.attachEvent("onload",e):t.onload=e,document.body.appendChild(t))}var t=window,n="GitpleConfig",a="gitple-loader-frame";if(!window.Gitple){document;var i=function(){i.ex&&i.ex(arguments)};i.q=[],i.ex=function(e){i.processApi?i.processApi.apply(void 0,e):i.q&&i.q.push(e)},window.Gitple=i,t.attachEvent?t.attachEvent("onload",e):t.addEventListener("load",e,!1)}}();
		Gitple('boot');
	</script>
	<!-- 팝업창 : colorbox ( "How to have a popup window open and close automatically" in google )-->
    <script src="http://www.jacklmoore.com/colorbox/jquery.colorbox.js"></script>
   <script>
      function openColorBox(){
        $.colorbox({
          iframe:true,
          width:"600px",
          height:"760px",
          scrolling:false,
          href: "Pop.jsp", /* "http://www.sitepoint.com" */
          onLoad: function() {
        	/*  $('#close').remove(); */
          /* setTimeout(function(){
              $(window).colorbox.close();
            }, 5000) */
          }
        });
      }
      function countDown(){
        seconds--
        $("#seconds").text(seconds);
        if (seconds === 0){
          openColorBox();
          clearInterval(i);
        }
      }
     	var seconds = 5,
          i = setInterval(countDown, 100);  // 팝업 delay
    </script> 
    <script type="text/javascript">      
    		$(window).resize(function (){
    		 var Width = window.innerWidth;
	    		 if (Width <= 600) {
	    			 $('#timeline-wrap').css("display","block");
	    		 }
	    		 else if (Width >= 600) {
	    			 $('#timeline-wrap').css("display","none");
	    		 }
    		 });
    </script>
</head>
<body  style="width:100%;">

<div class="contain">
<div class="container">
		<!-- 슬라이드 영역 ( bxslider 이용) /caraousel (부트스트랩에 존재함)은 사용못험..-->
		<section class="slidePhoto">
		<div align="center" class="bxslider">
			<div>
				<img src="resources/images/slide_1.jpg">
			</div>
			<div>
				<img src="resources/images/slide_2.jpg">
			</div>
			<div>
				<img src="resources/images/slide_3.jpg">
			</div>
			<div>
				<img src="resources/images/slide_4.jpg">
			</div>
			<div>
				<img src="resources/images/slide_5.jpg">
			</div>
		</div>
	</section>
		
		<div class="jumbotron">
			<div style="margin-right: 10px; margin-left: 100px;">
				<h5 style="float:right;"><b>choose</b> anything you want</h5>
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

<hr><!-- graticule /openlayers : 지도 svg -->
	<div class="container_wrap" style="text-align: center; padding: 0">
	<div class="wrap">
		<div><h1>WorldWide exports of Coffee beans</h1><h4>by International Coffee Organization</h4></div>
		<!-- 지도 이미지 -->
		<img src="resources/images/Coffeebeans.png" style="float:center; max-width: 100%; height: auto;">
		<!-- point -->
		<div id="timeline-wrap" >
			<!-- BRAZIL -->
			<div class="marker mfirst" style="position: absolute; top:398px; left:260px; 
					width:100px;height:100px; border: 60px solid rgba(68, 53, 39, .5);">
		      <span class="hint--top" style="width: 70px;height:70px; background: transparent;" 
		      		data-hint=" 1. BRAZIL > 15.9% of total coffee exports ">
		      <div class="inner-marker"></div></span></div>
			<!-- VIETNAM -->
			<div class="marker m2"style="position: absolute; top:290px; left:840px; 
					width:93px;height:93px; border: 57px solid rgba(68, 53, 39, .5);">
	   		 <span class="hint--top"style="width: 70px;height:70px;background: transparent;"  
	   		 data-hint=" 2. VIETNAM > 10.5% of total coffee exports">
	     	 <div class="inner-marker"></div></span></div>
	      	<!-- COLOMBIA -->
	      	<div class="marker m3" style="position: absolute; top:370px; left:226px;
	      			width:70px;height:70px; border: 46px solid rgba(255, 99, 9, .5);">
	    	 <span class="hint--top"style="width: 70px;height:70px;background: transparent;" 
	    	  data-hint=" 3. COLOMBIA > 8% of total coffee exports">
	     	 <div class="inner-marker"></div></span></div>
	      	<!-- INDONESIA -->
	        <div class="marker m4" style="position: absolute; top:370px; left:910px; 
	         		width:66px;height:66px; border: 40px solid rgba(255, 99, 9, .5);">
	  		  <span class="hint--top"style="width: 70px;height:70px;background: transparent;"  
	  		  data-hint="4. INDONESIA > 7.6% of total coffee exports">
	   		  <div class="inner-marker"></div></span></div>
	  		<!-- ETHIOPIA -->
	 		<div class="marker m5" style="position: absolute; top:320px; left:610px; 
	 		       width:56px;height:56px;border: 37px solid rgba(249, 223, 51, .5);">
	    	  <span class="hint--top"style="width: 70px;height:70px;background: transparent;"  
	    	  data-hint="5. ETHIOPIA > 2.4% of total coffee exports" >
	          <div class="inner-marker"></div></span></div>
			<!--  INDIA -->
	  		<div class="marker mlast" style="position: absolute; top:270px; left:750px; 
	  				 width:50px;height:50px;border: 32px solid rgba(249, 223, 51, .5);">
	    	  <span class="hint--top"style="width: 70px;height:70px;background: transparent;"  
	    	  data-hint="6. INDIA > 1.8% of total coffee exports">
	          <div class="inner-marker"></div></span></div>

		</div><!-- timeline-wrap -->	
	</div><!-- wrap end -->
		<hr>		
		<div class="card text-white bg-dark mb-3" style="max-width: 200rem;">
		  <div class="card-header">Coffee &nbsp; Information</div>
			  <div class="card-body"><!-- width:500px; height:100px; float:left;margin-right:10px; -->
			  	<a href="http://www.coffeefestival.net/"><img src="resources/images/object.jpg" style="max-width: 100%; height: auto; float:center;margin-right:10px;"></a>
			    <p class="card-text" style="padding: 10px;max-width: 85%;margin-left: 90px; ">
					올림픽 기간 동안 강릉카페로 떠나는 세계여행 카페별 세계민속전, 한국과 강릉의 커피 히스토리전, 재즈와 민속공연으로 몸과 마음이 따뜻해지는 시간.
					푸르른 동해바다 옆, 강릉커피거리에서 진행되는 이번 행사에 가족, 연인 그리고 친구와 함께 즐거운 커피향에 흠뻑 취해보시기 바랍니다.</p>
				<a href="http://korean.visitkorea.or.kr/kor/bz15/travel/content/C03020100/view_1902931.jsp">
				<img src="resources/images/otherevent.JPG" style="max-width: 85%; height: auto; float:center;margin-right:10px;"></a>
			    <p class="card-text" style="padding: 10px;">제주산 커피, 드셔보셨나요? 제주 코리아커피농장</p>
			  </div>
		  	<button type="button" class="btn btn-outline-secondary" style="border-color: #fff; margin: 5px;">
		  			<a href="article.do">read&nbsp;&nbsp;more</a></button>
		</div>
	</div><!-- container_wrap --><br>
</div><!-- jumbotron end -->
</div><!-- container end -->
</div>
<%@ include file="resources/include/footer.jsp" %>
</body><div id="media-320" style="display: none;height: 0px;overflow: hidden;"></div>
</html>