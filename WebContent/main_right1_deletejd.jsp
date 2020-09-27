<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<jsp:useBean id="dao" class="Dao.Dao" scope="page"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>删除</title>
</head>
<body>
<%
int id = Integer.parseInt(request.getParameter("id"));
if(dao.deletejd(id)){
	%>
	<script>
	alert('删除成功！');
	parent.location("main_right1.jsp");
	
	</script>
	<%
	
}

%>
</body>
</html>