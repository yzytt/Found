<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<jsp:useBean id="dao" class="Dao.Dao" scope="page"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style1.css" type="text/css" media="all" />
<title>失物信息管理</title>
 <head> 
        <style> 
        .black_overlay{ 
            display: none; 
            position: absolute; 
            top: 0%; 
            left: 0%; 
            width: 100%; 
            height: 100%; 
            background-color: black; 
            z-index:1001; 
            -moz-opacity: 0.8; 
            opacity:.80; 
            filter: alpha(opacity=88); 
        } 
        .white_content { 
            display: none; 
            position: absolute; 
            top: 25%; 
            left: 25%; 
            width: 55%; 
            height: 55%; 
            padding: 20px; 
            border: 10px solid orange; 
            background-color: white; 
            z-index:1002; 
            overflow: auto; 
        } 
    </style> 
</head>
<body>
<%
if(session.getAttribute("userName")==null)
{
	response.sendRedirect("jiemian.jsp");
}
%>
<%
	     Object message = request.getAttribute("message");//放置一个字符串，并取出
	     if(message!=null && !"".equals(message)){
	 
	%>
	     <script type="text/javascript">
	          alert("<%=request.getAttribute("message")%>");
	     </script>
<%} %>
<!-- Header -->
<div id="header">
	<div class="shell">
		<!-- Logo + Top Nav -->
		<div id="top">
			<h1><a href="#">管理员界面</a></h1>
			<div id="top-navigation">
				欢迎 <a href="#"><strong>管理员</strong></a>
				<span>|</span>
				<a href="#">帮助</a>
				<span>|</span>
				<a href="index.jsp">退出</a>
				<span>|</span>
			</div>
		</div>
		<!-- End Logo + Top Nav -->
		
		<!-- Main Nav -->
		<div id="navigation">
			<ul>
			    <li><a href="managerds.jsp" ><span>失物信息管理</span></a></li>
			    <li><a href="managerjd.jsp"><span>招领信息管理</span></a></li>
			    <li><a href="usermanager.jsp"class="active"><span>用户管理</span></a></li>
			    
			</ul>
		</div>
		<!-- End Main Nav -->
	</div>
</div>
<!-- End Header -->

<!-- Container -->
<div id="container">
	<div class="shell">
		<br />
		<!-- Main -->
		<div id="main">
			<div class="cl">&nbsp;</div>
			
			<!-- Content -->
			<div id="content">
				
				<!-- Box -->
				<div class="box">
					<!-- Box Head -->
					
					<!-- End Box Head -->	
                     
					<!-- Table -->
					
					<form action="addServlet?method=deleteuser" method="post">	
					<div class="table">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<th width="13"> </th>
								<th>用户名</th>
								<th>用户密码</th>
								<th>用户级别</th>
								<th>操作</th>
							</tr>
							<%
        ResultSet rs=dao.listAlluser();
		int number = 1;
      if(rs==null){
    	  %>
          <tr align="center" valign="middle"><td colspan="4">没有记录显示！</td>
          </tr>
          <%
       }
      else{
    	  
		while(rs.next()){%>
							<tr>
								<td><input type="checkbox" class="checkbox" name="checkuser" value="<%=rs.getInt("id")%>"/></td>
								<td><h3><%=rs.getString("userName") %></h3></td>
								<td><%=rs.getString("password") %></td>
								<td><%=rs.getInt("type") %></td>
								<td><a onclick="return check()"  href="deleteuser.jsp?id=<%=rs.getInt("id")%>" class="ico del">删除</a>
								</td>
							</tr>
							<%
							number++;}
							}%>
						</table>
						</div>
						<!-- Pagging -->
						<div class="pagging">
							<div class="left">1-<%=number-1 %></div>
							<div class="left">
							 		<input type="submit"onclick="return check()" class="button" value="删除所选内容" />
							</div>
						   </div> 
						   </form>
						  
						    				<script type="text/javascript">
		function check() {
			if (confirm("确定删除吗？")){
				return true;
			}else{
				return false;
			}
		}
		
	</script>
							</div>
						</div>
						<!-- End Pagging -->
						
					</div>
					<!-- Table -->
					
				</div>
				<!-- End Box -->
			</div>
			<!-- End Content -->
			<div class="cl">&nbsp;</div>			
<div id="footer">
	<div class="shell">
		<span class="left"> </span>
		<span class="right">
		</span>
	</div>
</div>
</body>
</html>