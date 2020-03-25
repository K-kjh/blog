<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"  %>
<%@ page
 import=
"java.util.List,
 blog.root.model.BoardDTO,
 blog.root.model.SubjectVO" %>
 <%request.setCharacterEncoding("utf-8"); %>
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

	<style>
	
	select {
	    width: 150px; /* 원하는 너비설정 */
	    height:48px;
	    padding: .8em .5em; /* 여백으로 높이 설정 */
	    font-family: inherit;  /* 폰트 상속 */
	    background: url(/resources/image/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표를 커스텀 화살표로 대체 */
	    border: 1px solid #999;
	    border-radius: 0px; /* iOS 둥근모서리 제거 */
	    -webkit-appearance: none; /* 네이티브 외형 감추기 */
	    -moz-appearance: none;
	  	appearance: none;
	}
		
		
	/* IE 10, 11의 네이티브 화살표 숨기기 */
	select::-ms-expand {
	    display: none;
	}


	</style>
</head>

<body>
<br/>
<div style="width:1700px;height:800px;">

	<!--사이드 바  -->
	<div  class="alert alert-success" role="alert"  
		style="width:190px;height:600px;float:left; 
		margin-right:10px;margin-top:100px;">
			HTML 태그를 사용할수 있습니다<br/>[s] 태그 :<s>텍스트</s><br/>[ins] 태그:<ins>밑줄</ins><br/>[strong] 태그 : <strong>텍스트</strong><br/>
			[kbd] 태그 :<kbd>text</kbd><br/>	
			<br/>자세한건:<a href="https://getbootstrap.com/docs/4.4/content/typography/">1링크</a>,<a href="http://bootstrapk.com/css/#type">2링크</a>
	</div>
	
	<!--  메인 -  -->
	<div  style="width:1500px;height:800px;float:left; " >
	
		<p class="text-muted" style="margin-left:80px;">40자 까지 입력하시오.</p>
		<div style="width:100px;heigth:50px;float:left;">
			<h3 >
				<p class="text-muted" style="margin-top:5px;" >제목 :
				</p>
			
			</h3>
		</div>
		<div id="board_title" class="alert alert-success" role="alert"
		 style="margin-left:85px;width:1400px;height:50px;float:top;overflow-y:auto;" contenteditable="true" >
		 	<%if(request.getAttribute("update_board_title") != null){%>	
					<%=request.getAttribute("update_board_title")%>
			<%}%>
		</div>
		
		<!-- 내용  -->
		
		<div id="board_contents"class="border border-primary" style="width:1500px;height:650px;float:top;
			overflow-y: auto; padding-left:40px;" contenteditable="true" >
			<%if(request.getAttribute("update_board_contents") != null){%>	
					<%=request.getAttribute("update_board_contents")%>
			<%}%> 
		</div>
		
		<!-- 버튼 칸 -->
		<div class="border border-primary" style="width:1500px;height:55px;float:top;">
		
			<button style="margin-left:800px;" class="image_put" >이미지 삽입</button>
			<input id="image_file" name="uploadFile" type="file" >
			
			<!-- 분류 -->
			<div class="btn-group" role="group">
			
			<%
			List<SubjectVO> subjects =(List<SubjectVO>) request.getAttribute("subList");	
			%>
			
			<select id="subtype" style="margin-left:12px;">
		    <option selected> <%=subjects.get(0).getSub_number() %>. <%=subjects.get(0).getBoard_sub_type() %></option>
		      	
		      	<%String spa=" "; %>
				<%for(SubjectVO subject:subjects){ %>
				
					<%if(subject.getSub_number() < 10){spa=" ";
					}else{spa="";}%>
					
					<%if(subject.getSub_number() == 1){%>
                 <%}else{ %>
                 
		   			 <option value=<%=subject.getSub_number() %>><%=subject.getSub_number() %><%=spa%>.<%=subject.getBoard_sub_type() %></option>
		      		<%}/*  if-else end */ %>
				<%}/* for-end */ %>
			</select>
			</div>
			<%if(request.getAttribute("update_board_title")!= null && request.getAttribute("update_board_contents")!=null){ %>
				<button id="board_update_button" class="btn btn-secondary" type="button" style="margin-top:5px;margin-left:10px;width:100px;">저장</button>
			<%}else{ %>
				<button id="board_create_button" class="btn btn-secondary" type="button" style="margin-top:5px;margin-left:10px;width:100px;">저장</button>
			<%} %>
		</div>
	 <div class="text-muted"  style="margin-left:5px; width:500px;">최대 5000bit, 영어1bit 한글1bit 숫자 1bit,그림은 하나당 100bit</div>
			
	</div>
	
</div>
</body>
<script type="text/javascript">
	
 	var image_src;
	var image_src_file = [];
  	var subtype=1;

	var d = new Date();
	var dtime;
	
	var board_number="<%=request.getAttribute("update_board_number") %>";
  	var board_title="<%=request.getAttribute("update_board_title")%> " ;
  	
  	$('#board_contents').on('drop',function(e){
  		e.stopPropagation();
  		e.preventDefault();

  		var file = e.originalEvent.dataTransfer.files;
  		 			
  		var formData = new FormData();
  		dtime=d.getTime();
  		
		formData.append("uploadFile",file[0]);
		formData.append("Time",""+dtime);
		 
		 $.ajax({
			url:'/uploads',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			success: function(result){
				$("div#board_contents").append("<img src=/img/"+result+" style='width:850px;height:auto;'>"); 
			}
		 });
  		
  	});
  	
  	$('#board_update_button').click(function(){
  		console.log(" title : "+$('#board_title').html());
  		console.log(" subtype : "+subtype);
  		
		var contents = $('#board_contents').html();
		contents=contents.replace(/(?:\r\n|\r|\n)/g,'<br/>');
		console.log("html 변환 : "+contents);

	   	 var query = { 
	                board_title : board_title , board_contents : contents , board_type : subtype
	    };
	   
	   	$.ajax({
				url :"/board/"+board_number+"/update" ,
				type: "post",
				data : query,
				   success : function(data){
				          //0 실패 1 성공
				              if(data == 1){
				            	  	alert("게시글 변경 성공");
									location.href ="/";
				              }else{
				            	  	alert("게시글 변경 실패");
				              }
				         }
		}); //ajax -end
  	});
  	
  	$('#subtype').click(function(){
  		subtype=$(this).val();
  	});
  	
  	$('#board_create_button').click(function(){

  		console.log(" title : "+$('#board_title').html());
  		console.log(" subtype : "+subtype);
  		
		var contents = $('#board_contents').html();
		contents=contents.replace(/(?:\r\n|\r|\n)/g,'<br/>');
		console.log("html 변환 : "+contents);

	   	 var query = { 
	                board_title : $('#board_title').html() , board_contents : contents , board_type : subtype
	    };
	   
	   	$.ajax({
				url :"/board/addboard/create",
				type: "post",
				data : query,
				   success : function(data){
				          //0 실패 1 성공
				              if(data == 1){
				            	  
									location.href ="/";
				              }else{
				            	  	alert("게시글 작성 실패");
				              }
				         }
		}); //ajax -end
  		
	});

	
  	$('#image_file').click(function(){
  		dtime=d.getTime();
  	});
  	
 
  	
	$(".image_put").click(function(e){
		
		console.log("date : "+d+ " ::::: -+-+-+"+ d.getTime());
		
		image_src=$('#image_file').val();
		console.log("image: "+image_src);
		var test_image=image_src;
		image_src=$('#image_file').val().split("\\");
		console.log("::: "+image_src[image_src.length-1]);
		image_src=image_src[image_src.length-1];
		
		
		 var formData = new FormData();
		 var inputFile = $("input[name='uploadFile']");
		 var files = inputFile[0].files;
		 
		 console.log("files : "+files);
		 
		 for(var i=0;i<files.length;i++){
			 formData.append("uploadFile",files[i]);
		 }
		 formData.append("Time",""+dtime);
		 
		 $.ajax({
			url:'/uploads',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			success: function(result){
				$("div#board_contents").append("<img src=/img/"+result+" style='width:850px;height:auto;'>"); 
			}
		 });

		 
		 
	}); 
	
	
</script>
</html>