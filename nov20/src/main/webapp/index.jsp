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
<body>
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
					<a href="itemLoginCheck.do">�� ��ǰ ���</a><br>
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

<footer>
	<h3 align="center">�� ���ø����̼� �ۼ� ������Ʈ. Copyright 2024</h3>
</footer>

</body>
</html>