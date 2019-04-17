<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/resources/include/header.jsp" %>
<%
/* HttpSession session = request.getSession();
String id = (String)session.getAttribute("id"); 
*/
%>
<div class="clear"></div>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link href="resources/css/bootstrap.min.css" rel="stylesheet" />
<link href="resources/css/dddddd.css" rel="stylesheet" />
<link rel="stylesheet" href="resources/css/title.css" >
   	<link rel="stylesheet" href="resources/css/contents.css">
<style>

</style>
<script src="./resources/js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="./resources/js/bootstrap.min.js" type="text/javascript"></script>
<script src="./resources/js/ddddddddddddddd.js" type="text/javascript"></script>



<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
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

</head>
<body style="width:100%;" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
    <hr>
    
    <div class="container" style="padding:0px;">
    	<div class="row">
	    	<div class="col-sm-1">
	    	</div>
	    	<div class="col-sm-6">
	    		<img src="resources/images/${list.main_img}" class="main_img" style="width:100%;padding:15px;">
	    	</div>
	    	
    		<div class="col-sm-5">
    			<div style="padding-top:20%">
    				<div style="padding-left:15px;">
		    		이름 : ${list.coffee_name} 
		    		<hr>
		    		가격 : ${list.price}
		    		<hr> 
		    		공급처 : 커피빈즈(주)
		    		<hr>
		    		</div>
		    		<div style="height:100px;"></div>
	    			<div class="col-sm-12">
	    				<div>
		    				<form name="buy_coffee" class="col-sm-12">
		    					<input type="hidden" value="${list.coffee_number}" name="coffee_number">
			    				<input type="button" class="btn btn-secondary btn-lg" style="width:45%;float:left;" value="구매하기" onclick="send();">
			    			</form>
			    		</div>
			    		<div>
			    			<form name="basket_coffee" class="col-sm-12">
			    				<input type="hidden" value="${list.coffee_number}" name="coffee_number">
			    				<input type="submit" class="btn btn-secondary btn-lg" style="width:45%;float:left;margin-left:10px" value="장바구니" onclick="sendb();">
			    			</form>
		    			</div>
		    		</div>
	    		</div>
	    	</div>
    	</div>
    	
    	<div class="col-sm-12">
	    	<div class="informationimg">
	    		<div class="text-center"><h3>커피 정보</h3><hr></div>
	    		<div class="row">
	    			<div class="col-sm-2"></div>
	    			<div class="col-sm-8"><img src="resources/images/${list.inform_img_a}" style="width:100%;"></div>
	    			<div class="col-sm-2"></div>
	    		</div>
	    	</div>
    	</div>
    	
    	<div class="postscript col-sm-12">
    		<div  class="text-center"><h3>후기 작성</h3></div>
    		<div class=""><h6>※구입하신분이 후기작성하시면 포인트를 드립니다.(로그인 필요)</h6></div>
    		<hr>
    		<div>
				<form name="sendp" action="postInsert.do">
					<div>
						<input type="hidden" value="${list.coffee_number}" name="coffee_number">
						<div class="form-group">
							<label for="t">제목:</label>
	  						<input type="text" class="form-control" id="t" name="title">
						</div>
						<div class="form-group">
							<label for="usr">작성자:</label>
							<input type="hidden" id="loginid" name="loginid" value="<%=id%>">
	  						<input type="text" readonly="readonly" class="form-control" id="writer" name="writer" value="">
						</div>
						<div class="form-group">
						  <label for="comment">Comment:</label>
						  <textarea class="form-control" rows="5" id="comment" name="content"></textarea>
						</div>
						<div class="radio" style="height:50px;">
							<label>평점 : </label>&nbsp;&nbsp;
							<label class="radio-inline"><input type="radio" value="ico_point1.gif" name="evaluation" style="width:40px;">1</label>&nbsp;&nbsp;
							<label class="radio-inline"><input type="radio" value="ico_point2.gif" name="evaluation" style="width:40px;">2</label>&nbsp;&nbsp;
							<label class="radio-inline"><input type="radio" value="ico_point3.gif" name="evaluation" style="width:40px;">3</label>&nbsp;&nbsp;
							<label class="radio-inline"><input type="radio" value="ico_point4.gif" name="evaluation" style="width:40px;">4</label>&nbsp;&nbsp;
							<label class="radio-inline"><input type="radio" value="ico_point5.gif" name="evaluation" checked="checked" style="width:40px;">5</label>
						</div>
						<input type="submit" value="글쓰기" class="btn btn-warning btn-block" >
					</div>
				</form>
			</div>
			<div>
				<div  class="text-center"><h3>상품 후기</h3></div>
				
  					<input class="form-control" id="myInput" type="text" placeholder="Search..">
    			<hr>
	    		<table summary="" class="table table-hover table-bordered" style="width:100%;">
				<colgroup>
				<col style="width:60px;"/>
				<col style="width:auto"/>
				<col style="width:90px;"/>
				<col style="width:100px;"/>
				<col style="width:60px;"/>
				<col style="width:80px;" class=""/>
				</colgroup>
				<thead><tr>
												<th scope="col">번호</th>
					                            <th scope="col">제목</th>
					                            <th scope="col">작성자</th>
					                            <th scope="col">작성일</th>
					                            <th scope="col">조회</th>
					                            <th scope="col" class="">평점</th>
					                      </tr></thead>
				<tbody id="myTable">
				
				<c:forEach var="polist" items="${polist}">
				
				<tr class="xans-record">
					 <td id="subject">${polist.board_number}</td>
	                 <td class="subject" ><a onclick="show('${polist.board_number}');return false;" href="#">${polist.title}</a></td>
	                 <td>${polist.writer}</td>
	                 <td class="txtL">${polist.regdate}</td>
	                 <td class="${polist.board_number}" id="clickcount${polist.board_number}" name="${polist.board_number}">${polist.click_count}</td>
	                 <td class=""><img src="resources/images/${polist.evaluation}" /></td>
	             </tr>
				 <tr id="${polist.board_number}" style="visibility:collapse;"><td colspan="6" style="border-style:none;">${polist.content}</td></tr>
				</c:forEach>  
				              
	    		</tbody>
				</table>
			</div>			
    	</div>
    </div>
    
</body>
</html>
<div class="clear"></div>
<%@ include file="../../../../resources/include/footer.jsp" %>