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
<h3>상품 등록</h3>


<form action="putItems.do" method="post" onsubmit="return check(this)" name="fm">
<input type="hidden" name="codeCheck" />
<table>
	<tr><th>상품 코드</th><td><input type="text" name="CODE"><input type="button" value="중복 검사" 
		onclick="itemCodeCheck()"/></td></tr>
	<tr><th>상품 이름</th><td><input type="text" name="NAME"></td></tr>
	<tr><th>가 격</th><td><input type="text" name="PRICE"></td></tr>
	<tr><th>원산지</th><td><select name="NATION">
	<% for(MadeIn nation : nations) { %>
		<option value="<%= nation.getCode()%>"> <%= nation.getName() %> </option>
	<% } %>
	</select></td></tr>
	<tr><th>상품 설명</th><td><textarea rows="4" cols="50" name="SPEC"></textarea></td></tr>
	<tr><td colspan="2" align="center"><input type="submit" value="상품 등록"/>
		<input type="reset" value="취 소"/></td></tr>
</table>
</form>
</div>

<script type="text/javascript">

function itemCodeCheck(){
	if(document.fm.CODE.value == ''){
		alert("상품코드를 입력하세요."); document.fm.CODE.focus(); return;
	}
	var url = "codeCheck.do?CODE="+document.fm.CODE.value;
	window.open(url,"_blank_","width=550, height=300");
}

function check(myfrm) {
	//중복검사를 안한 경우 alert 알림창 띄우기
	if(myfrm.codeCheck.value == '') {
		alert("상품코드 중복검사를 해주세요."); return false;
	}
	if(myfrm.NAME.value == '') {
		alert("상품이름을 입력하세요.");
		myfrm.NAME.focus(); return false;
	} else {
		if(myfrm.NAME.value.lenth > 10) {
			alert("상품이름은 10자 이내로 입력하세요.");
			myfrm.NAME.focus(); return false;
		}
	}
	
	if(myfrm.PRICE.value == '') {
		alert("상품가격을 입력하세요.");
		myfrm.PRICE.focus(); return false;
	} else {
		if(isNaN(myfrm.PRICE.value)) {
			alert("상품가격은 숫자로 입력하세요.");
			myfrm.PRICE.focus(); return false;
		} else {
			if(myfrm.PRICE.value <= 0) {
				alert("상품가격은 0보다 커야합니다.");
				myfrm.PRICE.focus(); return false;
			}
		}
	}
	
	if(myfrm.SPEC.value == '') {
		alert("상품설명을 입력하세요.");	myfrm.SPEC.focus(); return false;
	} else {
		if(myfrm.SPEC.value.length > 50) {
			alert("상품설명은 50자 이내로 입력하세요.");	myfrm.SPEC.focus(); return false;
		}
	}
	
	if(! confirm("정말로 등록하시겠습니까?")) return false;
	
}
</script>

</body>
</html>