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
	if(result.equals("OK")){ 
%>
<script type="text/javascript">
	setTimeout(function(){ 
		alert("�Խñ��� ��ϵǾ����ϴ�.");
		location.href="imageList.do";
	},100); 
	//�Խñ� ����� ���
</script>
<%	} else if(result.equals("NOK")){ %>
<script type="text/javascript">
	alert("���ε尡 �����߽��ϴ�. ������ Ȯ���ϼ���.");
	location.href="imageList.do";//�Խñ� ����� ���
</script>
<%	} %>
</body>
</html>











