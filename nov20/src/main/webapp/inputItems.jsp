<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="items.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% ArrayList<MadeIn> nations = (ArrayList<MadeIn>)request.getAttribute("NATIONS"); %>

<div align="center">
<h3>��ǰ ���</h3>

<script type="text/javascript">
function codeCheck(){
	if(document.fm.CODE.value == ''){
		alert("��ǰ�ڵ带 �Է��ϼ���."); document.fm.focus(); return;
	}
	var url = "codeCheck.do?CODE="+document.fm.CODE.value;
	window.open(url,"_blank_","width=550, height=300");
}
</script>

<form action="putItems.do" method="post" onsubmit="return check(this)" name="fm">
<table>
	<tr><th>��ǰ �ڵ�</th><td><input type="text" name="CODE"><input type="button" value="�ߺ� �˻�" onclick="codeCheck()"/></td></tr>
	<tr><th>��ǰ �̸�</th><td><input type="text" name="NAME"></td></tr>
	<tr><th>�� ��</th><td><input type="text" name="PRICE"></td></tr>
	<tr><th>������</th><td><select name="NATION">
	<% for(MadeIn nation : nations) { %>
		<option value="<%= nation.getCode()%>"> <%= nation.getName() %> </option>
	<% } %>
	</select></td></tr>
	<tr><th>��ǰ ����</th><td><textarea rows="4" cols="50" name="SPEC"></textarea></td></tr>
	<tr><td colspan="2" align="center"><input type="submit" value="��ǰ ���"/>
		<input type="reset" value="�� ��"/></td></tr>
	
	
</table>
</form>
</div>

</body>
</html>