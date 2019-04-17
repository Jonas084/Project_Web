<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="spring.fin.boardsmodel.*" %>    
<%@ include file="/resources/include/header.jsp" %>
<% List<CoBoardDTO> coboardRpList = (List<CoBoardDTO>)request.getAttribute("coboardRpList"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 내용보기</title>
<link rel="stylesheet" href="/resources/css/coboard.css" type="text/css">

<script src="./js/jquery-3.2.1.js"></script>
<script>
	$(function(){
		$('#replsubmit').click(function(){
			replaction.submit();
		})
	})

</script>

</head>
<body>
	<div class="container" style="clear:both; position:relative; width: 100%; margin: 0 auto;">
		  <div id="dCont_wrap" class="card border-primary mb-3">
		   <div class="board-box-line-dashed"></div>
		   <table id="dCont_t">
		    <tr>
		    	<td style="font-weight: bold;"> &nbsp; &nbsp; &nbsp; ${cobcont.coboard_title}</td>
		     	<td > &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;| &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="badge badge-info">${cobcont.coboard_sort}게시판 </span></td>
		     	<th>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; &nbsp; &nbsp;조회수</th>
		     	<td>${cobcont.coboard_hit}</td>		     
		    </tr>
		   </table>
		   
		   <hr style="color:blue;">
		   
		   <div>	   		     
		     <textarea class="form-control" id="exampleTextarea" disabled="disabled"  style="background-color: white;">${coboard_cont}</textarea>
		   </div>
		   
		   <hr style="color:blue;">
		   
		   <div class="box-reply container" style="background-color: #f9f9f9;" >
		   		<!-- 댓글 리스트 -->
		   		<ul class="recontlist" id="recont_list" class="list-group">
		   			<% for(int i = 0; i < coboardRpList.size(); i++){
		   				CoBoardDTO rpl = coboardRpList.get(i);
		   				if(rpl.getCoboard_level() != 0){
		   			%>
		   			<li class="list-group-item d-flex justify-content-between align-items-center">
		   			
		   				<p class="recontbox">
		   					<span class="recont"><%=rpl.getCoboard_cont() %></span>
		   				</p>
		   				<div class = "reinfo">
							<span class="badge badge-pill badge-light" style="font-size: 1em;"> <%= rpl.getCoboard_name() %></span>
							<span class="badge badge-primary badge-pill"><%= rpl.getCoboard_regdate() %></span>		   				
		   				</div>
		   			</li>
		   			<hr>
		   			<%} %>
		   			<%} %>
		   		</ul>
		   		
		   		<form action="coboard_reply_ok.do" method="post" id="replaction">
		   			<input type="hidden" name="coboard_no" value="${cobcont.coboard_no}" />
	 				<input type="hidden" name="coboard_ref" value="${cobcont.coboard_ref}" />
	 				<input type="hidden" name="coboard_step" value="${cobcont.coboard_step}"/>
	 				<input type="hidden" name="coboard_level" value="${cobcont.coboard_level}" />
			   		<input type="hidden" name="coboard_sort" value="${cobcont.coboard_sort} ">
			   		<input type="hidden" name="coboard_title" value="댓글">
			   		<input type="hidden" name="page" value="${page}">
			   		<input type="hidden" name="state" value="reply" />
			   		
					
  					 <div class="form-group">
  					 <h5>댓글 작성</h5>			   					 	
  						<textarea class="form-control" rows="3" cols="150" id="coboard_cont" name="coboard_cont" placeholder="댓글을 입력하세요"></textarea>			   					
  					<span class="badge badge-success repl_writer">작성자</span><input type="text" name="coboard_name" class="form-control is-valid" style="width: 100px;"/>
  					<button name="replsubmit" id="replsubmit" class="btn btn-info" >등록</button>
					</div>
					
					
		   		</form>		   		
		   </div>
		   
		   <div style="width:60%">
			   <div id="opinion" style="float:right;">
			   		<span>추천 수 </span> <span>${cobcont.coboard_recommendation }</span>
			   		&nbsp;
			   		<input type="button" value="추천" class="btn btn-outline-info" onclick="location='coboard_contopinion.do?num=${cobcont.coboard_no}&page=${page }&state=recommendation'" />
			   		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; 
			   		<span>비추천 수 </span> <span>${cobcont.coboard_opposition }</span>
			   		&nbsp;	   
			   		<input type="button" value="비추천" class="btn btn-outline-warning" onclick="location='coboard_contopinion.do?num=${cobcont.coboard_no}&page=${page }&state=opposition'" />		   		
			   				
			   </div>
		   </div>
		   		   
		   
		   <div id="dCont_menu">
			   <input type="button" value="수정" class="btn btn-outline-primary" onclick="location='coboard_cont.do?num=${cobcont.coboard_no}&page=${page}&state=edit'" />
			   <input type="button" value="삭제"class="btn btn-outline-warning" onclick="location='coboard_cont.do?num=${cobcont.coboard_no}&page=${page}&state=del'" />
			   <input type="button" value="목록" class="btn btn-outline-info" onclick="location='coboard_list.do?page=${page}'" />             
		   </div>
		 </div>
	</div>  
</body>
</html>

<%@ include file="/resources/include/footer.jsp" %>







