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


<form action="putItems.do" method="post" onsubmit="return check(this)" name="fm">
<input type="hidden" name="codeCheck" />
<table>
	<tr><th>��ǰ �ڵ�</th><td><input type="text" name="CODE"><input type="button" value="�ߺ� �˻�" 
		onclick="itemCodeCheck()"/></td></tr>
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

<script type="text/javascript">

function itemCodeCheck(){
	if(document.fm.CODE.value == ''){
		alert("��ǰ�ڵ带 �Է��ϼ���."); document.fm.CODE.focus(); return;
	}
	var url = "codeCheck.do?CODE="+document.fm.CODE.value;
	window.open(url,"_blank_","width=550, height=300");
}

function check(myfrm) {
	//�ߺ��˻縦 ���� ��� alert �˸�â ����
	if(myfrm.codeCheck.value == '') {
		alert("��ǰ�ڵ� �ߺ��˻縦 ���ּ���."); return false;
	}
	if(myfrm.NAME.value == '') {
		alert("��ǰ�̸��� �Է��ϼ���.");
		myfrm.NAME.focus(); return false;
	} else {
		if(myfrm.NAME.value.lenth > 10) {
			alert("��ǰ�̸��� 10�� �̳��� �Է��ϼ���.");
			myfrm.NAME.focus(); return false;
		}
	}
	
	if(myfrm.PRICE.value == '') {
		alert("��ǰ������ �Է��ϼ���.");
		myfrm.PRICE.focus(); return false;
	} else {
		if(isNaN(myfrm.PRICE.value)) {
			alert("��ǰ������ ���ڷ� �Է��ϼ���.");
			myfrm.PRICE.focus(); return false;
		} else {
			if(myfrm.PRICE.value <= 0) {
				alert("��ǰ������ 0���� Ŀ���մϴ�.");
				myfrm.PRICE.focus(); return false;
			}
		}
	}
	
	if(myfrm.SPEC.value == '') {
		alert("��ǰ������ �Է��ϼ���.");	myfrm.SPEC.focus(); return false;
	} else {
		if(myfrm.SPEC.value.length > 50) {
			alert("��ǰ������ 50�� �̳��� �Է��ϼ���.");	myfrm.SPEC.focus(); return false;
		}
	}
	
	if(! confirm("������ ����Ͻðڽ��ϱ�?")) return false;
	
}
</script>

</body>
</html>