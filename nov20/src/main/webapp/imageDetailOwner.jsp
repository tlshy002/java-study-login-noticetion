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
<h3>�̹��� �Խñ� �󼼺���</h3>
<table>
	<tr><th>�� ��</th><td><%= dto.getTitle() %></td></tr>
	<tr><th>�ۼ���</th><td><%= dto.getWriter() %></td></tr>
	<tr><th>�ۼ���</th><td><%= dto.getW_date() %></td></tr>
	<tr><td colspan="2" align="center"><img alt="" src="upload/<%= dto.getImagename() %>" width="250" height="200" /></td></tr>
	<tr><th>�� ��</th><td><textarea rows="5" cols="60" readonly="readonly"><%= dto.getContent() %></textarea></td></tr>
	<tr><td colspan="2" align="center">
		<a href="">[���]</a> 
		<a href="">[����]</a> 
		<a href="javascript:goDelet()">[����]</a> <!-- �������� �ٷ� ���� �ʿ��� �Ķ���Ͱ� ������ �ڵ尡 ������� �Ķ���� ó���� js�� ���ļ� ó������ ���� ���⸦ �غ����� -->
		<a href="">[���]</a></td></tr> 
</table>
</div>

<!-- js ���ļ� �������� ���������ؼ��� form�� �ʿ��� -->
<form name="frm" method="post">
	<input type="hidden" name="id" value="<%= dto.getW_id() %>">
</form> 
<script type="text/javascript">
function goDelet() {
	document.frm.action = "imageDelete.do"; //form�� action ä���. �ڹٽ�ũ��Ʈ�� ���� ����
	document.frm.submit(); //���� ȣ��
}
</script>

</body>
</html>