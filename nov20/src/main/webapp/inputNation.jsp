<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h3>��ǰ ������ ���</h3>

<form action="" name="madeinfrm">
<table>
	<tr><th>�����ڵ�</th><td><input type="text" name="CODE">
							<input type="button" value="�ߺ� �˻�" onclick="codeCheck()"></td></tr>
	<tr><th>�����̸�</th><td><input type="text" name="NAME"></td></tr>
	<tr><td colspan="2" align="center"><input type="submit" value="������ ���">
										<input type="reset" value="�� ��"></td></tr>
</table>
</form>

<script type="text/javascript">
function codeCheck() {
	if(document.madeinfrm.CODE.value == '') {
		alert("�����ڵ带 �Է��ϼ���.");
		document.madeinfrm.CODE.focus(); return;
	}
	var url = "codeCheck.do?NCODE=" + document.madeinfrm.CODE.value;
	window.open(url, "_blank_", "width=550", "height=300");
}
</script>

</div>
</body>
</html>