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
		alert("게시글이 등록되었습니다.");
		location.href="imageList.do";
	},100); 
	//게시글 목록을 출력
</script>
<%	} else if(result.equals("NOK")){ %>
<script type="text/javascript">
	alert("업로드가 실패했습니다. 파일을 확인하세요.");
	location.href="imageList.do";//게시글 목록을 출력
</script>
<%	} %>
</body>
</html>











