<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="items.*, java.util.*" %>
<!-- dto와 ArrayList 를 사용하기 때문에 page import 필요 -->
 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	int startRow = (int)request.getAttribute("startRow");
	int endRow = (int)request.getAttribute("endRow");
	int total = (int)request.getAttribute("total");
	int pageCount = (int)request.getAttribute("pageCount");
	int currentPage = (int)request.getAttribute("currentPage");
	ArrayList<Items> list = (ArrayList<Items>)request.getAttribute("ITEMS");
%>

<div align="center">
<h3>상품 목록</h3>
<table>
	<tr><td align="right"><%= startRow %> ~ <%= endRow %> / <%= total %></td></tr>
</table>
<table>
	<tr><th>상품코드</th><th>상품이름</th><th>상품가격</th><th>원산지</th><th>등록일</th><th>비 고</th></tr>
	<% for(Items item : list) { %>
	<tr><td><%= item.getItem_code() %></td><td><%= item.getItem_title() %></td>
		<td><%= item.getPrice() %></td><td><%= item.getNation() %></td>
		<td><%= item.getReg_date() %></td><td><a href="">장바구니 담기</a></td></tr>
	<% } %>
</table>
</div>

</body>
</html>