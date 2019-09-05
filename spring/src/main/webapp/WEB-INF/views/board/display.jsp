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
		.contents-bottom-line{
			width: 100%;
		    background-color: gray;
		    height: 1px;
		    margin:15px 0 15px 0;
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
			<div class="file-contents">
				<c:forEach items="${files}" var="file">
					<c:if test="${file.name ne ''}">
						<div class="form-control" style="margin-top:10px; background-color:#e9ecef;">
							<a class="filename" href="<%=request.getContextPath()%>/board/download?fileName=${file.name}">${file.fileName}</a>
						</div>
					</c:if>
				</c:forEach>
				<c:if test="${file.name eq ''}">
					없음
				</c:if>
			</div>
		</div>
		<div class="contents-bottom-line"></div>		
		<div class="comment" id="comment">
			<div class="comment-contents">
				<!-- 댓글 등록창 -->
				<div class="comment-regiser-box">
					<input type="hidden" name="category" value="댓글">
					<input type="hidden" name="board_no" value="">
					<div class="text-box clearfix">
						<h5 style="float: left;">댓글</h5>							
					</div>
					<div class="contents-box">
						<input name="contents" style="width:50%; height:100px;">
					</div>
					<div class="button-box clearfix">
						<button type="button" id="comment-add" class="btn btn-outline-secondary" style="margin:15px 0 15px 0">
							<p>등록하기</p>
						</button>
					</div>
				</div>
				<!-- 댓글 게시판 -->
				<div class="comment-board">
					<table class="table">
						<tr class="table-title" id="comment-title">
							<th width="15%">작성자</th>
							<th width="40%">내용</th>
							<th width="25%">등록일</th>
							<th width="10%">답글</th>								
						</tr>
						<c:if test="${commentList ne null}">
							<c:forEach items="${commentList}" var="comment">
								<tr class="table-contents">
									<th>${comment.writer}</th>
									<th>${comment.contents}</th>
									<th>${comment.time}</th>
									<th>작성하기</th>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>				
			</div>
		</div>
		<div class="contents-bottom-line"></div>
		<div class="mt-3">
	  		<a href="<%=request.getContextPath()%>/board/list?page=${cri.page}&type=${cri.type}&search=${cri.search}"><button class="btn btn-outline-secondary">게시판 목록</button></a>
	  		<c:if test="${user.id eq board.writer}">
	  			<a class="float-right btn-modify" href="<%=request.getContextPath()%>/board/modify?num=${board.num}&page=${cri.page}&type=${cri.type}&search=${cri.search}"><button class="btn btn-outline-secondary">수정하기</button></a>
	  			<a class="float-right" href="<%=request.getContextPath()%>/board/delete?num=${board.num}"><button class="btn btn-outline-secondary">삭제하기</button></a>
			</c:if>  			
	    </div>	    			
	</div>
</div>
