<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 수정</title>
<script src="./js/jquery.js"></script>
<script src="./js/board.js"></script>
<link rel="stylesheet" type="text/css" href="./css/board.css" />
</head>
<body>
 <div id="dEdit_wrap" class="container" style="position: relative;">
  <h2 class="dEdit_title">게시물 수정폼</h2>
  <form method="post" action="coboard_edit_ok.do" 
  onsubmit="return dWrite_check();">
   <input type="hidden" name="coboard_no" value="${cobcont.coboard_no}" />
   <input type="hidden" name="page" value="${page}" />
   
   <table id="dEdit_t">    
    <tr>
     <th>글제목</th>
     <td>
      <input name="coboard_title" id="coboard_title"  size="40" class="form-control is-valid"
      value="${cobcont.coboard_title}" placeholder="${cobcont.coboard_title}" />
     </td>
    </tr>
    
    <tr>
     <th>글내용</th>
     <td>
      <textarea name="coboard_cont"  class="form-control" id="coboard_cont" rows="10" cols="100"
      class="box">${cobcont.coboard_cont}</textarea>     
     </td>
    </tr>
    
    <tr>
     <th>비밀번호</th>
     <td>
      <input type="password" name="coboard_pwd" id="coboard_pwd" class="form-control is-valid"
      style="width: 30%" />
     </td>
    </tr>
   </table>
   <div id="dEdit_menu">
    <input type="submit" value="수정" class="btn btn-primary" />
    <input type="reset" value="취소" class="btn btn-secondary"
    onclick="$('#coboard_name').focus();" />
   </div>
  </form>
 </div>
</body>
</html>
</div>
</div>

<div class="clear"></div>
<%@ include file="/resources/include/footer.jsp" %>