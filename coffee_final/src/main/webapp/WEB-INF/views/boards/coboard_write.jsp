<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/include/header.jsp" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="./js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="./css/board.css" type="text/css">
<script>
/* $.trim()란 사용자가 지정한 문자열 변수의 양쪽끝 공백문자를 삭제해주늰 메서드이다.
	형식으로는 jQuert.trim(str)로 구성되어 있다.
	str 부분에 공백문자를 제거할 문자열 변수를 적어주면 된다.
*/

function dWrite_check(){
	if($.trim($("#coboardname").val())==""){
		alert("글쓴이를 입력하세요.");
		$("#coboardname").val("").focus();
		return false;
	}
	if($.trim($("#coboardtitle").val())==""){
		alert("글 제목을 입력하세요.");
		$("#coboardtitle").val("").focus();
		return false;
	}
	if($.trim($("#coboardcont").val())==""){
		alert("글 내용을 입력하세요.");
		$("#coboardcont").val("").focus();
		return false;
	}
	if($.trim($("#coboardpwd").val())==""){
		alert("비밀번호를 입력하세요.");
		$("#coboardpwd").val("").focus();
		return false;
	}
	
}

</script>

</head>
<body>
	<div class="container" style="position:relative;">
			<div class="dWrite_wrap">
			<fieldset style="width: 50%">
				<legend>게시글 작성</legend>
					<form action="coboard_write_ok.do" method="post" name="coboard_form" onsubmit="return dWrite_check();">
							<table id="dWrite_t" border="1" style="width: 100%" class="coboardcont_c form-control" >
								<tr>
									<th class="form-control"><span style="color: red; align: left; width:10%" > <select name="coboard_sort"
										class="coboardsort_c" id="coboardsort">											
											<option value="원두" >원두</option>
											<option value="커피" >커피</option>
											<option value="디저트" >디저트</option>
											<option value="맛집" >맛집</option>
											<option value="기타" >기타</option>
									</select></span></th>
									<td colspan="3" align="middle" >
										<span style="text:weight; width: 100%;" class="badge badge-info">제목</span>
										<input name="coboard_title" type="text"
											class="form-control is-valid" id="coboardtitle">
									</td>

								</tr>

								<tr>
									<th class="form-control"><span style="color: red;"> </span >내용</th>
									<td colspan="3"><textarea name="coboard_cont" id="coboardcont"
											class="coboardcont_c form-control" rows="10" cols="80"
											style="resize: none;"></textarea></td>
								</tr>
								<tr>
									<th><span style="color: red;">*</span> 글쓴이</th>
									<td colspan="1"><span><input name="coboard_name" type="text"
										class="coboardname_c" id="coboardname"></span>
									</td>
									<th ><span style="color: red;">*</span> 비밀번호</th>
								    <td >
								       <input type="password" name="coboard_pwd" id="coboardpwd"
								        class="coboardpwd_c" />
								    </td>
								</tr>								

							</table>							
							
							<div id="dWrite_menu">
								<input type="submit" value="작성" class="btn btn-success" />
								<input type="reset" value="취소" class="btn btn-secondary" 
								onclick="$('#coboard_name').focus();" />
							</div>												
					</form>
				</fieldset>						
				</div>
		</div>			
		
</body>
</html>

<%@ include file="/resources/include/footer.jsp" %>