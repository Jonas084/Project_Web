<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/resources/include/header.jsp" %>

<html>
<head>
<title>Home</title>
	<!-- 부트스트립 -->
	<link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	<link href="resources/js/bootstrap.min.js" />
<style>

</style>
	<script><!-- 깃플 -->
		window.GitpleConfig = { appCode: 'p71YO5nI11i0E2xIxRHiKTb0LeXek2' };
		!function(){function e(){function e(){
			var e=t.contentDocument,a=e.createElement("script");a.type="text/javascript",
			a.async=!0,a.src=window[n]&&window[n].url?window[n].url+
					"/inapp-web/gitple-loader.js":"https://app.gitple.io/inapp-web/gitple-loader.js",a.charset="UTF-8",e.head&&e.head.appendChild(a)}var t=document.getElementById(a);t||((t=document.createElement("iframe")).id=a,t.style.display="none",t.style.width="0",t.style.height="0",t.addEventListener?t.addEventListener("load",e,!1):t.attachEvent?t.attachEvent("onload",e):t.onload=e,document.body.appendChild(t))}var t=window,n="GitpleConfig",a="gitple-loader-frame";if(!window.Gitple){document;var i=function(){i.ex&&i.ex(arguments)};i.q=[],i.ex=function(e){i.processApi?i.processApi.apply(void 0,e):i.q&&i.q.push(e)},window.Gitple=i,t.attachEvent?t.attachEvent("onload",e):t.addEventListener("load",e,!1)}}();
		Gitple('boot');
	</script>
</head>

<body  oncontextmenu="return false" ondragstart="return false" onselectstart="return false">

<div class="container" style="position:relative">
<div class="jumbotron">
		<div class="box-body table-responsive">
			<div class="modal-header">
			<h2 style="float: left; width: 200px;">Research</h2>
			</div>
             <table class="table table-hover">
				  <thead>
				    <tr>
				      <th scope="col">BNO</th>
				      <!-- <th scope="col">CATEGORY</th> -->
				      <th scope="col">TITLE</th>
				      <th scope="col">CONTENT</th>
				      <th scope="col">WRITER</th>
				      <th scope="col">REGDATE</th>
				      <th scope="col">VIEWCNT</th>
				    </tr>
				  </thead>
				
               	<!-- bno, 제목, 작가, 등록일, 조회수 -->
               	<tbody>
                <c:forEach items="${listAll}" var="CoffeePostscriptDTO">
               	
        			<tr class="listToChange">
        				<td class="scrolling" data-bno="${CoffeePostscriptDTO.board_number}">
        					${CoffeePostscriptDTO.board_number}
        				</td>
        				<td>
			              <div class="modal-dialog ">
			               	 <input name="title" type="title" class="form-control" 
			                  	value="${CoffeePostscriptDTO.title}" readonly="readonly">
			                </div>
        				</td>
        				<td> <textarea name="content" class="form-control"rows="3" readonly="readonly">
				                  	${CoffeePostscriptDTO.content}</textarea></td>
        				<td>${CoffeePostscriptDTO.writer}</td>
        				<td>
        					<fmt:formatDate value="${CoffeePostscriptDTO.regdate}" pattern="yyyy-MM-dd"/>
        				</td>
            			<td>
            				<span class="label label-success">${CoffeePostscriptDTO.click_count}</span>
						</td>
        			</tr> 
				</c:forEach> 
              </tbody></table>
         </div>
	</div><!-- jumbotron end -->
</div><!-- container end -->
</body>
</html>
<%@ include file="/resources/include/footer.jsp" %>