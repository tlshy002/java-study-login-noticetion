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
	
	String userId = (String)session.getAttribute("ID");
%>

<div align="center">
<h3>상품 목록</h3>
<table>
	<tr><td align="right"><%= startRow %> ~ <%= endRow %> / <%= total %></td></tr>
</table>
<table>
	<tr><th>상품코드</th><th>상품이름</th><th>상품가격</th><th>원산지</th><th>등록일</th><th>비 고</th></tr>
	<% for(Items item : list) { %>
	<tr><td><%= item.getItem_code() %></td>
		<td><a href="itemDetail.do?CODE=<%= item.getItem_code() %>"><%= item.getItem_title() %></a></td> <!-- 상품코드와 함께 서블릿으로 이동해야 서블릿에서 db조회가능 -->
		<td><%= item.getPrice() %></td>
		<td><%= item.getNation() %></td>
		<td><%= item.getReg_date() %></td>
	<% if(userId == null || ! userId.equals("admin")) { %>
		<td><a href="#" 
			onclick="window.open('addCart.do?CODE=<%= item.getItem_code() %>','_blank_','width=450,height=200,top=200,left=200')">장바구니 담기</a></td>
	<%	} %>
		</tr>
	<% 	} %>
</table>

<%	// 아래 하단 페이지네이션.
	int startPage = currentPage - (currentPage % 10 == 0 ? 10 : (currentPage % 10)) +1;
	int endPage = startPage + 9;
	
	if(endPage > pageCount) {
		endPage = pageCount;
	}
	if(startPage > 10) {
%>
	<a href="itemsList.do?PAGE_NUM<%= startPage - 1 %>">[이전]</a>
<%	}
	for(int i=startPage; i<=endPage; i++) {
		if(currentPage == i) {
%>
	<font size="6"> <% } %>
	<a href="itemsList.do?PAGE_NUM=<%= i %>"><%= i %></a>
	
	<% if(currentPage == i) { %>
	</font> <% } %>
	
<%	} 
	if(endPage < pageCount) { //끝페이지가 전체 페이지보다 작으면 [다음]버튼 생성
%>
	<a href="itemsList.do?PAGE_NUM<%= endPage + 1 %>">[다음]</a>
<% } %>

</div>

</body>
</html>