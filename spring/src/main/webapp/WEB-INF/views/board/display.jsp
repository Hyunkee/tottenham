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
		.contents{
			border : 1px solid gray;
			border-radius : 10px;
		}
		.filename{
			color:black;
		}
	</style>
	<script>
		$(document).ready(function(){	
			
		});
	</script>
</head>
<div class="board_list_bg">
	<h1 class="blb_txt">게시글 상세</h1>
	<div class="blb_container">				
		<div class="blb_background">
			<img src="<%=request.getContextPath()%>/resources/img/board_list_bg2.jpg">			
		</div>		
	</div>
</div>
<div class="container">
	<div class="board_display">				
		<div class="form-group col-4">
			<h5>제목</h5>	  
			<input type="text" class="form-control" name="title" value="${board.title}" readonly>	  
		</div>
		<div class="form-group col-7">
			<h5>작성자</h5>	  
			<input type="text" class="form-control" name="writer" value="${board.writer}" readonly>	  
		</div>
		<div class="form-group col-10">
			<h5>내용</h5>
			<input type="text" class="form-control" name="contents" value="${board.contents}" readonly style="min-height:100px;">
		</div>
		<div class="form-group">
			<label>첨부파일</label>
			<c:if test="${board.fileName ne ''}">
				<a class="filename" href="<%=request.getContextPath()%>/board/download?fileName=${board.file}">${board.fileName}</a>
			</c:if>
			<c:if test="${board.fileName eq ''}">
				없음
			</c:if>
		</div>
		<div class="mt-3">
	  		<a href="<%=request.getContextPath()%>/board/list?page=${cri.page}&type=${cri.type}&search=${cri.search}"><button class="btn btn-outline-info">목록</button></a>
	  		<c:if test="${user.id eq board.writer}">
	  			<a href="<%=request.getContextPath()%>/board/modify?num=${board.num}&page=${cri.page}&type=${cri.type}&search=${cri.search}"><button class="btn btn-outline-info">수정하기</button></a>
	  			<a href="<%=request.getContextPath()%>/board/delete?num=${board.num}"><button class="btn btn-outline-info">삭제하기</button></a>
			</c:if>  			
	    </div>	    			
	</div>
</div>
