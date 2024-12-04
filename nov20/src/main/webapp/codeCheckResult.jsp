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
<h3 align="center">상품 코드 중복 검사 결과</h3>
<form action="codeCheck.do" name="frm">
	상품 코드: <input type="text" name="CODE" value="<%= code %>">
	<input type="submit" value="중복 검사">	
</form><br/>

<% if(dup == null) { %>
	<%= code %>는 사용 가능합니다. <input type="button" value="사용" onclick="codeOk()">
<% } else { %>
	<%= code %>는 이미 사용 중 입니다.
<% }%>

<script type="text/javascript">
function codeOk() {
	//팝업창에서 입력된 상품코드를 상품등록 폼으로 데이터 전송
	//즉, 자식jsp에서 부모jsp(opener)로 데이터 전송
	opener.document.fm.CODE.value = document.frm.CODE.value;
	opener.document.fm.CODE.readOnly = true;
	opener.document.fm.codeCheck.value = "YES"; //중복검사용 파라미터에 값넣기
	
	self.close();//팝업창 닫기
}
</script>

</body>
</html>