<%@page import="org.springframework.web.bind.annotation.SessionAttributes"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
<p> userDto :<sec:authentication property="principal.userdto" /> </p>

<p> 사용자 아이디 :<sec:authentication property="principal.username" /> </p>
<p> 사용자 닉네임 :<sec:authentication property="principal.nickname" /> </p>
<p> 사용자 고유 번호  :<sec:authentication property="principal.user_number" /> </p>
<p> 사용자 생성 일자  :<sec:authentication property="principal.id_create_date" /> </p>


<p> 사용자 권한  :<sec:authentication property="principal.userdto.authList" /> </p> 

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