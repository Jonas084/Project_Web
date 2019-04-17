<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%
HttpSession session = request.getSession();
String id = (String)session.getAttribute("id"); 
%>
<%
String cp = request.getContextPath(); 
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ORIGIN</title>
<!-- 메뉴바 -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   	<link rel="stylesheet" href="resources/css/title.css" >
   	<link rel="stylesheet" href="resources/css/contents.css">
   	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>

<script type="text/javascript">/* 회원정보 :contents.css */
$(function(){
     	var pull2=$('#pull2');
     	    menuq=$('.polt .pol');
     	    menuHeight=menuq.height();   	      
     $(pull2).on('click', function(e){
     	e.preventDefault();
     	menuq.slideToggle();   	      	
     });
     $(window).resize(function(){
     	var w=$(window).width();
     	if(w>600 && menuq.is(':hidden'))
     		{menuq.removeAttr('style');}
     });
 });
</script> 
<script>/* 반응형 메뉴 : style2.css*/
   	      $(function(){
   	      	var pulls=$('#pulls');
   	      	    menu=$('nav ul');
   	      	    menuHeight=menu.height();   	      
   	      $(pulls).on('click', function(e){
   	      	e.preventDefault();
   	      	menu.slideToggle();   	      	
   	      });
   	      $(window).resize(function(){
   	      	var w=$(window).width();
   	      	if(w>600 && menu.is(':hidden'))
   	      		{menu.removeAttr('style');}
   	      });
   	  });
</script>
</head>
<body>
<div class="container" style="margin-top: 30px;">
			<header>
						<div style="width:300px;float:right" >
								<div class="polten" style="float:right; width:100px;">
									<ul class="nav nav-pills flex-column">
									  <li class="nav-item dropdown">
									    <a id="pull2" class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">info</a> 
									    <div class="miniclear polt A ">
											    <ul class="miniclear pol dropdown-menu B" x-placement="bottom-start" style="position: absolute; transform: translate3d(0px, 40px, 0px); top: 0px; left: 0px; will-change: transform;">
												 	  	<li class=" dropdown-item C" href="#"><a>회원가입</a></li>
												 	  	<li class=" dropdown-item C" ><a href="mypage_login.do">마이페이지</a></li>
											    </ul>
									    </div>
									  </li>
									</ul>
								</div>
							
							<c:if test="${empty sessionScope.id}">
								<strong><a href="./member_Login.do" class="btn btn-secondary my-2 my-sm-0" style="float: right;">로그인</a></strong><br/>
							</c:if>	
							<c:if test="${not empty sessionScope.id}">
								${sessionScope.id}님<br/>
								<a href="#" class="btn btn-secondary my-2 my-sm-0" style="float: right;">로그아웃</a><br/>
							</c:if>
						</div>
							
				<div class="title">
					<h1><a href="http://localhost:8090/coffee/index.jsp"><img src="resources/images/logo.jpg" alt="Coffee Beans" style="width: 140px; height:80px;"></a></h1>
				</div>
			</header>
				<div>
				<nav class="clearfix colt">
					<ul class="clearfix col" style="font-family: sans-serif; height: 310px; width:100%; padding: 10px; padding-top: 15px;">
						<li style="padding: 10px;margin-right:10px;margin-left:10px;">ORIGIN &nbsp; </li>
						<li><a href="./recommand.do" style="width:100px; font-size: 13px;margin-right:10px;">원두 종류 <span class="sr-only">(current)</span></a></li>
						<li><a href="./recommand.do" style="width:100px; font-size: 13px;margin-right:10px;"> 커피 추천</a></li>
						<li><a href="#" style="width:100px; font-size: 13px;margin-right:10px;"> 카페 맛집</a></li>
						<li><a href="#" style="width:100px; font-size: 13px;margin-right:10px;"> 커뮤니티</a></li>
						<li><a href="#" style="width:100px; font-size: 13px;margin-right:10px;">  이벤트</a></li>
						<li><a href="#" style="width:100px; font-size: 13px;margin-right:40px; margin-left: 10px;"> LAB &nbsp;</a></li>
						<form action="./research.do"  class="form-inline my-2 my-lg-0" id="research" >
						      <input class="form-control mr-sm-2" type="text" placeholder="Search">
						      <button class="btn btn-secondary my-2 my-sm-0" type="submit">research</button>
				    	</form>
					</ul>
					<a id="pulls" href="#" style="color: #fff;">Menu</a>
				</nav>
			</div>
</div>
</body>
</html>
 