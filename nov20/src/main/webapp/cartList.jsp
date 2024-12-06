<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, items.*" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<div align="center">
<h3>장바구니 목록</h3>
<% 
	ArrayList<Items> cartList = (ArrayList<Items>)request.getAttribute("CARTLIST");
	if(cartList == null) {
%>
	<h3>장바구니가 비어있습니다.</h3>
<%	} else { %>
<table>
	<tr><th>상품코드</th><th>상품이름</th><th>가 격</th><th>상품개수</th><th>소 계</th><th>수정/삭제</th></tr>
<%	for(Items item : cartList){ %>
	<form action="cartModify.do" method="post" onsubmit="return check()">
	<input type="hidden" name="CODE" value="<%= item.getItem_code() %>" />
	<tr><td><%= item.getItem_code() %></td><td><%= item.getItem_title() %></td>
		<td><%= item.getPrice() %>원</td><td><%= item.getNum() %></td>
		<td><%= item.getSum() %></td>
		<td><input type="submit" value="수정" name="BTN"><input type="submit" value="삭제" name="BTN"></td></tr>
	</form>
<%	} %>
</table>
<script type="text/javascript">
function check() {
	if( ! confirm("정말로 진행하시겠습니까?")) return false;
}
</script>

<%	int total = (int)request.getAttribute("TOTAL"); %>
<form action="">
	총 계 : <%= total %>원 <input type="submit" value="결제하기"/>
</form>
<%	} %>

</div>
</body>
</html>