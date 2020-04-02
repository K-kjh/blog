<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<div style="width: 1000px;
		    height: 600px;
		    background-color: yellow;
		    margin-top: 100px;
		    margin-left: 500px;" >

<form class="form-horizontal">

 	<div class="form-group">
    <label class="col-sm-2 control-label">아이디</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputId3" placeholder="id"> <div id="idText">아이디는 4~37 글자 </div> 
    </div>
 
  </div>
   
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">비밀번호</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="inputPassword3" placeholder="Password"><div id="pwText"> 비밀번호 6~50 글자  </div> 
    </div>
  </div>
  
   <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">비밀번호 재입력</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="inputRePassword3" placeholder="RePassword"><div id="pwText2"> 위에 비밀번호랑 같은 값을 입력해주세요. </div> 
    </div>
  </div>
  
  
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
    <div class="col-sm-10">
      <input type="email" class="form-control" id="inputEmail3" placeholder="Email"> 
      <button id="mailCerti"  type="button" class="btn btn-primary" style="margin-right: 10px; float: left; margin-top: 5px;"> 인증번호 발송 </button>
      <button id="mailCertiTextButton"  type="button" class="btn btn-primary" style="margin-right: 10px; float: right; margin-top: 5px;"> 인증번호 확인 </button>
      <input  id="mailCertiText" type="text" style="margin-right: 10px; float: right; margin-top: 5px;"> 
    </div>
  </div>

 
  
</form>
</div>
</body>
<script type="text/javascript">

	var mailClick=null; // 메일 전송 클릭  	
	var mailCerti=null; //메일 인증 번호 
	
	//emailsend,emailCertifi
	$('#mailCerti').click(function(){
		
		$.ajax({
			url :"/login/emailsend",
			type: "post",
			data : { email : $('#inputEmail3').val() },
			success : function(){
				console.log("실행 ");
			}
		}); //ajax -end
		
	});
	
	$('#mailCertiTextButton').click(function(){
		var certificationNumber =  $('#mailCertiText').val();
		    $.ajax({
				url :"/login/emailCertifi",
				type: "post",
				data :{  certificationNumber : certificationNumber },
				success : function(data){
					if(data == 0){
						console.log(" - ");
					}else if(data == 1){

						console.log(" + ");
					}else{

						console.log(" 00000000000000 ");
					}
					
				}
			}); //ajax -end
		
	});
	
</script>

</html>