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
<h3>이미지 게시글 상세보기</h3>
<form action="imageDelete.do" method="post" onsubmit="return check(this)">
	<input type="hidden" name="id" value="<%= dto.getW_id() %>" />
	<table>
		<tr><th>제 목</th><td><%= dto.getTitle() %></td></tr>
		<tr><th>작성자</th><td><%= dto.getWriter() %></td></tr>
		<tr><th>암 호</th><td><input type="password" name="PWD" /></td></tr>
		<tr><th>작성일</th><td><%= dto.getW_date() %></td></tr>
		<tr><th colspan="2" align="center"><img alt="" src="upload/<%= dto.getImagename() %>" width="250" height="200" /></th></tr>
		<tr><th>내 용</th><td><textarea rows="5" cols="60" readonly="readonly"><%= dto.getContent() %></textarea></td></tr>
		<tr><td colspan="2" align="center">
			<input type="submit" value="삭제" />
			<input type="reset" value="취소" /></td></tr>
				
	</table>
</form>
</div>
</body>
</html>