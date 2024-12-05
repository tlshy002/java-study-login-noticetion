<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="items.Items" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% Items dto = (Items)request.getAttribute("ITEM"); %>
<div align="center">
<h3>상품 상세 정보</h3>
<table>
	<tr><th>상품번호</th><td><%= dto.getItem_code() %></td></tr>
	<tr><th>상품이름</th><td><%= dto.getItem_title() %></td></tr>
	<tr><th>원 산 지</th><td><%= dto.getNation() %></td></tr>
	<tr><th>등 록 일</th><td><%= dto.getReg_date() %></td></tr>
	<tr><th>상품설명</th><td><textarea rows="5" cols="60" readonly="readonly"><%= dto.getItem_spec() %></textarea></td></tr>
</table>
</div>


</body>
</html>