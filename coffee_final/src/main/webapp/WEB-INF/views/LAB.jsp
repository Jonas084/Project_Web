<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Coffee Beans</title>

<link href="resources/css/bootstrap.css" rel="stylesheet" />
<link href="resources/css/LAB.css?ver=354" rel="stylesheet" />
<script src="./js/jquery-3.2.1.min.js" type="text/javascript"></script>

</head>
<body>
<%@ include file="/resources/include/header.jsp"%>
<div class="clear"></div>
	<div
		class="container text-center"
		id="LAB_container">

		<h5 class="subtitle">Current trend in coffee</h5>
		<h2>DATA LAB</h2>
		<div class="separator"></div>

		<!-- 인스타 태그 워드클라우드 표시 -->
		<div id="instaTag">
			<h3>인스타그램에서 카페 관련 태그와 함께 쓰인 태그들입니다.</h3>
			<img src="resources/images/Rplot.jpeg" alt="인스타그램 TAG"/>
			<a href="#"><h3>태그 검색하기</h3></a>
			</div>
		
		<br>

		<!-- 데이터 분석 결과 표시   -->
		<div id="dataLAB"></div>
		<div class="tag_div">
			<div>
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col" class="small-th"></th>
							<th scope="col">태그</th>
							<th scope="col" class="small-th">횟수</th>
							<th scope="col">비율</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="tags" items="${TagList}">
							<tr>
								<th scope="row" class="small-th">${tags.tag_Number}</th>
								<td>${tags.tagname}</td>
								<td class="small-th">${tags.tagcount}</td>
								<td>${tags.tagshare}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

	</div><div class="clear"></div>
<%@ include file="../../../../resources/include/footer.jsp"%>
</body>
</html><%-- 
 --%>