<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="spring.fin.boardsmodel.*"%>
<%
List<CoBoardDTO> coboardList=(List<CoBoardDTO>)request.getAttribute("coboardList");
 
int nowpage=((Integer)request.getAttribute("page"));
int maxpage=((Integer)request.getAttribute("maxpage"));
int startpage=((Integer)request.getAttribute("startpage"));
int endpage=((Integer)request.getAttribute("endpage"));
%>
<%@ include file="/resources/include/header.jsp" %>
  
<!DOCTYPE html >
<html>
<head>
<title>게시판 목록</title>
<link rel="stylesheet" href="resources/css/coboard.css" type="text/css">
<script src="./js/jquery-3.2.1.min.js"></script>
<style type="text/css">

</style>
</head>

<body>
	<div class="container">
		<!-- 게시판 리스트 -->
		<div id="list_wrap">
			<div  style="width:100%; text-align: center;" ><h2 class="list_title">게시판 목록</h2></div>
			<div id="list_count">
				총게시물 수 : ${listcount}<br />
			</div>
	
			<table id="list_t" class="table table-hover">
				<tr class="table-light">
					<td class="no" width=8%>번호</td>
					<td class="sort" width=8%>종류</td>
					<td class="writer" width=10%>작성자</td>
					<td class="title" width=50% style="text-align:center;">제목</td>					
					<td class="date" width=10%>날짜</td>
					<td class="hit" width=8%>조회수</td>
				</tr>
				<%	    	
			for(int i=0;i<coboardList.size();i++){
				CoBoardDTO bl=coboardList.get(i);			
		%>
				<tr align="center" valign="middle" bordercolor="#333333"
					onmouseover="this.style.backgroundColor='skyblue'"
					onmouseout="this.style.backgroundColor=''">

					<td class="cono" height="23"> <span class="badge badge-success"><%=bl.getCoboard_ref()%> </span></td>
					
					<td class="colist" valign="middle" width= 100px>
					 <%if(bl.getCoboard_sort().equals("원두")){ %>
					 <span class="badge badge-info"> <img class="listimage" alt="원두" src="resources/images/coboardbean.jpg" width=40px></span> <%} 
					 else if(bl.getCoboard_sort().equals("커피")){ %>
					 <span class="badge badge-info"> <img class="listimage" alt="커피" src="resources/images/coboardcoffee.jpg" width=40px></span><%} 
					 else if(bl.getCoboard_sort().equals("디저트")){ %>
					 <span class="badge badge-info"> <img class="listimage" alt="디저트" src="resources/images/coboarddessert.jpg" width=40px></span><%} 
					 else if(bl.getCoboard_sort().equals("맛집")){ %>
					 <span class="badge badge-info"> <img class="listimage" alt="맛집" src="resources/images/coboardfamous.jpg" width=40px></span><%} 
					 else if(bl.getCoboard_sort().equals("기타")){ %>
					 <span class="badge badge-info"> <img class="listimage" alt="기타" src="resources/images/coboardothers.jpg" width=40px></span><%} %>
					 <br>					 
					 <%=bl.getCoboard_sort() %></span>
					 </td>
					
					<td class="coname" width=10% > <span class="badge badge-secondary"> <%=bl.getCoboard_name() %> </span></td>
					
					<td class="cotitle" class="table-primary">
					<a href="coboard_cont.do?num=<%=bl.getCoboard_no()%>&page=<%=nowpage%>&state=cont"
						onfocus="this.blur();" class="table-success"> <%=bl.getCoboard_title()%></a>
					</td>	
					
					<td class="codate" width=15%><%=bl.getCoboard_regdate().substring(0,10)%></td>
					<td class="cohit" width=10% ><span class="btn btn-info disabled"><%=bl.getCoboard_hit() %></span></td>
				</tr>
				<%	   
			} %>
			</table>
						<div id="list_paging">
							<ul class="pagination">
								<li class="page-item disabled">
									<%if(nowpage<=1){ %>
									 <a class="page-link" href="#">[이전]&nbsp;</a>
								</li><%}else{ %>
								<li class="page-item active">
									<a class="page-link" href="coboard_list.do?page=<%=nowpage-1 %>" onfocus="this.blur();">[이전]</a>&nbsp;
								</li><%} %>
						
									<%for(int a=startpage; a<=endpage; a++){
										if(a==nowpage){%>
									<li class="page-item disabled"><a class="page-link"><%=a %></a></li>
									<%}else{ %>
									<li class="page-item "><a class="page-link" href="coboard_list.do?page=<%=a %>" onfocus="this.blur();">[<%=a %>]
									</a>&nbsp;</li>
									<%} %>
									<%} %>
						
									<%if(nowpage>=maxpage){ %>
									<li class="page-item disabled"><a class="page-link">[다음]</a></li>
									<%}else{ %>
									<li class="page-item active"><a class="page-link" href="coboard_list.do?page=<%=nowpage+1 %>" onfocus="this.blur();">[다음]</a></li>
									<%} %>
							</ul>	
						</div>
			
			<div id="write_button">		
			 <input type="button" value="글쓰기" class="btn btn-success" onclick="location='coboard_write.do?page=<%=nowpage %>'" />
			</div>
						
			<!-- 검색 부분 -->
			<div id="list_find">
				  <script>
				    function find_check(){
				    	if($.trim($("#find_name").val())==""){
				    		alert("검색어를 입력하세요!");
				    		$("#find_name").val("").focus();
				    		return false;
				    	}
				    }
				  </script>
				  <form method="get" action="coboard_find.do"
				  onsubmit="return find_check()">
				  <input type="hidden" name="page" value="${page}"/>

					         <div style="width:10%; float: left;">
					         <select name="find_field" class="form-control" style="size: 30%; display: inline-block;" >
					         	<option value="coboard_sort"> 종류</option>
					          	<option value="coboard_title"> 제목</option>
					          	<option value="coboard_name"> 글쓴이 </option>
					          	<option value="coboard_cont"> 내용</option>		          	          
					         </select>
					        </div>
					        
					        <div style="width:10%; float:left;" class="form-group has-success">
					         <input name="find_name" id="find_name"  class="form-control is-valid"/>
					         </div>
					         <input type="submit" value="검색" class="btn btn-info"  />
							
				  </form>
			</div>			
			
		</div>		
		
	</div>
</body>
<div class="clear"></div>
</html>


<%@ include file="/resources/include/footer.jsp" %>