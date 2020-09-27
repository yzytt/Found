<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<jsp:useBean id="dao" class="Dao.Dao" scope="page"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style1.css" type="text/css" media="all" />
<title>查询结果</title>
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
			    <li><a href="managerds.jsp" class="active"><span>失物信息管理</span></a></li>
			    <li><a href="managerjd.jsp"><span>招领信息管理</span></a></li>
			    <li><a href="usermanager.jsp"><span>用户管理</span></a></li>
			    
			</ul>
		</div>
		<!-- End Main Nav -->
	</div>
</div>
<!-- End Header -->

<!-- Container -->
<div id="container">
	<div class="shell">
		
		<!-- Small Nav -->
		
		<!-- End Small Nav -->
		
		<!-- Message OK -->		
		<!--
		<div class="msg msg-ok">
			<p><strong>Your file was uploaded succesifully!</strong></p>
			<a href="#" class="close">close</a>
		</div> --> 
		<!-- End Message OK -->		
		
		<!-- Message Error -->
		<!--
		<div class="msg msg-error">
			<p><strong>You must select a file to upload first!</strong></p>
			<a href="#" class="close">close</a>
		</div>  -->
		
		
		<!-- End Message Error -->
		<br />
		<!-- Main -->
		<div id="main">
			<div class="cl">&nbsp;</div>
			
			<!-- Content -->
			<div id="content">
				
				<!-- Box -->
				<div class="box">
					<!-- Box Head -->
					<div class="box-head">
						<h2 class="left">失物信息列表</h2>
						
					</div>
					<!-- End Box Head -->	

					<!-- Table -->
					<form action="addServlet?method=deleteds" method="post">
					<div class="table">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<th width="13"> </th>
								<th>发布人</th>
								<th>物品类别</th>
								<th>丢失地点</th>
								<th>丢失时间</th>
								<th>详细信息</th>
								<th width="110" class="ac">操作</th>
							</tr>
							<%
		String userName = request.getParameter("userName");
        ResultSet rs = dao.searchdsByuserName(userName);
		int dsnumber = 1;
		
		
		 
		
      if(rs==null){
    	  %>
          <tr align="center" valign="middle"><td colspan="4">没有记录显示！</td>
          </tr>
          <%
       }
      else{
    	  
		while(rs.next()){%>
							<tr>
								<td><input type="checkbox" class="checkbox" name="checkds" value="<%=rs.getInt("id") %>" /></td>
								<td><h2><%=rs.getString("userName") %></h3></td>
								<td><h3><%=rs.getString("name") %></h3></td>
								<td><%=rs.getString("place") %></td>
								<td><%=rs.getString("time") %></td>
								<td><%=rs.getString("info") %></td>
								
								<td><a onclick="return check()" href="deleteds.jsp?id=<%=rs.getString("id") %>" class="ico del">删除</a><a href="updateds.jsp?id=<%=rs.getString("id") %>" class="ico edit">修改</a></td>
							</tr>
							<%
							dsnumber++;}
							}%>
							
						</table>
		<script type="text/javascript">
		function check() {
			if (confirm("确定删除吗？")){
				return true;
			}else{
				return false;
			}
		}
	</script>				
						
						<!-- Pagging -->
						<div class="pagging">
							<div class="left">1-<%=dsnumber-1 %></div>
							<div class="left">
							 		<input type="submit"onclick="return check()" class="button" value="删除所选内容" />
						    </form>
						    </div>
							<div class="right">
								<a href="#">前一页</a>
								<a href="#">1</a>
								<a href="#">2</a>
								<a href="#">3</a>
								<a href="#">4</a>
								<span>...</span>
								<a href="#">下一页</a>
							</div>
						</div>
						<!-- End Pagging -->
						
					</div>
					<!-- Table -->
					
				</div>
				<!-- End Box -->
				
				<!-- Box -->
				<div class="box">
					<!-- Box Head -->
					<div class="box-head">
						<h2>添加备注记录</h2>
					</div>
					<!-- End Box Head -->
					
					<form action="" method="post">
						
						<!-- Form -->
						<div class="form">
								<p>
									<span class="req">100字以内</span>
									<label>备注主题<span>(必填)</span></label>
									<input type="text" class="field size1" />
								</p>	
								<p class="inline-field">
									<label>日期</label>
									<input type="datetime-local" class="field size1" name="date">
								</p>
								
								<p>
									<span class="req">1000以内</span>
									<label>备注内容 <span>(必填)</span></label>
									<textarea class="field size1" rows="10" cols="30"></textarea>
								</p>	
							
						</div>
						<!-- End Form -->
						
						<!-- Form Buttons -->
						<div class="buttons">
							<input type="submit" class="button" value="提交" />
						</div>
						<!-- End Form Buttons -->
					</form>
				</div>
				<!-- End Box -->

			</div>
			<!-- End Content -->
			
			<!-- Sidebar -->
			<div id="sidebar">
				
				<!-- Box -->
				<div class="box">
					
					<!-- Box Head -->
					<div class="box-head">
						<h2>管理</h2>
					</div>
					<!-- End Box Head-->
					
					<div class="box-content">
						
						<div class="cl">&nbsp;</div>
						
						<p class="select-all"><input type="checkbox" class="checkbox" /><label>选择全部</label></p>
						<p><a href="#">其他</a></p>
						
						<!-- Sort -->
						
						<!-- End Sort -->
						
					</div>
				</div>
				<!-- End Box -->
			</div>
			<!-- End Sidebar -->
			
			<div class="cl">&nbsp;</div>			
		</div>
		<!-- Main -->
	</div>
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