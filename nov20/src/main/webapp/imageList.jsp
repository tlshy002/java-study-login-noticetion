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
		<td><%= dto.getWriter() %></td>
		<td><%= dto.getW_date() %></td></tr>
	<% } %>
</table>

<%
	int currentPage = (int)request.getAttribute("currentPage");
	int pageCount = (int)request.getAttribute("pageCount");
	
	// 아래 하단 페이지네이션.
	int startPage = currentPage - (currentPage % 10 == 0 ? 10 : (currentPage % 10)) +1;
	int endPage = startPage + 9;
	
	if(endPage > pageCount) {
		endPage = pageCount;
	}
	if(startPage > 10) {
%>
	<a href="imageList.do?PAGE_NUM<%= startPage - 1 %>">[이전]</a>
<%	}
	for(int i=startPage; i<=endPage; i++) {
%>
	<a href="imageList.do?PAGE_NUM=<%= i %>"><%= i %></a>
<%	} 
	if(endPage < pageCount) { //끝페이지가 전체 페이지보다 작으면 [다음]버튼 생성
%>
	<a href="imageList.do?PAGE_NUM<%= endPage + 1 %>">[다음]</a>
<% } %>

</div>

</body>
</html>