<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<style>
		.board_list_bg{
			position:relative;
			overflow:hidden;
			height:500px;			
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
			height:150%;
		}
		.board_register{
			margin-top:50px;
		}
		.board_register .btn-register{
			margin-top:15px;
		}
		.board_register .btn-list{
			margin-top:15px;
		}
		
		.note-editor{
			z-index:10;
		}		
	</style>
	<script>
		$(document).ready(function(){
			addInputEvent();
			$('#summernote').summernote({
			  placeholder: 'Hello bootstrap 4',
			  tabsize: 2,
			  height: 100,
			  lang: 'ko-KR'
			});			
			function addInputEvent(){
				$('input[name=file2]').change(function(){
					var str = '<input type="file" class="form-control-file border" name="file2" style="margin-top:5px;" value="">'
					$(this).after(str);
					addInputEvent();
				})
			}
		});
	</script>
</head>
<div class="board_list_bg">
	<h1 class="blb_txt">게시물 등록</h1>
	<div class="blb_container">				
		<div class="blb_background">
			<img src="<%=request.getContextPath()%>/resources/img/board_list_bg2.jpg">			
		</div>		
	</div>
</div>
<div class="container board_register">
	<div style="min-height: 561px;">		
		<form method="post" action="<%=request.getContextPath()%>/board/register" enctype="multipart/form-data">
			<div class="form-group">
				<h5>제목</h5>	  
				<input type="text" class="form-control" name="title" placeholder="제목">	  
			</div>
			<div class="form-group">
				<h5>작성자</h5>	  
				<input type="text" class="form-control" name="writer" value="${user.id}" readonly>	  
			</div>
			<textarea id="summernote" name="contents"></textarea>
			<input type="file" class="form-control-file border" name="file2" style="margin-top:15px;">
			<button type="submit" class="btn btn-outline-secondary float-right btn-register">등록하기</button>
			<a href="<%=request.getContextPath()%>/board/list"><button type="button" class="btn btn-outline-secondary btn-list">게시판 목록</button></a>				
		</form>
	</div>
</div>
