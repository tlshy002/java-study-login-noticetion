<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String code = (String)request.getAttribute("CODE");
	String dup = (String)request.getAttribute("DUP");
%>
<h3 align="center">��ǰ �ڵ� �ߺ� �˻� ���</h3>
<form action="codeCheck.do" name="frm">
	��ǰ �ڵ�: <input type="text" name="CODE" value="<%= code %>">
	<input type="submit" value="�ߺ� �˻�">	
</form><br/>

<% if(dup == null) { %>
	<%= code %>�� ��� �����մϴ�. <input type="button" value="���" onclick="codeOk()">
<% } else { %>
	<%= code %>�� �̹� ��� �� �Դϴ�.
<% }%>

<script type="text/javascript">
function codeOk() {
	//�˾�â���� �Էµ� ��ǰ�ڵ带 ��ǰ��� ������ ������ ����
	//��, �ڽ�jsp���� �θ�jsp(opener)�� ������ ����
	opener.document.fm.CODE.value = document.frm.CODE.value;
	opener.document.fm.CODE.readOnly = true;
	opener.document.fm.codeCheck.value = "YES"; //�ߺ��˻�� �Ķ���Ϳ� ���ֱ�
	
	self.close();//�˾�â �ݱ�
}
</script>

</body>
</html>