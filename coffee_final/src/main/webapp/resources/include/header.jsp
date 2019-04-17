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
<%
	String user_id = (String) session.getAttribute("id");
	String valid = (String) session.getAttribute("valid");

	if (valid != null) {
%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#before").css("display", "none")

		$("#after").css("display", "inline")

	});
</script>

<%
	} else {
%>

<script type="text/javascript">
	$(document).ready(function() {
		$("#after").css("display", "none")
		$("#before").css("display", "inline")
	});
</script>
<%
	}
%>

</head>
<body  style="width:100%;">
<div class="container" style="margin-top: 30px;">
				<div style="float:right; width: 170px;">
						<div id="before" class="header1" style="float: left;">
							<a href="./member_Login.do" class="btn btn-secondary my-2 my-sm-0">로그인</a>
						</div>
						<form method="post" action="member_Logout.do">
							<div id="after" class="header1">
								<input type="submit" class="btn btn-secondary my-2 my-sm-0"  style="float: left;" value="로그아웃" />
							</div>
						</form><!-- login end -->				
				
						<div style="width:100px;float:right" >
								<div class="polten" style="float:right; width:100px;">
									<ul class="nav nav-pills flex-column">
									  <li class="nav-item dropdown">
									    <a id="pull2" class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">info</a> 
									    <div class="miniclear polt A ">
											    <ul class="miniclear pol dropdown-menu B" x-placement="bottom-start" style="position: absolute; transform: translate3d(0px, 40px, 0px); top: 0px; left: 0px; will-change: transform;">
												 	  	<li class=" dropdown-item C" href="#">회원가입</li>
												 	  	<li class=" dropdown-item C"><a href="mypage_login.do">마이페이지</a></li>
											    </ul>
									    </div>
									  </li>
									</ul>
								</div>
						</div><!-- toggle end -->

				</div>
			
			
				<div class="title">
					<h1><a href="index.jsp"><img src="resources/images/logo.jpg" alt="Coffee Beans" style="width: 140px; height:80px;"></a></h1>
				</div>
			
				<div>
				<nav class="clearfix colt">
					<ul class="clearfix col" style="font-family: sans-serif; height: 400px; width:100%; padding: 10px; padding-top: 15px;">
						<li style="padding: 10px;margin-right:10px;margin-left:10px;">ORIGIN &nbsp; </li>
						<li><a href="./recommand.do" style="font-size: 13px;margin-right:10px;">원두 종류 <span class="sr-only">(current)</span></a></li>
						<li><a href="./recommand.do"> 커피 추천</a></li>
						<li><a href="./famouscafe.do"> 카페 맛집</a></li>
						<li><a href="./coboard_list.do"> 커뮤니티</a></li>
						<li><a href="./article.do">이벤트</a></li>
						<li><a href="./LABrequest.do"> LAB &nbsp;</a></li>
						
						<form action="./search.do"  class="form-inline my-2 my-lg-0">
						      <!-- 검색 타입 선택 리스트 -->
								<select name="searchType" class="form-control input-sm">
									<option value="t" <c:out value="${searchType == 't'? 'selected' : ''}" /> >title</option>
									<option value="c" <c:out value="${searchType == 'c'? 'selected' : ''}" />>content</option>
									<option value="w" <c:out value="${searchType == 'w'? 'selected' : ''}" />>writer</option>
								</select>
								<!-- 검색 입력,버튼 -->
						      <input class="form-control mr-sm-2" type="text" value="${keyword}" name="keyword" placeholder="Search">
						      <button class="btn btn-secondary my-2 my-sm-0" type="submit" id="searchBtn">research</button>
				    	</form>
					</ul>
					<a id="pulls" href="#" style="color: #fff; font-size: 20px;">Menu</a>
				</nav>
			</div>
</div>
<script>

$(function(){
	/* 검색 버튼 클릭 이벤트 핸들러 */
	$('#searchBtn').on("click", function(event){
		
		// 검색옵션 값 가져오고
		var searchType = $("select[name=searchType]").val();
		
		// 키워드 값 가져와서
		var keyword = $("input[name=keyword]").val();
		
		// 서버쪽 url 스트링 완성해서 self.location으로 창 이동.
		// -> 서버쪽에서 해당 파라미터들을 수집하여 검색결과 리스트를 뿌려줄 것이다.
		self.location = "homeSearch&searchType=" + searchType + "&keyword=" + keyword;
		
	});

});
</script>

</body>
</html>
 