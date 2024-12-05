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
	setTimeout(() => {
		alert("작업이 성공적으로 수행되었습니다.");
	}, 100);
</script>
<%	} else { %>
<script type="text/javascript">
	setTimeout(function() {
		alert("작업이 수행되지 않았습니다. 관리자에게 문의바랍니다.");
	}, 100);
</script>
<%	} %>
</body>
</html>