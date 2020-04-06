<%@page import="org.springframework.web.bind.annotation.SessionAttributes"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page  language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" session="false" %>
<%@ page import="java.util.List,blog.root.model.BoardVO,javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계정 </title>
</head>
<body>

<p> principal : <sec:authentication property="principal" /></p>
<p> 

<div  style="width:200px;height:650px;float:left; ">
		<div  style="width:185px;height:110px;float:left;padding-top:20px;margin-left:5px;
						background-color:whitesmoke;border-color:black;">
			<%HttpSession session = request.getSession(); %>
			<%if(session.getAttribute("root") == null){ %>
				<div>
					<form action="/root" method="post" style="margin-left:15px;">
						관리자 비밀번호 :<input name="pwd" id="pwd" type="password" style="width:150px; margin-left:5px;">
					</form>
				</div>
			<%}else{ %>
				<div style="width:100px;height:45px;margin-left:27px;">
					<form action="/root/logout" method="get" style="padding-top:10px;">
						<input class="btn btn-default" type="submit" value="방문자로 전환" style="width:130px;height:52px;">
					</form>
				</div>
			<%} %>
		</div> 
	</div>
	
</body>
</html>