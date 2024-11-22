<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="image.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	ImageBBS dto = (ImageBBS)request.getAttribute("DETAIL");
%>
<div align="center">
<h3>이미지 게시글 상세보기</h3>
<table>
	<tr><th>제 목</th><td><%= dto.getTitle() %></td></tr>
	<tr><th>작성자</th><td><%= dto.getWriter() %></td></tr>
	<tr><th>작성일</th><td><%= dto.getW_date() %></td></tr>
	<tr><td colspan="2" align="center"><img alt="" src="upload/<%= dto.getImagename() %>" width="250" height="200" /></td></tr>
	<tr><th>내 용</th><td><textarea rows="5" cols="60" readonly="readonly"><%= dto.getContent() %></textarea></td></tr>
	<tr><td colspan="2" align="center">
		<a href="">[답글]</a> 
		<a href="">[수정]</a> 
		<a href="javascript:goDelet()">[삭제]</a> <!-- 서블릿으로 바로 갈때 필요한 파라미터가 있으면 코드가 길어져서 파라미터 처리를 js를 거쳐서 처리한후 서블릿 가기를 해볼것임 -->
		<a href="">[목록]</a></td></tr> 
</table>
</div>

<!-- js 거쳐서 서블릿으로 보내기위해서는 form이 필요함 -->
<form name="frm" method="post">
	<input type="hidden" name="id" value="<%= dto.getW_id() %>">
</form> 
<script type="text/javascript">
function goDelet() {
	document.frm.action = "imageDelete.do"; //form의 action 채우기. 자바스크립트와 서블릿 매핑
	document.frm.submit(); //서블릿 호출
}
</script>

</body>
</html>