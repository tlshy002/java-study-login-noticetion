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
<h3>이미지 게시글 목록</h3>
<table width="100%">
	<tr><td align="right"><%= start %>~<%= end %>/<%= total %></td></tr>
</table>
<table>
	<tr><th>이미지</th><th>글번호</th><th>제 목</th><th>작성자</th><th>작성일</th></tr>
	<% for(ImageBBS dto : list) { %>
	<tr><td><img alt="" src="upload/<%= dto.getImagename() %>" width="50" height="50"/></td>
	
		<td><%= dto.getW_id() %></td>
		<td><a href="imageDetail.do?ID=<%= dto.getW_id() %>"><%= dto.getTitle() %></a></td>
		<td><%= dto.getTitle() %></td>
		<td><%= dto.getWriter() %></td>
		<td><%= dto.getW_date() %></td></tr>
	<% } %>
</table>
</div>

</body>
</html>