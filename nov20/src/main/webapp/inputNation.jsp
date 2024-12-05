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
<h3>상품 원산지 등록</h3>

<form action="" name="madeinfrm">
<table>
	<tr><th>국가코드</th><td><input type="text" name="CODE">
							<input type="button" value="중복 검사" onclick="codeCheck()"></td></tr>
	<tr><th>국가이름</th><td><input type="text" name="NAME"></td></tr>
	<tr><td colspan="2" align="center"><input type="submit" value="원산지 등록">
										<input type="reset" value="취 소"></td></tr>
</table>
</form>

<script type="text/javascript">
function codeCheck() {
	if(document.madeinfrm.CODE.value == '') {
		alert("국가코드를 입력하세요.");
		document.madeinfrm.CODE.focus(); return;
	}
	var url = "codeCheck.do?NCODE=" + document.madeinfrm.CODE.value;
	window.open(url, "_blank_", "width=550", "height=300");
}
</script>

</div>
</body>
</html>