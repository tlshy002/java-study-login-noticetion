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
					<a href="index.jsp">�� Ȩ����</a><br/>
					<a href="boardList.do">�� �Խñ� ����</a><br>
					<a href="bbsLoginCheck.do">�� �Խñ� ����</a><br>
					
					<a href="">�� ��ǰ ����</a><br>
				<% if(id != null && id.equals("admin")) { %>
					<a href="findNation.do">�� ��ǰ ���</a><br>
				<% } %>					
					<a href="index.jsp?BODY=imageWriteForm.jsp">�� �̹��� �� ��� �Խñ� ����</a><br>
					<a href="imageList.do">�� �̹��� �� ��� �Խñ� ����</a><br>
					
					
					<a href="noticeList.do">�� �������� ����</a><br>
					<% if(id != null && id.equals("admin")) { %>
						<a href="index.jsp?BODY=notice_input.jsp">�� �������� ����</a><br>
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
	workingClock(); //���� �ð��� �����ִ� �ð�ȣ��
	setInterval(workingClock, 1000); //1�ʰ������� workingClock() ��� ȣ��
}
function workingClock() {
	var today = new Date();
	var days = ["��","��","ȭ","��","��","��","��"];
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
	
	var index = today.getDay(); //0~6��� 
	var day = days[index]; //������ ������ ���
	var str = year+"/"+month+"/"+date+"("+ day +") "+hour+":"+min+":"+sec;
	document.getElementById("clock").innerHTML = str;
}
</script>

<footer>
	<h3 align="center">�� ���ø����̼� �ۼ� ������Ʈ. Copyright 2024 
	<font color="red"><span id="clock"></span></font></span> </h3>
</footer>

</body>
</html>