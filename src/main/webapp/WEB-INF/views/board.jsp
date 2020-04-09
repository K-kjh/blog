<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"  %>
<%@ page import="java.util.List,blog.root.model.BoardDTO, blog.root.model.CommentDTO,java.sql.Timestamp,javax.servlet.http.HttpSession" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	
	<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<style>
	
	.triangle-isosceles.left {
	    margin-left: 50px;
	    background: #f3961c;
	}
	.triangle-isosceles {
	    position: relative;
	    padding: 15px;
	    margin: 2em 0 0em;
	    color: #000;
	    background: #f3961c;
	    background: -webkit-gradient(linear, 0 0, 0 100%, from(#f9d835), to(#f3961c));
	    background: -moz-linear-gradient(#f9d835, #f3961c);
	    background: -o-linear-gradient(#f9d835, #f3961c);
	    background: linear-gradient(#f9d835, #f3961c);
	    -webkit-border-radius: 10px;
	    -moz-border-radius: 10px;
	    border-radius: 10px;
	}
	
	.triangle-isosceles.left:after {
	
	    top: 25px;
	    left: -35px;
	    bottom: auto;
	    border-width: 10px 50px 10px 0;
	    border-color: transparent #f3961c;
	}
	
	.triangle-isosceles.right:after {
	    top: 25px;
	    right: -49.8px;
	    bottom: auto;
	    left: auto;
	    border-width: 10px 0 10px 50px;
	    border-color: transparent #f3961c;
	}
	
	.triangle-isosceles:after {
	    content: "";
	    position: absolute;
	    bottom: -15px;
	    left: 50px;
	    border-width: 15px 15px 0;
	    border-style: solid;
	    border-color: #f3961c transparent;
	    display: block;
	    width: 0;
	}
	</style>
</head>
<body>
<br/>
<form method="get" action="/">
		<button id="main"type="button" class="btn btn-secondary" style="margin:7px;">main</button>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }"/>
</form>
<sec:authorize access="isAnonymous()">
	<a href="/login"><button id="main"type="button" class="btn btn-secondary" style="margin:7px;">login</button></a>
</sec:authorize>
<br/>
<%try{ %>

	<% BoardDTO board = (BoardDTO)request.getAttribute("boardDTO"); %>
	<%List<CommentDTO> commentDTOs = (List<CommentDTO>) request.getAttribute("commentDTO"); %>
	<sec:authentication property="principal" var="pinfo" />
	
	<div style="width:1700px;height:auto; ">
		<div style="width:190px;float:left; margin-right:10px;margin-top:100px;">
			
		</div>
		<div  style="width:1500px;height:auto;float:left;" >
		<!-- 제목  -->
			<div class="alert alert-light" role="alert" style="width:1500px;height:50px;float:top;" >
				<h3 style="float:left">제목 : </h3> <h3 ><div id="title"><%=board.getBoard_title() %></div> </h3>
			</div>
	
		<!-- 내용 -->
			<div class="border" id="contents"  role="alert" style="width:1500px;height:auto;float:top;background-color:rgb(247,247,247);border-color:rgb(255,239,239);">
				<div style="padding:20px;" id="board_contents" >
				 <c:out value="<%=board.getBoard_contents()%>"  escapeXml="false"/>
				</div>
				  
			</div>
			<!-- 삭제 수정 버튼 -->
		
			<sec:authorize access="isAuthenticated()">
			<c:set var="board_user_number" value="<%=board.getUser_number()%>" />
		 	<c:set var="board_board_number" value="<%=board.getBoard_number()%>" />
			
			<c:if test="${pinfo.user_number eq board_user_number }" >
				<div id="DeUpButton" value="<%=board.getBoard_number()%>"class="border" style="width:1500px;height:50px;padding-top:5px;padding-bottom:5px;background-color:rgb(247,247,247);">
						<div style="float:left;">
							<button id="update" type="button" class="btn btn-info" style="margin-left:1350px;">수정</button>
							<button id="delete" type="button" class="btn btn-success" style="margin-left:10px;">삭제</button>
						</div>
					</div>
			</c:if>
			
			</sec:authorize>
			
			
		</div>
		
	</div>

	<!-- 댓글 컬럼 -->
<div style="width:1100px;height:auto;float:left;margin-top:10px;margin-left:200px;padding-bottom:40px;background-color:rgb(201,235,255);border-radius:0.5em;border:2px solid #64a2ff;">
		<div style="width:1000px;height:80px;margin-left:45px;margin-top:10px;">
		 <sec:authorize access="isAuthenticated()" >
		 	<textarea id="commentInput" rows="3" style="width:834px;height:80px;float:left;"></textarea>
			<button id="commentInputButton" type="submit" style="margin-left: 38px;width: 95px;height: 80px;" value="<%=board.getBoard_number()%>" >입력</button>
		
		 </sec:authorize>
			
		</div>
		
		<%for(CommentDTO comment : commentDTOs){ %>
			
		 <c:set var="comment_user_number" value="<%=comment.getUser_number()%>" />
		 <c:set var="comment_board_number" value="<%=comment.getBoard_number()%>" />
		 
		 <c:set var="comment_user_auth_auth" value="<%=comment.getUser_authList().get(0).getAuth() %>"/>
		 
		 <c:choose>
		 <c:when test="${(comment_user_number eq board_user_number  &&  comment_board_number eq board_board_number) || comment_user_auth_auth eq 'ROLE_ADMIN' }">
		 			<!-- 관리자 댓글,작성자  --><p>
				<div style="width:1100px;float:left;"><p style="height:8px;">
				<div><pre class="triangle-isosceles right" style="display:table;float:right;	margin-right:80px;margin-left:171px;"
					><%=comment.getContents() %></pre></div>
				</div>
				
				<div  style="float:right;margin-right:80px;height:0px;">
			
				<small><%=comment.getComment_date()%><p style="margin-bottom:-3px;">
				
					<div style="float:right" >
					<c:choose>
					<c:when test="${comment_user_auth_auth eq 'ROLE_ADMIN' }" >
						관리자 :
					</c:when>
					<c:otherwise>
						작성자 :
						 </c:otherwise>
					</c:choose>
				
					<%= comment.getUserList().get(0).getNickname()%>
					</div> 
				</small>
				<sec:authorize access="isAuthenticated()">
		 			<c:if test="${comment_user_number eq pinfo.user_number ||pinfo.auth eq 'ROLE_ADMIN' }">
		 			<a style="font-size:16px;" href="#" id="comment_Target" value="<%=comment.getComment_number()%>"> x</a> 
		 			</c:if>
				</sec:authorize>
				</div>
		 </c:when>
		
		 <c:otherwise>
		 			<!-- 회원 댓글  -->
					<div style="width:1100px;"><p style="height:8px;">
						<div><pre class="triangle-isosceles left" style="display:inline-grid;margin-right:80px;"
						><%=comment.getContents() %></pre></div>
					</div>
					<div style="float:left;margin-left:50px;width:auto;height:0px;"><small><%=comment.getComment_date()%></small></div>
					<p>
					<div style="float:left;margin-left:50px;">
						닉네임 : <%=comment.getUserList().get(0).getNickname()%>
				<sec:authorize access="isAuthenticated()">
		 			<c:if test="${comment_user_number eq pinfo.user_number ||pinfo.auth eq 'ROLE_ADMIN'}">
		 			<a style="font-size:16px;" href="#"id="comment_Target" data-id="<%=comment.getComment_number()%>" > x</a> 
		 			</c:if>
				</sec:authorize>
					</div>	
		 </c:otherwise>
		 </c:choose>
		<%}%>

</div>
<div style="width:100%;height:100px;float:left;"></div>
<%}catch(Exception e){ %>
 	<h1> 사이트 접속 오류로 인하여 접근을 할수 없습니다.</h1>
<%} %>

</body>
<script type="text/javascript">

	var title= $('#title').html();
	var board_number="<%=request.getAttribute("board_number")%>";

	$(document).on("click","#comment_Target",function(){
		var comment_number =$(this).data("id");
		console.log("comment_number :: "+comment_number);
		
		 $.ajax({
				url :"/board/"+board_number+"/comment/"+comment_number,
				type: "post",
				success : function(data){
					if(data  == 1){
						console.log(" 댓 삭 ");
						location.reload();
					}else{
						console.log(" 댓 삭 실패");
					}
				}
			}); //ajax -end
	});
	
	$('#update').click(function(){
		console.log(" title : "+title+", "+$('#title').val() +" ::: "+$('#title').html() +" number : "+board_number);
		
		location.href="/board/"+board_number+"/updatePage";
	});

	$('#delete').click(function(){
		 
		var user_number=0;
		if(${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.user_number}+"" != "" ){
			 	user_number=${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.user_number}+"";
		}
		console.log("user: "+user_number);
		 $.ajax({
			url :"/board/"+board_number+"/delete",
			type: "delete",
			data:{user_number : user_number},
			success : function(data){
				if(data  == 1){
					console.log(" 게시물 삭제 성공 ");
				   location.href="/";
				}else{
					console.log(" 게시물 삭제 실패");
				}
			}
		}); //ajax -end
		
	});
	
	$('#commentInputButton').click(function(){
		
			console.log(" 값은 s? :"+$('#commentInput').val());
			if($('#commentInput').val() == "" || $('#commentInput').val() == " "|| $('#commentInput').val() == null){
				alter(" 내용을 입력해 ");
				return 1;
			}
		 	var user_number=0;
			if(${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.user_number}+"" != "" ){
				 	user_number=${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.user_number}+"";
			}
			if(user_number != 0 ){
			
				 $.ajax({
						url :"/board/"+$('#commentInputButton').val()+"/comment",
						type: "post",
						data : {  commentInput :$('#commentInput').val() ,user_number},
						success : function(data){
							if(data  == 1){
								console.log(" 성공 ");
							}else{
								console.log(" 실패");
							}
						    location.reload();
						}
					}); //ajax -end
				
			}else{
				alert(" 회원만 댓글 입력이 가능합니다. ");
			}
		
	});

	$('#main').click(function(){
		self.location="/";
	});
</script>
</html>