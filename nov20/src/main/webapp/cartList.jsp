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
<h3>��ٱ��� ���</h3>
<% 
	ArrayList<Items> cartList = (ArrayList<Items>)request.getAttribute("CARTLIST");
	if(cartList == null) {
%>
	<h3>��ٱ��ϰ� ����ֽ��ϴ�.</h3>
<%	} else { %>
<table>
	<tr><th>��ǰ�ڵ�</th><th>��ǰ�̸�</th><th>�� ��</th><th>��ǰ����</th><th>�� ��</th><th>����/����</th></tr>
<%	for(Items item : cartList){ %>
	<form action="cartModify.do" method="post" onsubmit="return check()">
	<input type="hidden" name="CODE" value="<%= item.getItem_code() %>" />
	<tr><td><%= item.getItem_code() %></td><td><%= item.getItem_title() %></td>
		<td><%= item.getPrice() %>��</td><td><%= item.getNum() %></td>
		<td><%= item.getSum() %></td>
		<td><input type="submit" value="����" name="BTN"><input type="submit" value="����" name="BTN"></td></tr>
	</form>
<%	} %>
</table>
<script type="text/javascript">
function check() {
	if( ! confirm("������ �����Ͻðڽ��ϱ�?")) return false;
}
</script>

<%	int total = (int)request.getAttribute("TOTAL"); %>
<form action="">
	�� �� : <%= total %>�� <input type="submit" value="�����ϱ�"/>
</form>
<%	} %>

</div>
</body>
</html>