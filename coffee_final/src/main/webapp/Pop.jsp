<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
   <head>
   	   <title>Responsive Navigation Demo</title>
   	   <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   	   <link rel="stylesheet" href="resources/css/style.css">
   	   <!-- 부트스트립 -->
	<link href="resources/css/bootstrap.min.css" rel="stylesheet" />
	<link href="resources/js/bootstrap.min.js" />
	<style type="text/css">
		#formo{
			background-image: url(resources/images/blur.jpeg);
			padding:20px;
		    border-color:#fff;
		    border-style:solid; 
		    max-width: 100%; height: auto;
		    width:700px; 
		    margin:0 auto;
		}
		#formor{
			max-width: 100%; 
			height: auto;
			padding:20px;
		    border-color:#fff;
		    border-style:solid; 
		    margin-top: 20px;
		}
		.title{
			color:#bc705c; text-align:center;
			margin-top:250px;
		}
		.event{
			width:300px;
			padding-top:28px;
			margin: 0 auto;
			/* margin: 0 auto; */
		}
	</style>
	<!-- 지우지 마세요~
	Reload top window from a popup after login.
	search keyword : reload(refresh) the upper(parent) window from(when) an(the) open popup,
					 close colorbox and redirect parent window to a specific url,
	 -->
   </head>
   <body>
<!-- body -->
<div class="container">
	<div class="row" >
		<div class="col-sm-11" id="formo">
			<div class="col-sm-10" id="formor">
			<img src="resources/images/event2.jpg" style="max-width: 100%; height: auto;float: left;"> 
				   <div class="col-sm-10"> 
				    <h2 class="title">COUPON EVENT !</h2>
				    <h6 style="text-align: center;">기간 내 5회 이상 구매시, 마사지 할인 쿠폰 발행 이벤트!</h6>
				  
					  <form action="event.do" class="form-inline event my-2 my-lg-0"><!-- form-inline my-2 my-lg-0 -->
						   <h6>이름 : <input class="form-control mr-sm-2" type="text" value="${namePer}" placeholder="full name" style="margin-right: 20px;width:120px;"></h6>
						   <h6>회원 번호 : 
						   			<a href="event_login.do">
						   				<input class="form-control mr-sm-2" value="${perNum}" type="text" placeholder="158399"style="width:120px;">
						   			</a></h6>
							
							<div class="modal-footer" style="border-color: #fff;margin-left: 0px;">
								<blockquote class="blockquote">
								  <footer class="blockquote-footer" style="padding: 9px;">Updating Content or Request Event Questionnaire are Call ' 02-5733-5031 '</footer>
								  <input type="button" id="Confirm" value="Confirm" style="width: 130px;margin-bottom:0;float:right" class="btn btn-secondary my-2 my-sm-0">
								</blockquote>
						  	</div>
					   </form>
					  </div>
				<script>
					$(function(){
						/* 검색 버튼 클릭 이벤트 핸들러 */
						$('#Confirm').on("click", function(event){
							// 검색옵션 값 가져오고
							var namePer = $("input[name=namePer]").val();
							// 키워드 값 가져와서
							var perNum = $("input[name=perNum]").val();
							// 서버쪽 url 스트링 완성해서 self.location으로 창 이동.
							// -> 서버쪽에서 해당 파라미터들을 수집하여 검색결과 리스트를 뿌려줄 것이다.
							self.location ="/mypage_point_five&namePer=" + namePer + "&perNum=" + perNum;
						});
					});
				</script>
			</div>
		</div><!--formo end  -->
	</div>
</div><!-- container end  -->  
</body>
</html>