<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="items.*, java.util.*" %>
<!-- dto�� ArrayList �� ����ϱ� ������ page import �ʿ� -->
 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	int startRow = (int)request.getAttribute("startRow");
	int endRow = (int)request.getAttribute("endRow");
	int total = (int)request.getAttribute("total");
	int pageCount = (int)request.getAttribute("pageCount");
	int currentPage = (int)request.getAttribute("currentPage");
	ArrayList<Items> list = (ArrayList<Items>)request.getAttribute("ITEMS");
%>

<div align="center">
<h3>��ǰ ���</h3>
<table>
	<tr><td align="right"><%= startRow %> ~ <%= endRow %> / <%= total %></td></tr>
</table>
<table>
	<tr><th>��ǰ�ڵ�</th><th>��ǰ�̸�</th><th>��ǰ����</th><th>������</th><th>�����</th><th>�� ��</th></tr>
	<% for(Items item : list) { %>
	<tr><td><%= item.getItem_code() %></td><td><%= item.getItem_title() %></td>
		<td><%= item.getPrice() %></td><td><%= item.getNation() %></td>
		<td><%= item.getReg_date() %></td><td><a href="">��ٱ��� ���</a></td></tr>
	<% } %>
</table>
</div>

</body>
</html>