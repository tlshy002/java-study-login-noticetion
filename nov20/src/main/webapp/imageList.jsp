<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, image.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	int start = (Integer)request.getAttribute("START");
	int end = (Integer)request.getAttribute("END");
	int total = (Integer)request.getAttribute("TOTAL");
	ArrayList<ImageBBS> list = (ArrayList<ImageBBS>)request.getAttribute("LIST");
%>
<div align="center">
<h3>�̹��� �Խñ� ���</h3>
<table width="100%">
	<tr><td align="right"><%= start %>~<%= end %>/<%= total %></td></tr>
</table>
<table>
	<tr><th>�̹���</th><th>�۹�ȣ</th><th>�� ��</th><th>�ۼ���</th><th>�ۼ���</th></tr>
	<% for(ImageBBS dto : list) { %>
	<tr><td><img alt="" src="upload/<%= dto.getImagename() %>" width="50" height="50"/></td>
	
		<td><%= dto.getW_id() %></td>
		<td><a href="imageDetail.do?ID=<%= dto.getW_id() %>"><%= dto.getTitle() %></a></td>
		<td><%= dto.getWriter() %></td>
		<td><%= dto.getW_date() %></td></tr>
	<% } %>
</table>

<%
	int currentPage = (int)request.getAttribute("currentPage");
	int pageCount = (int)request.getAttribute("pageCount");
	
	// �Ʒ� �ϴ� ���������̼�.
	int startPage = currentPage - (currentPage % 10 == 0 ? 10 : (currentPage % 10)) +1;
	int endPage = startPage + 9;
	
	if(endPage > pageCount) {
		endPage = pageCount;
	}
	if(startPage > 10) {
%>
	<a href="imageList.do?PAGE_NUM<%= startPage - 1 %>">[����]</a>
<%	}
	for(int i=startPage; i<=endPage; i++) {
%>
	<a href="imageList.do?PAGE_NUM=<%= i %>"><%= i %></a>
<%	} 
	if(endPage < pageCount) { //���������� ��ü ���������� ������ [����]��ư ����
%>
	<a href="imageList.do?PAGE_NUM<%= endPage + 1 %>">[����]</a>
<% } %>

</div>

</body>
</html>