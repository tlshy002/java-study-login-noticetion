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
<%	ImageBBS dto = (ImageBBS)request.getAttribute("IMAGE"); %>
<div align="center">
<form action="imageUpdateDo.do" method="post" enctype="multipart/form-data"
	onsubmit="return check(this)">
<input type="hidden" name="id" value="<%= dto.getW_id() %>"/>
<input type="hidden" name="pwd" value="<%= dto.getPassword() %>"/>
<input type="hidden" name="old_image" value="<%= dto.getImagename() %>"/>
<table>
	<tr><th>������</th><td><input type="text" name="TITLE" value="<%= dto.getTitle() %>"/>
		</td></tr>
	<tr><th>�ۼ���</th><td><%= dto.getWriter() %></td></tr>
	<tr><th>�ۼ���</th><td><%= dto.getW_date() %></td></tr>
	<tr><th>�� ȣ</th><td><input type="password" name="PWD"/></td></tr>
	<tr><td colspan="2" align="center"><input type="file" name="image_name"/><br/>
		<img alt="" src="upload/<%= dto.getImagename() %>" width="250" height="200"/></td></tr>
	<tr><th>�� ��</th><td><textarea rows="5" cols="60" 
		name="CONTENT"><%= dto.getContent() %></textarea></td></tr>
	<tr><td colspan="2" align="center"><input type="submit" value="����"/>
		<input type="reset" value="���"/></td></tr>
</table>
</form>
<script type="text/javascript">
function check(frm){
	if(frm.TITLE.value == ''){
		alert("������ �Է��ϼ���."); frm.TITLE.focus(); return false;
	}
	if(frm.PWD.value == ''){
		alert("��ȣ�� �Է��ϼ���."); frm.PWD.focus(); return false;
	}else {
		if(frm.pwd.value != frm.PWD.value){//�Է��� ��ȣ�� DB�� ��ȣ�� ��ġ���� �ʴ� ���
			alert("��ȣ�� ��ġ���� �ʽ��ϴ�. ��ȣ�� Ȯ���ϼ���."); frm.PWD.focus(); return false;
		}
	}
	if(frm.CONTENT.value == ''){
		alert("������ �Է��ϼ���."); frm.CONTENT.focus(); return false;
	}
	if( ! confirm("������ �����Ͻðڽ��ϱ�?")) return false;
}
</script>
</div>
</body>
</html>