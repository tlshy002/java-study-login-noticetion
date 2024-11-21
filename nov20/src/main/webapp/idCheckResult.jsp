<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2 align="center">계정 중복 확인</h2>
	<% 
		String id = (String)request.getAttribute("ID"); 
		String dup = (String)request.getAttribute("DUP"); 
	%>
	
	<form action="idCheck.do">
	계 정 : <input type="text" name="ID" value="<%= id %>"/>
			<input type="submit" value="중복검사"/>
	</form>
	<% if(dup == null) { %>
		<%= id %>는 사용 가능합니다. <input type="button" value="사용" onclick="idOk('<%= id %>')"/>
	<% } else { %>
		<%= id %>는 사용 중입니다.
		<script type="text/javascript">
			opener.document.frm.ID.value = ""; //폼에 입력되어있던 id 지우기
		</script>
	<% } %>
	<script type="text/javascript">
	function idOk(userId){
		opener.document.frm.ID.value = userId;
		opener.document.frm.ID.readOnly = true; //편집이 안되도록 속성을 readOnly로 변경
		opener.document.frm.idChecked.value = "yes"; //ID중복 검사용 파라미터에 값넣기
		self.close(); //self는 window객체로 여기서는 팝업창을 의미함
	}
	</script>
</body>
</html>