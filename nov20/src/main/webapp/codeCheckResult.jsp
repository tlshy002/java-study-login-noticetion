<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String code = (String)request.getAttribute("CODE");
	String dup = (String)request.getAttribute("DUP");
%>
<h3 align="center">상품 코드 중복 검사 결과</h3>
<form action="" name="frm">
	상품 코드: <input type="text" name="CODE" value="<%= code %>">
	<input type="submit" value="중복 검사">	
</form><br/>

<% if(dup == null) { %>
	<%= code %>는 사용 가능합니다.
<% } else { %>
	<%= code %>는 이미 사용 중 입니다.
<% }%>
</body>
</html>