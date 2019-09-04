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
		.col-1, .col-2, .col-3, .col-4, .col-7{
			padding:0;
		}		
		.contents{
			border : 1px solid gray;
			border-radius : 10px;
		}
		.board_display{
			margin:50px 0 50px 0;
		}
		
		.filename{
			color:black;
		}
		.btn-modify{
			margin-left:10px;
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
		<div class="form-group col-4">
			<h5>작성자</h5>	  
			<input type="text" class="form-control" name="writer" value="${board.writer}" readonly>	  
		</div>
		<div class="form-group col-4">
			<h5>작성일</h5>	  
			<input type="text" class="form-control" name="registered" value="${board.registered}" readonly>	  
		</div>
		<div class="form-group col-1">
			<h5>조회수</h5>	  
			<input type="text" class="form-control" name="views" value="${board.views}" readonly>	  
		</div>
		<div class="form-group">
			<h5>내용</h5>
			<input type="text" class="form-control" name="contents" value="${board.contents}" readonly style="min-height:100px;">
		</div>
		<div class="form-group">
			<label>첨부파일</label>
			<c:forEach items="${files}" var="file">
				<c:if test="${file.name ne ''}">
					<a class="filename" href="<%=request.getContextPath()%>/board/download?fileName=${file.name}">${file.fileName}</a>
				</c:if>
			</c:forEach>
			<c:if test="${file.name eq ''}">
				없음
			</c:if>
		</div>
		<div class="mt-3">
	  		<a href="<%=request.getContextPath()%>/board/list?page=${cri.page}&type=${cri.type}&search=${cri.search}"><button class="btn btn-outline-secondary">게시판 목록</button></a>
	  		<c:if test="${user.id eq board.writer}">
	  			<a class="float-right btn-modify" href="<%=request.getContextPath()%>/board/modify?num=${board.num}&page=${cri.page}&type=${cri.type}&search=${cri.search}"><button class="btn btn-outline-secondary">수정하기</button></a>
	  			<a class="float-right" href="<%=request.getContextPath()%>/board/delete?num=${board.num}"><button class="btn btn-outline-secondary">삭제하기</button></a>
			</c:if>  			
	    </div>	    			
	</div>
</div>
