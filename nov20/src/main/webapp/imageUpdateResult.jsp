<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%	String result = request.getParameter("R");
	if(result.equals("OK")){ %>
<script type="text/javascript">
	setTimeout(function(){
		alert("�Խñ��� ����Ǿ����ϴ�.");
		location.href="imageList.do";
	},100);
</script>
<%	} else { %>
<script type="text/javascript">
	setTimeout(function(){
		alert("�Խñ��� ������� �ʾҽ��ϴ�. �����ڿ��� ���� �ٶ��ϴ�.");
		location.href="imageList.do";
	},100);
</script>
<%	} %>
</body>
</html>











