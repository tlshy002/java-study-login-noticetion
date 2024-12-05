<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="items.Items" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% Items dto = (Items)request.getAttribute("ITEM"); %>
<div align="center">
<h3>상품 상세 정보</h3>
<form action="" method="post" onsubmit="return check(this)">
<table>
	<tr><th>상품번호</th><td><%= dto.getItem_code() %></td></tr>
	<tr><th>상품이름</th>
		<td><input type="text" name="NAME" value="<%= dto.getItem_title() %>">
		</td></tr>
	<tr><th>원 산 지</th><td><%= dto.getNation() %></td></tr>
	<tr><th>등 록 일</th><td><%= dto.getReg_date() %></td></tr>
	<tr><th>상품설명</th><td><textarea rows="5" cols="60" name="SPEC">
		<%= dto.getItem_spec() %></textarea></td></tr>
	<tr><td colspan="2" align="center">
		<input type="submit" value="수정" name="BTN" >
		<input type="submit" value="삭제"></td></tr>
</table>
</form>
<script type="text/javascript">
function check(frm) {
	if(frm.NAME.value == '') { alert("상품이름을 입력하세요."); frm.NAME.focus(); return false; }
	if(frm.SPEC.value == '') { alert("상품설명을 입력하세요."); frm.SPEC.focus(); return false; }
	if( !confirm("정말로 작업을 진행하시겠습니까?")) return false;
}
</script>

</div>


</body>
</html>