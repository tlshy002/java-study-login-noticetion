<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div align="right"><a href="index.jsp?BODY=userEntry.jsp">�����ϱ�</a></div>
<div align="center"></div>

	<form action="login.do" method="post" onsubmit="return check(this)">
	����: <input type="text" name="ID" size="10"><br/>
	��ȣ: <input type="password" name="PW" size="10"><br/><br/>
	<input type="submit" value="�α���"/>
	<input type="reset" value="�� ��"/>
	</form>

<script type="text/javascript">
function check(frm) {
	if(frm.ID.value == '') { alert("������ �Է��ϼ���."); frm.ID.focus(); return false; }
	if(frm.PW.value == '') { alert("��ȣ�� �Է��ϼ���."); frm.PW.focus(); return false; }
	
}
</script>
</body>
</html>