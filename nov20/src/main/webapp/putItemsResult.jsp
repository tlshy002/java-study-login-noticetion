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
	String result = request.getParameter("R");
	if(result.equals("OK")) {
%>
<script type="text/javascript">
	setTimeout(function() { alert("��ǰ������ ��ϵǾ����ϴ�."); }, 100);
</script>
<% } else { %>
<script type="text/javascript">
	setTimeout(function() { alert("��ǰ������ ��ϵ��� �ʾҽ��ϴ�. �����ڿ��� ���ǹٶ��ϴ�."); }, 100);
</script>
<% } %>

</body>
</html>