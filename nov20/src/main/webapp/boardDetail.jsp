<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="bbs.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>



<section>
<%
	BoardDTO dto = (BoardDTO)request.getAttribute("DTO");
	String id = (String)session.getAttribute("ID");
%>
<h3 align="center">�Խñ� �� ����</h3>
<div align="center">
<form action="boardModify.do" method="post">
	<table border="1">
		<tr><th>������</th>
			<td><input type="hidden" name="TITLE" value="<%= dto.getTitle() %>">
			<%= dto.getTitle() %></td>
		<tr><th>�ۼ���</th><td><%= dto.getWriter() %></td>
		<tr><th>�ۼ���</th><td><%= dto.getWrite_date() %></td>
		<tr><th>�� ��</th>
			<td><textarea rows="4" cols="20" name="CONTENT"><%= dto.getContent() %></textarea></td>
			</td></tr>
			
		<!-- ����,���� ��ư�� �α����� ���� ���̵����ϱ� -->
<%
		if(id != null && id.equals(dto.getWriter())) { // id,������ �ְ� �ۼ��ڿ� ������
%>
		<tr><td colspan="2">
			<input type="submit" value="����" name="BTN"/>
			<input type="submit" value="����" name="BTN"/></td></tr>
<%
		}
%>
	</table>
</form>
</div>
</section>





</body>
</html>