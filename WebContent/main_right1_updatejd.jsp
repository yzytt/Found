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
			<h1><a href="#">个人中心</a></h1>
			<div id="top-navigation">
				欢迎 <a href="#"><strong>关于我的</strong></a>
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
			    <li><a href="main_right.jsp"><span>我发表的失物表单</span></a></li>
			    <li><a href="main_right1.jsp" class="active"><span>我发表的招领表单</span></a></li>
			    
			</ul>
		</div>
		<!-- End Main Nav -->
	</div>
</div>
<!-- End Header -->

<!-- Container -->
<div id="container">
	<div class="shell">
		
		<div id="main">
			<div class="cl">&nbsp;</div>
			
			<!-- Content -->
			<div id="content">
				
				<!-- Box -->
				<div class="box">

<%        int id = Integer.parseInt(request.getParameter("id"));
		ResultSet rs=dao.listjdByid(id);
		if(rs==null){ 
    	  %>
    	  
    	  
               没有记录显示！
          
          
          
          
          <%
       }
      else{
    	  
		if(rs.next()){%>
						
								
								
								<!-- Box -->
				<div class="box">
					<!-- Box Head -->
					<div class="box-head">
						<h2>修改信息</h2>
					</div>
					<!-- End Box Head -->
					
					<form action="addServlet?method=main_right1_updatejd" method="post">
						
						<!-- Form -->
						<div class="form">
								
								<P><label>物品类别</label><input type="text" name="name" value=" <%=rs.getString("name") %>" class="field size1"></P> 
								<P><label>丢失地点</label><input type="text" name="place" value=" <%=rs.getString("place") %>" class="field size1" ></P>
								<P><label>丢失时间</label><input type="datetime-local" name="time"  class="field size1"></P> 
								<P><label>联系方式</label><input type="text" name="people" value=" <%=rs.getString("people") %>" class="field size1"></P> 
								<P><label>详细信息</label><input type="text" name="info" value=" <%=rs.getString("info") %>" class="field size1" ></P> 
								<input type="hidden" name="id" value="<%=rs.getInt("id") %>">
							
						</div>
						<!-- End Form -->
						
						<!-- Form Buttons -->
						<div class="buttons">
							<input type="submit" class="button" value="确认修改" />
						</div>
						<!-- End Form Buttons -->
					</form>
				</div>
				<!-- End Box -->

			</div>
		<%
							}
							}
							%>		
						
					
					<!-- Table -->
					
				</div>
				<!-- End Box -->
				
				<!-- Box -->

				<!-- End Box -->

			</div>
			<!-- End Content -->
			
			<!-- Sidebar -->
			
			<!-- End Sidebar -->
			
			<div class="cl">&nbsp;</div>			
		</div>
		<!-- Main -->
	</div>

<!-- End Container -->

<!-- Footer -->
<div id="footer">
	<div class="shell">
		<span class="left"> </span>
		<span class="right">
		
		</span>
	</div>
</div>
<!-- End Footer -->
</body>
</html>