<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/resources/include/header.jsp" %>
<div class="clear"></div>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <link href="resources/css/mypage.css" rel="stylesheet" type="text/css" /> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
   

<style>
.clear{clear:both;}

</style>
<script src="./resources/js/basket.js" type="text/javascript"></script>

<script><!-- 깃플 -->
		window.GitpleConfig = { appCode: 'p71YO5nI11i0E2xIxRHiKTb0LeXek2' };
		!function(){function e(){function e(){
			var e=t.contentDocument,a=e.createElement("script");a.type="text/javascript",
			a.async=!0,a.src=window[n]&&window[n].url?window[n].url+
					"/inapp-web/gitple-loader.js":"https://app.gitple.io/inapp-web/gitple-loader.js",a.charset="UTF-8",e.head&&e.head.appendChild(a)}var t=document.getElementById(a);t||((t=document.createElement("iframe")).id=a,t.style.display="none",t.style.width="0",t.style.height="0",t.addEventListener?t.addEventListener("load",e,!1):t.attachEvent?t.attachEvent("onload",e):t.onload=e,document.body.appendChild(t))}var t=window,n="GitpleConfig",a="gitple-loader-frame";if(!window.Gitple){document;var i=function(){i.ex&&i.ex(arguments)};i.q=[],i.ex=function(e){i.processApi?i.processApi.apply(void 0,e):i.q&&i.q.push(e)},window.Gitple=i,t.attachEvent?t.attachEvent("onload",e):t.addEventListener("load",e,!1)}}();
		Gitple('boot');
</script>
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
	<div class="container">
		<div style="margin-top:30px;text-align:center;">
			<h2>마이 페이지</h2>
		</div>
		<hr>
		<div class="col-sm-2" style="float:left">
			<ul class="list-group">
				<li class="list-group-item list-group-item-danger"><a href="mypage_basket.do">장바구니</a></li>
				<li class="list-group-item"><a href="mypage_record.do">구매내역</a></li>
				<li class="list-group-item "><a href="mypage_point.do">포인트</a></li>
				<li class="list-group-item"><a href="">회원정보수정</a></li>
			</ul>
		</div>
		<div	class="col-sm-10 table-responsive" style="float:left;margin-bottom:50px;">
			<table class="table table-hover table-bordered" style="width:100%;" >
							<colgroup>
							<col style="width:30px;"/>
							<col style="width:100px;"/>
							<col style="width:auto;"/>
							<col style="width:80px;"/>
							<col style="width:100px;"/>
							<col style="width:120px;" />
							</colgroup>
							<thead><tr style="text-align:center;">
					                            <th scope="col"></th>
					                            <th scope="col">이미지</th>
					                            <th scope="col">이름</th>
					                            <th scope="col">가격</th>
					                            <th scope="col">수량</th>
					                            <th scope="col">총가격</th>
					                      </tr></thead>
							<tbody id="myTable">
								
									<c:forEach var="bask" items="${userbasketlist}">
										
										<tr class="chkclass form-group">
											<td><input type="checkbox" name="check" id="ch${bask.basket_number}" value="${bask.price}" onclick="fn_tsum(${bask.basket_number});">
												<input type="hidden" id="basket_number" name="basket_number" value="${bask.basket_number}">
												<input type="hidden" class="totalp" name="total${bask.basket_number}" id="total${bask.basket_number}" value="${bask.price}">
												<input type="hidden" class="quantity" name="quant${bask.basket_number}" id="quant${bask.basket_number}" value="1"></td>
											<td style="padding:0px;"><img src="resources/images/${bask.main_img}" style="width:100%" data-toggle="modal" data-target="#myModal${bask.basket_number}"></td>
											 <td>${bask.coffee_name}</td>
											 <td><input type="hidden" name="price${bask.basket_number}" id="price${bask.basket_number}" value="${bask.price}">${bask.price}원</td>
											 <td><select class="custom-select" style="height:100%;"id="quantity${bask.basket_number}" name="quantity${bask.basket_number}" onchange="fn_sum(${bask.basket_number});">
															<option value="1" SELECTED>수량</option>
														    <option value="1">200g</option>
															<option value="2">400g</option>
															<option value="3">600g</option>
													</select></td>
											 <td class="col-xs-3" style="text-align:right;"><input type="text" readonly="readonly" class="form-control" name="totalp${bask.basket_number}" id="totalp${bask.basket_number}" value="${bask.price}">원</td>
										</tr>
										<div id="myModal${bask.basket_number}" class="modal fade" role="dialog">
										  <div class="modal-dialog modal-lg" style="float:left;margin-left:300px;">
										
										    <!-- Modal content-->
										    <div class="modal-content">
										      <div class="modal-header">
										          <button type="button" class="close" data-dismiss="modal">&times;</button>
										        </div>
										     
										      <div class="modal-body">
										        <img src="resources/images/${bask.inform_img_a}"style="max-width: 100%; height: 100%;"> 
										      </div>
										      
										      <div class="modal-footer">
										        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
										      </div>
										    </div>
										
										  </div>
										</div>
	
										
									</c:forEach>
									
								
							</tbody>
			</table>
							<button class="btn btn-secondary my-2 my-sm-0 btn-lg" id="deleteFrm">장바구니 삭제</button>
			<div style="float:right">
				<div class="col-xs-4" style="margin-top:40px;">
				보유 포인트 : <input class="form-control " type="text" readonly="readonly" name="point" id="point" value="${mempoint}">
				</div>
				<hr>
				<div class="col-xs-4">
				결제 총액 : <input class="form-control" type="text" readonly="readonly" name="totalprice" id="totalprice" value="">
				<hr>
				</div>
				<div class="col-xs-4">
				잔액 : <input class="form-control" type="text" readonly="readonly" name="remain" id="remain" value="">
				<br>
				<button class="btn btn-secondary my-2 my-sm-0 btn-lg" id="submitFrm" style="width:100%">결제</button>
				</div>
			</div>
		
		</div>
	</div>
</body>
</html>
<div class="clear"></div>
<%@ include file="../../../../resources/include/footer.jsp" %>


