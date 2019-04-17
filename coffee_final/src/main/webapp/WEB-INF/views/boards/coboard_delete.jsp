<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/include/header.jsp" %>  

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 삭제</title>
<link rel="stylesheet" href="resources/css/coboard.css" type="text/css">
<script src=".js/jquery-3.2.1.js"></script>
<script>
  function del_check(){
	  if($.trim($("#coboard_pwd").val())==""){
		  alert("비밀번호를 입력하세요!");
		  $("#coboard_pwd").val("").focus();
		  return false
	  }
  }
</script>

</head>
<body> 
	
		 <div id="Del_wrap" class="container">
		 	
			   <h3 class="Del_title">게시물 삭제</h3>
			   <form method="post" action="coboard_del_ok.do" onsubmit="return del_check()">
			     <input type="hidden" name="coboard_no" value="${cobcont.coboard_no}" />
			     <input type="hidden" name="page" value="${page}" />
			     <span class="badge badge-success" style="font-size: 1.5em;">비밀번호</span>           
			     <input type="password" name="coboard_pwd" id="coboard_pwd" class="form-control is-valid" style="width:150px;"/>    
			     <input type="submit" value="삭제" class="btn btn-danger" />
			     <input type="reset" value="취소" class="btn btn-info" onclick="$('#coboard_pwd').focus();" />     
			   </form>
		   
		 </div>
	 
</body>
<div class="clear"></div>
</html>

<%@ include file="/resources/include/footer.jsp" %>










