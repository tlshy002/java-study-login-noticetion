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
	<% 
		String id = (String)request.getAttribute("ID"); 
		String dup = (String)request.getAttribute("DUP"); 
	%>
	
	<form action="idCheck.do">
	�� �� : <input type="text" name="ID" value="<%= id %>"/>
			<input type="submit" value="�ߺ��˻�"/>
	</form>
	<% if(dup == null) { %>
		<%= id %>�� ��� �����մϴ�. <input type="button" value="���" onclick="idOk('<%= id %>')"/>
	<% } else { %>
		<%= id %>�� ��� ���Դϴ�.
		<script type="text/javascript">
			opener.document.frm.ID.value = ""; //���� �ԷµǾ��ִ� id �����
		</script>
	<% } %>
	<script type="text/javascript">
	function idOk(userId){
		opener.document.frm.ID.value = userId;
		opener.document.frm.ID.readOnly = true; //������ �ȵǵ��� �Ӽ��� readOnly�� ����
		opener.document.frm.idChecked.value = "yes"; //ID�ߺ� �˻�� �Ķ���Ϳ� ���ֱ�
		self.close(); //self�� window��ü�� ���⼭�� �˾�â�� �ǹ���
	}
	</script>
</body>
</html>