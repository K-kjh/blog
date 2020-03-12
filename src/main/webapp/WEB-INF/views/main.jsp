<%@page import="org.springframework.web.bind.annotation.SessionAttributes"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page  language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" session="false" %>
<%@ page import="blog.root.model.SubjectVO,java.util.List,blog.root.model.BoardVO,javax.servlet.http.HttpSession" %>
<html>
<head>
	<title>Home</title>
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
</head>

<body>
<div style="height:100px;">
</div>

<div style="width:1700px;height:650px;">

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
<div> © 2020~202x <p class="font-weight-bold"> kgh2252@naver.com</p></div>
<p class="text-right">test</p>
</div>
</body>
<script>
    var click_board;
	 var page=<%=request.getAttribute("page")%>;
	 var subject =<%= request.getAttribute("subject_type") %>;
	 
	 console.log("subject :: "+subject);
	 var sub= subject != null ?  "/sub/"+subject: "" ;
	 console.log("sub :::  "+sub);
	 
    $('#button_left').click(function(){
		var pagedown=page-1;
		
		console.log("sub : "+subject);
    	if(pagedown >= 0){
    		console.log("페이지 이동"+page);
    		if(pagedown == 0){
    			location.href="/";
    		}
    		if(sub != ""){
            	location.href="/sub/"+subject+"/page/"+pagedown;
    		}
        	location.href="/page/"+pagedown;
    	}else{

        	console.log("page down not : "+page);
    	}
    });
    
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
    	
    	console.log("page up not : "+page+" pageup : "+pageup +" , pagemax ,: "+pagemax);
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
			type: "post",
			data : query,
			success : function(data){}
		}); //ajax -end
	   location.href="/board/"+click_board;
			
    });  
</script>
</html>
