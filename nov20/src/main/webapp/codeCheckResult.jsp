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
<h3 align="center">��ǰ �ڵ� �ߺ� �˻� ���</h3>
<form action="" name="frm">
	��ǰ �ڵ�: <input type="text" name="CODE" value="<%= code %>">
	<input type="submit" value="�ߺ� �˻�">	
</form><br/>

<% if(dup == null) { %>
	<%= code %>�� ��� �����մϴ�.
<% } else { %>
	<%= code %>�� �̹� ��� �� �Դϴ�.
<% }%>
</body>
</html>