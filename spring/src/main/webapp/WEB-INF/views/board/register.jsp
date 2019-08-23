<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<style>
		.board_list_bg{
			position:relative;
			overflow:hidden;
			height:400px;			
			z-index:1;						
		}
		.blb_txt{
			position:absolute;
			color:#fff;			
			z-index:3;
			top:5em;
			left:18em;						
		}
		.blb_container{
			position:relative;
			background-color:#0b0e1e;			
		}		
		.blb_background>img{
			width:100%;			
			opacity:0.5;
		}
		.board_register{
			margin-top:50px;
		}
		.note-editor{
			z-index:10;
		}		
	</style>
	<script>
		$(document).ready(function(){	
			$('#summernote').summernote({
			  placeholder: 'Hello bootstrap 4',
			  tabsize: 2,
			  height: 100,
			  lang: 'ko-KR'
			});
		});
	</script>
</head>
<div class="board_list_bg">
	<h1 class="blb_txt">게시물 등록</h1>
	<div class="blb_container">				
		<div class="blb_background">
			<img src="<%=request.getContextPath()%>/resources/img/board_list_bg.jpg">			
		</div>		
	</div>
</div>
<div class="container board_register">
	<div style="min-height: 561px;">		
		<form method="post" action="<%=request.getContextPath()%>/board/register" enctype="multipart/form-data">
			<div class="form-group">	  
				<input type="text" class="form-control" name="title" placeholder="제목">	  
			</div>
			<div class="form-group">	  
				<input type="text" class="form-control" name="writer" value="${user.id}" readonly>	  
			</div>
			<textarea id="summernote" name="contents"></textarea>
			<input type="file" class="form-control-file border" name="file2">
			<button type="submit" class="btn btn-outline-secondary">등록</button>
			<a href="<%=request.getContextPath()%>/board/list"><button type="button" class="btn btn-outline-secondary">목록</button></a>				
		</form>
	</div>
</div>
