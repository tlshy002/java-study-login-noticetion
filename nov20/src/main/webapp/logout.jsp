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
	String id = (String)session.getAttribute("ID");
%>

<form action="logout.do">
<font color="red">ȯ���մϴ�~ <%= id %>��~</font>
<input type="submit" value="�α׾ƿ�">
</form>

</body>
</html>