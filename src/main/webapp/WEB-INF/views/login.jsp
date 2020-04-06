<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page  language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	
	<script
	  src="https://code.jquery.com/jquery-3.4.1.min.js"
	  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	  crossorigin="anonymous"></script>
  	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" 
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" 
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</head>
<body>
<div style=" width: 100%; height: 800px;">
	<div style="background-color: #e8e6e6;
    width: 600px;
    height: 500px;
    margin-left: 30%;
    margin-top: 140px;
    border: 1px solid;">
    
 <form style="padding:21px;" method="post" action="/login">
 
  <div class="form-group row" style="margin-top: 57px;">
    <label for="staticEmail" class="col-sm-2 col-form-label">Id</label>
    <div class="col-sm-10">
      <input id="id" name="username" type="text" class="form-control" >
    </div>
  </div>
  
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
    <div class="col-sm-10">
      <input id="pw" name="password" type="password" class="form-control" >
    </div>
  </div>
  
  <button type="submit" class="btn btn-secondary" style="margin-left: 33px;
    width: 500px;
    height: 100px;">로그인</button>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>

	<span style="margin-left: 50px;">계정이 없으시면 <a href="/singup">회원가입</a> 을 하십시오.</span>
	</div>
</div>
</body>
<script type="text/javascript">
</script>

</html>