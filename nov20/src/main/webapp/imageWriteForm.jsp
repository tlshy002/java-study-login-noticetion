<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>�̹��� �Խñ� �ۼ�</h2>
	<form action="imageWrite.do" method="post" enctype="multipart/form-data"
			onsubmit="return check(this)"> <!-- this: ������ ��ü�� form�� �ǹ��� -->
	<table>
		<tr><th>�� ��</th><td><input type="text" name="TITLE" value="������ �Է��ϼ���"/></td></tr>
		<tr><th>�� ȣ</th><td><input type="password" name="PWD"/></td></tr>
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
		}
		if(frm.PWD.value == ''){
			alert("��ȣ�� �Է��ϼ���");
			frm.PWD.focus();
			return false;
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
		}
		if( !confirm("������ ���� �ø��ðڽ��ϱ�?")) return false;

	
}
</script>

</body>
</html>