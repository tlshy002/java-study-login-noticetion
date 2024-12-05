<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="items.Items, items.MadeIn, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% 
	Items dto = (Items)request.getAttribute("ITEM"); 
	ArrayList<MadeIn> list = (ArrayList<MadeIn>)request.getAttribute("NATIONS");
%>
<div align="center">
<h3>��ǰ �� ����</h3>
<form action="itemModify.do" method="post" onsubmit="return check(this)">
<input type="hidden" name="CODE" value="<%= dto.getItem_code() %>" >
<table>
	<tr><th>��ǰ��ȣ</th><td><%= dto.getItem_code() %></td></tr>
	<tr><th>��ǰ�̸�</th>
		<td><input type="text" name="NAME" value="<%= dto.getItem_title() %>">
		</td></tr>
	<tr><th>�� �� ��</th>
		<td><select name="NATION">
		<% 
			for(MadeIn nation : list) { 
				if(nation.getCode().equals(dto.getNation())) {
		%>
			<option value="<%= nation.getCode() %>" selected="selected"><%= nation.getName() %></option>
		<%
				} else {
		%>
			<option value="<%= nation.getCode() %>"><%= nation.getName() %></option>
		<% }} %>
		</select></td></tr>
	<tr><th>�� �� ��</th><td><%= dto.getReg_date() %></td></tr>
	<tr><th>��ǰ����</th><td><textarea rows="5" cols="60" name="SPEC"><%= dto.getItem_spec() %></textarea></td></tr>
	<tr><td colspan="2" align="center">
		<input type="submit" value="����" name="BTN" >
		<input type="submit" value="����" name="BTN"></td></tr>
</table>
</form>
<script type="text/javascript">
function check(frm) {
	if(frm.NAME.value == '') { alert("��ǰ�̸��� �Է��ϼ���."); frm.NAME.focus(); return false; }
	if(frm.SPEC.value == '') { alert("��ǰ������ �Է��ϼ���."); frm.SPEC.focus(); return false; }
	if( !confirm("������ �۾��� �����Ͻðڽ��ϱ�?")) return false;
}
</script>

</div>


</body>
</html>