<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2 align="center">���� �ߺ� Ȯ��</h2>
	<% String id = request.getParameter("ID"); %>
	<form action="">
	�� �� : <input type="text" name="ID" value="<%= id %>"/>
		<input type="submit" value="�ߺ��˻�"/>
	</form>
	<%= id %>�� ��� �����մϴ�. <input type="button" value="���" onclick="idOk()"/>
	<script type="text/javascript">
	function idOk(){
		self.close();
	}
	</script>
</body>
</html>