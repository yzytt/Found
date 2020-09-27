<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<jsp:useBean id="dao" class="Dao.Dao" scope="page"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(session.getAttribute("userName")==null)
{
	response.sendRedirect("jiemian.jsp");
}
%>
<%
String userName=String.valueOf(session.getAttribute("userName"));
int type=dao.type(userName);
if(type==1)
{
	response.sendRedirect("main_right.jsp");
}
else if(type==2)
{
	response.sendRedirect("managerds.jsp");
}
%>
</body>
</html>