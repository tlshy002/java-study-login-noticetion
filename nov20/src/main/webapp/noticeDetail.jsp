<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="notice.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	NoticeDTO dto = (NoticeDTO)request.getAttribute("NOTICE");
	String id = (String)session.getAttribute("ID"); //���ǿ��� "ID"�� ���� ã��
%>
<h3 align="center">������ �󼼺���</h3>

<form action="noticeModify.do" method="post" onsubmit="return check()"> <!-- ���붧���� post ����ؾ���, onsubmit�� ture�̸� action�� ������-->
<input type="hidden" name="NO" value="<%= dto.getNum() %>"/>

<table>
		<tr><th>�۹�ȣ</th><td><%= dto.getNum() %></td></tr>
		<tr><th>�� ��</th><td><input type="text" name="TITLE" value="<%= dto.getTitle() %>"></td></tr>
		<tr><th>�ۼ���</th><td><%= dto.getWriter() %></td></tr>
		<tr><th>�ۼ���</th><td><%= dto.getNotice_date() %></td></tr>
		<tr><th>�� ��</th><td><textarea rows="5" cols="40" name="CONTENT"><%= dto.getContent() %></textarea></td></tr>
<%	if(id != null && id.equals("admin")) { %>		
	<tr><td colspan="2" align="center">
		<input type="submit" value="����" name="BTN"/>
		<input type="submit" value="����" name="BTN"/>
	</td></tr>
<% 	} %>

<script type="text/javascript">
function check() {
	if(! conform("������ �ش� �۾��� �����Ͻðڽ��ϱ�?")) return false;
}
</script>
		
</table>
</form>
</body>
</html>