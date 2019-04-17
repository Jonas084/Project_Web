<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="spring.fin.boardsmodel.*"%>
<%
List<CoBoardDTO> coboardList=(List<CoBoardDTO>)request.getAttribute("coboardList");
List<CoBoardDTO> bestclick=(List<CoBoardDTO>)request.getAttribute("bestclick");
List<CoBoardDTO> bestrecom=(List<CoBoardDTO>)request.getAttribute("bestrecom");


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
<link rel="stylesheet" href="./resources/css/coboard.css" type="text/css">
<script src="./resources/js/jquery-3.2.1.min.js"></script>

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

	<script src="./resources/js/jquery.innerfade.js"></script>
	<script type="text/javascript">
		  $(document).ready(function() {
	        $('#inner-fade').innerfade({
					animationtype: 'fade',
					speed: 1500,
					timeout: 3000,
					type: 'sequence',
					containerheight: '1em'
				});
	
	     }); 
		  
		  

	</script>
	<style type="text/css">
		  	/* 전환 이미지 */
  	#mainImage{  					 
  					overflow:hidden;
  					width:800px;	
  					height:200px; 
  					margin-bottom: 20px; 
  					margin-top: 20px;
  					margin-left:auto;
  					margin-right:auto; 
  					vertical-align: middle;
  					}
  	
  	#besthits_bestrecomend ul li{
  		list-style: none;
  		
  	}
  					
	</style>
</head>

<body>
	<div class="container" style="position:relative;">
		
		
		<div id="besthits_bestrecomend" style="width: 80%;">
			<ul>
				<%if(bestclick != null) {
					for(int i=0;i<bestclick.size();i++){
						CoBoardDTO bcl=bestclick.get(i);
					%>
				<li onmouseover="this.style.backgroundColor='skyblue'"	onmouseout="this.style.backgroundColor=''">
					<span class="badge badge-light" style="color:#BF3510;">최다 조회 글</span>
					 &nbsp;&nbsp;	  
					<span style="font-size: 16px;">	<a href="coboard_cont.do?num=<%=bcl.getCoboard_no()%>&page=<%=nowpage%>&state=cont"
						onfocus="this.blur();" class="table-success"><%=bcl.getCoboard_title()%></a></span>
					 &nbsp;&nbsp;	
					<span class="badge badge-secondary">조회수: <%=bcl.getCoboard_hit()%></span>
				</li>
				<%}
					}%>
				
				<%if(bestrecom != null) {
					for(int i=0;i<bestrecom.size();i++){
						CoBoardDTO brl=bestrecom.get(i);
				%>
				<li onmouseover="this.style.backgroundColor='skyblue'"	onmouseout="this.style.backgroundColor=''">
					<span class="badge badge-light" style="color: #1976DF;">최다 추천 글</span>
					 &nbsp;&nbsp;	  
					<span style="font-size: 16px;"><a href="coboard_cont.do?num=<%=brl.getCoboard_no()%>&page=<%=nowpage%>&state=cont"
						onfocus="this.blur();" class="table-success"><%=brl.getCoboard_title()%></a></span>
					 &nbsp;&nbsp;	 
					<span class="badge badge-secondary">추천수:<%=brl.getCoboard_recommendation()%></span>
				</li>
				<%}
					}%>
			</ul>		
		</div>
		
		<!-- 게시판 리스트 -->
		<div id="list_wrap">
			<div  style="width:100%; text-align: center;" ><h2 class="list_title" style="float: right;">게시글 목록</h2></div>
			<div id="list_count">
				총게시물 수 : ${listcount}<br />
			</div>
	
			<table id="list_t" class="table table-hover">
				<tr class="table-light">
					<td class="no" width=7%>번호</td>
					<td class="sort" width=7%>종류</td>
					<td class="writer" width=10%>작성자</td>
					<td class="title" width=50% style="text-align:center;">제목</td>					
					<td class="date" width=10%>날짜</td>
					<td class="hit" width=7%>추천수</td>
					<td class="hit" width=7%>조회수</td>
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
					<td class="coreco" width=10% ><span class="btn btn-danger disabled"><%=bl.getCoboard_recommendation() %></span></td>
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
					         <input name="find_name" id="find_name"  class="form-control is-valid" type="search"/>
					         </div>
					         <input type="submit" value="검색" class="btn btn-info"  />
							
				  </form>
			</div>			
			
		</div>		
		<!-- 				<img src="resources/images/coffee_taste_coboard3.jpg">
				<img src="resources/images/coffee_taste_coboard4.jpg"> -->
		<div id="mainImage">
			<div id="inner-fade">
				<img src="resources/images/coffee_coboard_banner1.gif">
				<img src="resources/images/coffee_coboard_banner2.jpg">
				<img src="resources/images/coffee_coboard_banner3.png">
				<img src="resources/images/coffee_coboard_banner4.jpg">
			</div>
		</div>
	</div>
</body>
<div class="clear"></div>
</html>


<%@ include file="/resources/include/footer.jsp" %>