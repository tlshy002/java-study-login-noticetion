<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3 align="center">���� ���� �Է�</h3>
	<form action="register.do" method="post" onsubmit="return check(this)" name="frm">
	<input type="hidden" name="idChecked"> <!-- �ߺ��˻� ������ Ȯ���ϱ� ���� �Ķ���� �ۼ� -->
	<table>
		<tr><th>�� ��</th><td><input type="text" name="ID"/>
			<input type="button" value="�ߺ��˻�" onclick="idCheck()"/></td></tr>
		<tr><th>�� ��</th><td><input type="text" name="NAME"/></td></tr>
		<tr><th>�� ��</th><td><input type="text" name="ADDR"/></td></tr>
		<tr><th>����ó</th><td><input type="text" name="PHONE"/></td></tr>
		<tr><th>�� ȣ</th><td><input type="password" name="PW"/></td></tr>
		<tr><th>��ȣȮ��</th><td><input type="password" name="CONFTRM"/></td></tr>
		<tr><th>�� ��</th><td>��<input type="radio" name="GENDER" value="M"/>,
						��<input type="radio" name="GENDER" value="F"/></td></tr>
		<tr><th>�̸���</th><td><input type="text" name="EMAIL"/></td></tr>
		<tr><th>�� ��</th><td><input type="date" name="BIRTH"/></td></tr>
		<tr><th>�� ��</th><td>
			<select name="JOB"><option>---�����ϼ���---</option>
				<option>�� ��</option><option>ȸ���</option><option>�� ��</option>
				<option>�ڿ���</option><option>�� Ÿ</option>
			</select>
		<tr><td colspan="2" align="center"><input type="submit" value="�����ϱ�"/>
			<input type="reset" value="�� ��">
	</table><br/>
	</form>
<script type="text/javascript">

function check() {
	if(frm.ID.value == '') {
		alert("������ �Է��ϼ���.");
		frm.ID.focus();		return false;
	}
	if(frm.idChecked.value == '') {
		alert("ID �ߺ��˻縦 �ؾ��մϴ�."); return false;
	}
	
	alert()
	if(frm.NAME.value == '') {
		alert("�̸��� �Է��ϼ���."); return false;
	}

	
}

function idCheck() {
	if(document.frm.ID.value == '') {
		alert("������ �Է��ϼ���.");
		document.frm.ID.focus();
		return false; 
	}
	
	var url = "idCheck.do?ID="+document.frm.ID.value;
	window.open(url, "_blank_", "width=450, height=200")
	
}
</script>

</body>
</html>