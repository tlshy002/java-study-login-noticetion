<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "image.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% ImageBBS dto = (ImageBBS)request.getAttribute("DETAIL"); %>

<div align="center">
<h3>�̹��� �Խñ� �󼼺���</h3>
<form action="imageDelete.do" method="post" onsubmit="return check(this)">
	<input type="hidden" name="id" value="<%= dto.getW_id() %>" />
	<table>
		<tr><th>�� ��</th><td><%= dto.getTitle() %></td></tr>
		<tr><th>�ۼ���</th><td><%= dto.getWriter() %></td></tr>
		<tr><th>�� ȣ</th><td><input type="password" name="PWD" /></td></tr>
		<tr><th>�ۼ���</th><td><%= dto.getW_date() %></td></tr>
		<tr><th colspan="2" align="center"><img alt="" src="upload/<%= dto.getImagename() %>" width="250" height="200" /></th></tr>
		<tr><th>�� ��</th><td><textarea rows="5" cols="60" readonly="readonly"><%= dto.getContent() %></textarea></td></tr>
		<tr><td colspan="2" align="center">
			<input type="submit" value="����" />
			<input type="reset" value="���" /></td></tr>
				
	</table>
</form>
</div>
</body>
</html>