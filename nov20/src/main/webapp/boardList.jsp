<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, bbs.*" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<section>
<%
	ArrayList<BoardDTO> al = (ArrayList<BoardDTO>)request.getAttribute("BOARD");
	int pageCount = (int)request.getAttribute("PAGES");
%>
	<h3 align="center">�Խñ� ���</h3>
<div align="center">
	<table border="1">
		<tr><th>�ۼ���</th><th>�� ��</th><th>�ۼ���</th></tr>
		<%
		for(BoardDTO dto : al) {
		%>
		<tr><td><%= dto.getWriter() %></td>
			<!-- ��Ŀ�� ���� ���� ȣ���� doGet() �޼��尡 ����� -->
			<td><a href="boardDetail.do?TITLE=<%= dto.getTitle() %>"><%= dto.getTitle() %></a></td>
			<td><%= dto.getWrite_date() %> </td></tr>
		<%
		}
		%>
	</table>
	
<%
	for(int i=1; i <= pageCount; i++){
%>
	<a href=""><%= i %></a>
<%	} %>

</div>



</section>


</body>
</html>