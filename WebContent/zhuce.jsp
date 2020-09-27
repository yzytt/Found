<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="css/commons.css">
	<style>a {text-decoration: none}
	a:hover {
	color:orange;
	}
	a{color:blue;}
	input:focus{
	background-color:#F0FFFF;
	border: 1px solid blue;
	}
	.d1{
position:absolute; 
 left:0px;
 top:0px; 
 width:100%; 
 height:100%;
 z-index:-1;
}
	</style>
</head>
<body style=" background-repeat:no-repeat ;
background-size:100% 100%; 
background-attachment: fixed;" >
<div class="d1"><img src="images/banner2.jpg" width="100%" height="100%"/></div>
<!--头条框-->
<%
	     Object message = request.getAttribute("message");//放置一个字符串，并取出
	     if(message!=null && !"".equals(message)){
	 
	%>
	     <script type="text/javascript">
	          alert("<%=request.getAttribute("message")%>");
	     </script>
	<%} %>
	<div class="denglu">
	<center>
		<form action="UserServlet?method=add" method="post" onsubmit="return check()">
		<br/><br/><br/><br/><br/><br/><br/>
 <h2 style="color:#9999ff">注册</h2>
		 <table class=gridtable>
			<tr><td>
				<input type="text"  placeholder="用户名："  id="username" name="username" style="height:40px;width:300px;display:inline-block;border: 2px solid #ccc;"/><br/><br/>
			</td></tr>
			<tr><td>
				<input type="password" placeholder="密码："  id="password" name="password" style="height:40px;width:300px;display:inline-block;border: 2px solid #ccc;" /><br/><br/>
			</td></tr>
			<tr><td>
				<input type="password" placeholder="确认密码："  id="rpassword" name="rpassword" style="height:40px;width:300px;display:inline-block;border: 2px solid #ccc;"/>
			</td></tr>
			   <tr>
                 <td> <button type="submit" style="height:40px;width:300px; background-color:#ccddff">注&nbsp;&nbsp;&nbsp;&nbsp;册</button></td>
            </tr>
			</table>
			<p style="font-size:10px;color:blue;">
<a href="jiemian.jsp">
跳转至登陆界面
</a>
</p>
		</form>
			</center>
	</div>
	<script type="text/javascript">
		function check() {
			var username = document.getElementById("username");;
			var password = document.getElementById("password");
			var rpassword = document.getElementById("rpassword");
			//非空
			if(username.value == '') {
				alert('账号不能为空');
				username.focus();
				return false;
			}
			var reg = new RegExp(/^[0-9A-Za-z]+$/);
		    if (!reg.test(username.value)) {
		    	alert('账号不能包含字母数字以外字符');
		    	username.focus();
		        return false;
		    }
			var reg1 = new RegExp(/^(([a-z]+[0-9]+)|([0-9]+[a-z]+))[a-z0-9]*$/i);
		    if (!reg1.test(username.value)) {
		    	alert('账号为字母数字组合');
		    	username.focus();
		        return false;
		    }
		    
			if(password.value == '') {
				alert('密码不能为空');
				password.focus();
				return false;
			}
			if (password.value.length<8 || password.value.length>16) {
				alert('密码长度8-16位');
				password.focus();
				return false;
		    }
			if(rpassword.value == '') {
				alert('确认密码不能为空');
				rpassword.focus();
				return false;
			}
			if(rpassword.value!= password.value) {
				alert('两次密码不一致');
				rpassword.focus();
				return false;
			}
			
			
		}
	</script>
</body>
</html>