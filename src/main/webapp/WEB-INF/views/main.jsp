<%@page import="org.springframework.web.bind.annotation.SessionAttributes"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page  language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" session="false" %>
<%@ page import="blog.root.model.SubjectVO,java.util.List,blog.root.model.BoardVO,javax.servlet.http.HttpSession" %>
<html>
<head>
	<title>Home</title>
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</head>

<body>
<div style="height: 100px;width: 1650px;">

<div class="btn-group" role="group" aria-label="Button group with nested dropdown">
	<form action="/about" method="get">
	<button  style="
			margin-left: 1450px;
	   	 	width: 150px;
	    	height: 50px;"type="submit" class="btn btn-secondary btn-lg">About</button>
	</form>

  <div class="btn-group" role="group" style="height: 50px;
    width: 100px;">
    <button id="btnGroupDrop1" type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="height: 50px;width: 100px;">
       계정
    </button>
    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
    	<sec:authorize access="isAnonymous()">
     	 	<a class="dropdown-item" href="/login"> 로그인 </a>
    	</sec:authorize>
    	<sec:authorize access="isAuthenticated()">
	      <a class="dropdown-item" href="/logout">logout</a>
	      <a class="dropdown-item" href="/account">계정 정보</a>
    	</sec:authorize>
      
    </div>
  </div>
</div>


</div>

<div style="width:1700px;height:650px;">

	<div  style="width:200px;height:650px;float:left; ">

	</div>
	<%HttpSession session = request.getSession(); %>
	<div class="btn-group" role="group" aria-label="Basic example" style="width:1500px;height:50px;float:left; ">
	<%List<SubjectVO> subjects =(List<SubjectVO>) request.getAttribute("subList");%>
	
	<a type="button" class="btn btn-secondary" style="margin-top:3px; font-size:2rem;"  href='/sub/0'>전 체</a>
	
	<% for (SubjectVO subject : subjects){ %>
	
		<a type="button" class="btn btn-secondary" style="margin-top:3px; font-size:2rem;"  href='/sub/<%=subject.getSub_number()%>'><%=subject.getBoard_sub_type()%></a>
	
	<%} %>	
	
	</div>

	<div class="table-bordered" style="width:1500px;height:597px;float:left;  ">
	<table class="table table-hover" style="overflow-y: auto;">
	
	  <thead>
	    <tr>
	    
	      <th scope="col">#</th>
	      <th scope="col">제목</th>
	      <th scope="col">작성일</th>
	      <th scope="col">조회수</th>
	      
	    </tr>
	  </thead>
	  
	   <%List<BoardVO> boards = (List<BoardVO>) request.getAttribute("boardList");%>
	   
	  <tbody id="board_list">
		  	<% for(BoardVO board : boards){ %>
		    <tr class="board_list" value="<%=board.getBoard_number()%>">
		      <th scope="row" ><%=board.getBoard_number() %></th>
		      <td><%=board.getBoard_title() %></td>
		      <td><%=board.getBoard_date() %></td>
		      <td><%=board.getBoard_count() %></td>
		    </tr>
		   <%} %>
	  </tbody>
	</table>
	
		<!-- 왼쪽 버튼  -->
		<div style="margin-left:500px;float:left;">
			<button id="button_left" type="button" class="btn btn-default btn-lg">
			  <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> 
			</button>
		</div>
		
		<!--  오른쪽 버튼  -->
		<div style="margin-left:100px;float:left;">
			<button id="button_right" type="button" class="btn btn-default btn-lg">
			  <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			</button>
		</div>
		
		<% if(session.getAttribute("root") != null){ %>
		<div style="margin-left:723px;float:left;">
			<button id ="board_add" type="button" class="btn btn-success btn-lg">글쓰기</button>
		</div>
		<%}else{ %>
		
		<%} %>
	
	
	</div>

</div>
<div style="margin-top:150px;height:135px;width:100%;background-color: #d4d4d4b5;">
<div> <p class="font-weight-bold">© 2020~202x <br/> kgh2252@naver.com </p>

</div>

</div>
</body>
<script>
    var click_board;
	 var page=<%=request.getAttribute("page")%>;
	 var subject =<%= request.getAttribute("subject_type") %>;
	 
	 console.log("subject ::: "+subject);
	 var sub= subject != null ?  "/sub/"+subject : "" ;
	 console.log("sub :::  "+sub);
	 //페이징 왼쪽 버튼
    $('#button_left').click(function(){
		var pagedown=page-1;
		var link;
		
		console.log("sub. : "+subject);
		
    	if(pagedown >= 0){
    		console.log("10....페이지 이동 :"+page+" , "+sub);
    		if(sub == "" && pagedown == 0){
    			location.href="/";
    		}
    		if(sub != ""){
        		 link =sub+"/page/"+pagedown;
    		}else{

    	   		 link ="/page/"+pagedown;
    		}
    		console.log("link : "+link);
        	location.href=link;
    	}else{}
    	
    });
    
	 //페이징 오른쪾 버튼
    $('#button_right').click(function(){
    	var pagemax=<%=request.getAttribute("page_max")%>;
    	var pageup=page+1;
    	console.log("sub : "+subject);
    	if(pageup <= pagemax){
    		
    		console.log("페이지 이동"+page);
    		var link;
    		
        	if(sub != ""){
        		console.log("페이지 수정 했장아~~~~~~~~~~~");
        		 link =sub+"/page/"+pageup;
        		 
        	}else{
        		 link ="/page/"+pageup;

         		console.log("페이지 수정 안함 "+link);
        	}
        	location.href=link;
        	
        	
    	}else{
    		console.log(sub+"/page/"+pageup);
    		console.log("페이지 not5 이동");
    	}
    	
    	console.log("- page up not : "+page+" pageup : "+pageup +" , pagemax ,: "+pagemax);
    });
    
    /* 페이징 버튼 */
    
    
    /*게시판 생성 링크  */
    $('#board_add').click(function(){
    	location.href="/board/addboard";
    });
    
    /* 게시판 내용 확인  */
    $('.board_list').click(function(){
	    click_board=$(this).attr("value");
	    console.log(click_board+" 요거"+$(this).val() +" ,"+$(this).attr("value"));
	    	
	    var query = { 
	         board_count : click_board
	     };
	    $.ajax({
			url :"/board/count",
			type: "PUT",
			data : query,
			success : function(data){}
		}); //ajax -end
	   location.href="/board/"+click_board;
			
    });  
</script>
</html>
