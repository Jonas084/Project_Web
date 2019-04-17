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
<link href="resources/css/bootstrap.min.css" rel="stylesheet" />
<style>
.clear{clear:both;}
.maininform{margin-top:20px;}
</style>
<script src="./resources/js/jquery-3.2.1.min.js" type="text/javascript"></script>

<script src="./resources/js/bootstrap.min.js" type="text/javascript"></script>
<script  type="text/javascript">
function fn_sum(){
	var obj =  document.getElementById('quantity').value;
	var sum = 0;
	sum = parseInt(obj);
	var obj1 =document.getElementById('price').value;
	var obj2 = document.getElementById('point').value;
	
	totalprice.value = sum*obj1;
	remain.value=obj2-(sum*obj1);
	if(remain.value<0){
		alert("포인트를 충전하세요");
		location.href = "mypage_point.do" 
	}
};

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
<div class="contain">
	<div class="container" style="margin-top:50px;">
		<div class="row">
			<div class="col-sm-1" style="float:left;"></div>
			<div class="col-sm-5" style="float:left;"><img src="resources/images/${list.main_img}"/></div>
			<div class="col-sm-1" style="float:left;"></div>
			<div class="col-sm-4" style="float:left;">
				<form action="buycoffeereal.do" name="ff">
					<input type="hidden" value="${list.coffee_number}" name="coffee_number">
					<div class="coffee_name maininform col-sm-12">품명 : ${list.coffee_name} </div>
					<div class="price maininform col-sm-12"><span><input type="hidden" name="price" id="price" value="${list.price}">가격 : ${list.price}원</span></div>
					<div><select class="custom-select maininform col-sm-12" id="quantity" name="quantity" onchange="fn_sum();">
										<option value="1" SELECTED>수량</option>
									    <option value="1">200g</option>
										<option value="2">400g</option>
										<option value="3">600g</option>
							</select>
					</div>
					<div class="maininform col-sm-12"><input type="hidden" name="point" id="point" value="${mem.userPoint}">현재 포인트 : ${mem.userPoint} 원</div>
					<div class="total maininform col-sm-12"><span>총가격 : <input name="totalprice" class="form-control" readonly="readonly" type="text" id="totalprice" value="" ></span><div class="col-sm-12" style="text-align:right">원</div></div>
					<div class="maininform col-sm-12">잔액 : <span><input name="remain" class="form-control" readonly="readonly" type="text" id="remain" value=""></span><div class="col-sm-12" style="text-align:right">원</div></div>
					<div><input type="submit" class="btn maininform col-sm-12" value="구매완료"/></div>
				</form>
			</div>
			<div class="col-sm-1" style="float:left;"></div>
		</div>
		<div class="clear"></div>
		<div style="margin-top:20px;">
		
			<div class="">회원정보</div>
			<hr>
			<div>
				<table class="table">
				<colgroup>
				<col style="width:100px;"/>
				<col style="width:auto;"/>
				
				</colgroup>
					<tr><th>주문자</th><td>${mem.userName}</td></tr>
					<tr><th>배송지</th><td>${mem.userAddress}</td></tr>
					<tr><th>전화번호</th><td>${mem.userPhone}</td></tr>
					<tr><th>문의처</th><td>02-2233-3131</td></tr>
				</table>
			
    
    		</div>
    	</div>
    	<div class="col-sm-12">
				<div style="margin-top:20px; text-align:left;" ></div>
				<div style="padding-top:10px; background:#F1F1F1;  text-align:center;">
					<div align="left" style="height:26;padding:5px 0 10px 25px;">
					<b>주문에 대한 개인정보 수집에 대한 동의</b> (자세한 내용은 “<a href="#">개인정보취급방침</a>”을 확인하시기 바랍니다)
					</div>
					<div>
						 <table cellspacing=0 cellpadding=6 width="100%" border=0>
						<tr>
							<th>
							<div class="content_title">개인정보의 수집목적 및 이용목적</div>
							</th>
						</tr>
						<tr>
							<td style="text-align: justify">
							①카페빈즈(주)은 회원님께 최대한으로 최적화되고 맞춤화된 서비스를 제공하기 위하여 다음과 같은 목적으로 개인정보를 수집하고 있습니다. <br>
							- 성명, 아이디, 비밀번호 : 회원제 서비스 이용에 따른 본인 식별 절차에 이용 <br>
							- 이메일주소, 이메일 수신여부, 전화번호 : 고지사항 전달, 본인 의사 확인, 불만 처리 등 원활한 의사소통 경로의 확보, 새로운 서비스/신상품이나 이벤트 정보의 안내 <br>
							- 주소, 전화번호 : 경품과 쇼핑 물품 배송에 대한 정확한 배송지의 확보 <br>
							- 비밀번호 힌트용 질문과 답변 : 비밀번호를 잊은 경우의 신속한 처리를 위한 내용 <br>
							- 그 외 선택항목 : 개인맞춤 서비스를 제공하기 위한 자료 <br>
							② 단, 이용자의 기본적 인권 침해의 우려가 있는 민감한 개인정보(인종 및 민족, 사상 및 신조, 출신지 및 본적지, 정치적 성향 및 범죄기록, 건강상태 및 성생활 등)는 수집하지 않습니다.
							</td>
						</tr>
						</table>
					
						<table cellspacing=0 cellpadding=6 width="100%" border=0>
						<tr>
							<th>
							<div class="content_title">개인정보의 보유기간 및 이용기간 </div>
							</th>
						</tr>
						<tr>
							<td style="text-align: justify">
							① 귀하의 개인정보는 다음과 같이 개인정보의 수집목적 또는 제공받은 목적이 달성되면 파기됩니다. 단, 상법 등 관련법령의 규정에 의하여 다음과 같이 거래 관련 권리 의무 관계의 확인 등을 이유로 일정기간 보유하여야 할 필요가 있을 경우에는 일정기간 보유합니다. <br>
							- 회원가입정보의 경우, 회원가입을 탈퇴하거나 회원에서 제명된 경우 등 일정한 사전에 보유목적, 기간 및 보유하는 개인정보 항목을 명시하여 동의를 구합니다. <br>
							- 계약 또는 청약철회 등에 관한 기록 : 5년 <br>
							- 대금결제 및 재화등의 공급에 관한 기록 : 5년 <br>
							- 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 <br>
							② 귀하의 동의를 받아 보유하고 있는 거래정보 등을 귀하께서 열람을 요구하는 경우 카페빈즈 (주)은 지체없이 그 열람,확인 할 수 있도록 조치합니다.
							</td>
						</tr>
						</table>
					</div>
			</div>
		</div>
	</div>
	<div style="margin-top:20px;"></div>
</div>  
</body>
</html>
<div class="clear"></div>
<%@ include file="../../../../resources/include/footer.jsp" %>
