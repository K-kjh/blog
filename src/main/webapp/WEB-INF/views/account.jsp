<%@page import="org.springframework.web.bind.annotation.SessionAttributes"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page  language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계정 </title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
<form method="get" action="/">
		<button id="main"type="button" class="btn btn-secondary" style="margin:7px;">main</button>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }"/>
</form>
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
				<div>
					<div id="roots" style="margin-left:15px;">
						관리자 비밀번호 :<input name="pwd" id="pwd" type="password" style="width:150px; margin-left:5px;">
						<button value="<sec:authentication property="principal.user_number" />" type="button" id="rootbutton">입력</button>
					</div>
				</div>
		</div> 
	</div>
	
</body>
<script  type="text/javascript">

$('#rootbutton').click(function(){
	var pwd=$("#pwd").val();
  	var user_number=$('#rootbutton').val();
	console.log("user: "+user_number);
  	$.ajax({
		url :"/account/root" ,
		type: "put",
		data :  {  pwd:pwd , user_number : user_number},
		success : function(data){
		          //0 실패 1 성공
		              if(data == 1){
		            	  	alert("권한 변경 성공");
							location.href ="/";
		              }else{
		            	  	alert("권한 변경  실패");
		              }
		         }
}); //ajax -end
});



$('#main').click(function(){
	self.location="/";
});
</script>
</html>