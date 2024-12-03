<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style type="text/css">
table{ width: 90%; height: 90%; border: 1px solid blue; background-color: orange;
		border-collapse: collapse; margin-left: 20px; margin-right: 20px;
}
td.main { width: 30%; border: 1px solid green; }
#menu { margin-left: 10px; margin-top: 10px; margin-right: 10px; 
		background-color: lightgreen; width: 90%; border: 1px dashed red; }
#login { margin-left: 10px; margin-top: 10px; width: 90%; background-color: yellow;
		border: 1px dashed orange; }	
#content { background-color: wheat; }

</style>
</head>


<body onload="startClock()">
<header>
	<div align="center"><img alt="" src="logo.gif"></div>
</header>
	
<section>
<%
	String body = request.getParameter("BODY");
	String id = (String)session.getAttribute("ID");
%>
	<table id="body">
		<tr>
			<td width="40%" height="300px" class="main">
				<div id="login">			
				<% if(id != null) { %>
					<jsp:include page="logout.jsp"/>
				<% } else { %>	
					<jsp:include page="login.jsp"/>
				<% } %>
				</div>
				<div id="menu">
					<a href="index.jsp">■ 홈으로</a><br/>
					<a href="boardList.do">■ 게시글 보기</a><br>
					<a href="bbsLoginCheck.do">■ 게시글 쓰기</a><br>
					
					<a href="">■ 상품 보기</a><br>
				<% if(id != null && id.equals("admin")) { %>
					<a href="findNation.do">■ 상품 등록</a><br>
				<% } %>					
					<a href="index.jsp?BODY=imageWriteForm.jsp">■ 이미지 및 답글 게시글 쓰기</a><br>
					<a href="imageList.do">■ 이미지 및 답글 게시글 보기</a><br>
					
					
					<a href="noticeList.do">■ 공지사항 보기</a><br>
					<% if(id != null && id.equals("admin")) { %>
						<a href="index.jsp?BODY=notice_input.jsp">■ 공지사항 쓰기</a><br>
					<% } %>
				</div>			
			</td>
			<td id="content">
			<%	if(body != null){ %>
				<jsp:include page="<%= body %>"/>
			<%	} else { %>
				<jsp:include page="intro.jsp"/>
			<%	} %>
			</td>
		</tr>	
	</table>
</section>

<script type="text/javascript">

function startClock() {
	workingClock(); //현재 시간을 보여주는 시계호출
	setInterval(workingClock, 1000); //1초간격으로 workingClock() 계속 호출
}
function workingClock() {
	var today = new Date();
	var days = ["일","월","화","수","목","금","토"];
	var year = today.getFullYear();
	var month = today.getMonth() + 1;
	var date = today.getDate();
	var hour = today.getHours();
	var min = today.getMinutes();
	var sec = today.getSeconds();

	if(month < 10) month = "0" + month;
	if(date < 10) date = "0" + date;
	if(hour < 10) hour = "0" + hour;
	if(min < 10) min = "0" + min;
	if(sec < 10) sec = "0" + sec;
	
	var index = today.getDay(); //0~6출력 
	var day = days[index]; //요일을 변수에 담기
	var str = year+"/"+month+"/"+date+"("+ day +") "+hour+":"+min+":"+sec;
	document.getElementById("clock").innerHTML = str;
}
</script>

<footer>
	<h3 align="center">웹 어플리케이션 작성 프로젝트. Copyright 2024 
	<font color="red"><span id="clock"></span></font></span> </h3>
</footer>

</body>
</html>