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
	
	String userId = (String)session.getAttribute("ID");
%>

<div align="center">
<h3>��ǰ ���</h3>
<table>
	<tr><td align="right"><%= startRow %> ~ <%= endRow %> / <%= total %></td></tr>
</table>
<table>
	<tr><th>��ǰ�ڵ�</th><th>��ǰ�̸�</th><th>��ǰ����</th><th>������</th><th>�����</th><th>�� ��</th></tr>
	<% for(Items item : list) { %>
	<tr><td><%= item.getItem_code() %></td>
		<td><a href="itemDetail.do?CODE=<%= item.getItem_code() %>"><%= item.getItem_title() %></a></td> <!-- ��ǰ�ڵ�� �Բ� �������� �̵��ؾ� �������� db��ȸ���� -->
		<td><%= item.getPrice() %></td>
		<td><%= item.getNation() %></td>
		<td><%= item.getReg_date() %></td>
	<% if(userId == null || ! userId.equals("admin")) { %>
		<td><a href="#" 
			onclick="window.open('addCart.do?CODE=<%= item.getItem_code() %>','_blank_','width=450,height=200,top=200,left=200')">��ٱ��� ���</a></td>
	<%	} %>
		</tr>
	<% 	} %>
</table>

<%	// �Ʒ� �ϴ� ���������̼�.
	int startPage = currentPage - (currentPage % 10 == 0 ? 10 : (currentPage % 10)) +1;
	int endPage = startPage + 9;
	
	if(endPage > pageCount) {
		endPage = pageCount;
	}
	if(startPage > 10) {
%>
	<a href="itemsList.do?PAGE_NUM<%= startPage - 1 %>">[����]</a>
<%	}
	for(int i=startPage; i<=endPage; i++) {
		if(currentPage == i) {
%>
	<font size="6"> <% } %>
	<a href="itemsList.do?PAGE_NUM=<%= i %>"><%= i %></a>
	
	<% if(currentPage == i) { %>
	</font> <% } %>
	
<%	} 
	if(endPage < pageCount) { //���������� ��ü ���������� ������ [����]��ư ����
%>
	<a href="itemsList.do?PAGE_NUM<%= endPage + 1 %>">[����]</a>
<% } %>

</div>

</body>
</html>