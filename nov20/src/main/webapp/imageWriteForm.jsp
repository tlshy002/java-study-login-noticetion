<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="image.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	ImageBBS dto = (ImageBBS)request.getAttribute("imageBBS");
	String title = (String)request.getAttribute("title");
%>
	<h3 align="center">�̹��� �Խñ� �ۼ�</h3>
	<form action="imageWrite.do" method="post" enctype="multipart/form-data"
			onsubmit="return check(this)"> <!-- this: ������ ��ü�� form�� �ǹ��� -->

<% if(dto != null) { %>
	<input type="hidden" name="orderno" value="<%= dto.getOrder_no() + 1 %>" />
<% } if(dto != null && dto.getGroup_id() != 0) { %>
	<input type="hidden" name="groupid" value="<%= dto.getGroup_id() %>" />
<% } if(dto != null && dto.getParent_id() != 0) { %>	
	<input type="hidden" name="parentid" value="<%= dto.getParent_id() %>" />
<% } %>
	<table>
		<tr><th>�� ��</th><td><input type="text" name="TITLE" value="<%=  title %>" placeholder="������ �Է��ϼ���"/></td></tr>
		<tr><th>�� ȣ</th><td><input type="password" name="PW"/></td></tr>
		<tr><th>�̹���</th><td><input type="file" name="IMAGENAME"/></td></tr>
		<tr><th>�� ��</th><td><textarea rows="8" cols="40" name="CONTENT"></textarea></td></tr>
		<tr><td colspan="2" align="center"><input type="submit" value="�� �ø���"/>
			<input type="reset" value="�� ��" /> </td></tr>
	</table>
	</form>
<script type="text/javascript">
function check(frm) {

		if(frm.TITLE.value == '') {
			alert("������ �Է��ϼ���");
			frm.TITLE.focus();
			return false;
		} else {
			if(frm.TITLE.value.length > 20) {
				alert("������ 20�� �̳��� �Է��ϼ���."); frm.TITLE.focus(); return false;
			}
		}
		
		if(frm.PW.value == ''){
			alert("��ȣ�� �Է��ϼ���");
			frm.PW.focus();
			return false;
		} else {
			if(frm.PW.value.length > 20) {
				alert("��ȣ�� 20�� �̳��� �Է��ϼ���."); frm.PW.focus(); return false;
			}
		}
		
		if(frm.IMAGENAME.value == '') {
			alert("�̹��� ������ �����ϼ���");
			frm.IMAGENAME.focus();
			return false;
		} 
		
		if(frm.CONTENT.value == '') {
			alert("������ �Է��ϼ���");
			frm.CONTENT.focus();
			return false;
		} else {
			if(frm.CONTENT.value.length > 50) {
				alert("������ 50�� �̳��� �Է��ϼ���."); frm.CONTENT.focus(); return false;
			}
		}
		
		if( !confirm("������ ���� �ø��ðڽ��ϱ�?")) return false;

	
}
</script>

</body>
</html>