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
		.note-editor{
			z-index:10;
		}	
		.filename{
			color:black;
		}
	</style>
	<script>
		$(document).ready(function(){
			addInputEvent();
			$('#summernote').summernote({
			  placeholder: 'Hello bootstrap 4',
			  tabsize: 2,
			  height: 300,
			  lang: 'ko-KR'
			});
			$('.close').click(function(){
				$('#fileLink').remove();
				$('input[name=fileOri]').val('');
				$(this).css('display','none');
			});
			function addInputEvent(){
				$('input[name=file2]').change(function(){
					var str = '<input type="file" class="form-control" name="file2" value="">'
					$(this).after(str);
					addInputEvent();
				})
			}
		});
	</script>
</head>
<div class="board_list_bg">
	<h1 class="blb_txt">게시글 수정</h1>
	<div class="blb_container">				
		<div class="blb_background">
			<img src="<%=request.getContextPath()%>/resources/img/board_list_bg2.jpg">			
		</div>		
	</div>
</div>
<div class="container">
	<div style="min-height: 561px;">	
		<form method="post" action="<%=request.getContextPath()%>/board/modify" enctype="multipart/form-data">			  
			<input type="hidden" name="num" value="${board.num}">
			<div class="form-group">	  
				<input type="text" class="form-control" name="title" value="${board.title}">	  
			</div>
			<div class="form-group">	  
				<input type="text" class="form-control" name="writer" value="${board.writer}" readonly>	  
			</div>
			<textarea id="summernote" name="contents">${board.contents}</textarea>
			<div class="form-group">
				<label>첨부파일</label>
				<c:forEach items="${files}" var="file">
					<div>
						<c:if test="${file.name ne ''}">
							<a class="filename" href="<%=request.getContextPath()%>/board/download?fileName=${file.name}" id="fileLink">${file.fileName}</a>
							<i class="fas fa-times close"></i>
							<input type="hidden" name="fileOri" value="${file.fileName}">
						</c:if>
					</div>
				</c:forEach>
				<c:if test="${file.name eq ''}">
					없음
				</c:if>
			</div>
			<input type="file" class="form-control-file border" name="file2">
			<button type="submit" class="btn btn-outline-secondary float-right">수정하기</button>
			<a href="<%=request.getContextPath()%>/board/list?page=${cri.page}&type=${cri.type}&search=${cri.search}"><button class="btn btn-outline-secondary">게시판 목록</button></a>				
		</form>	
	</div>
</div>
