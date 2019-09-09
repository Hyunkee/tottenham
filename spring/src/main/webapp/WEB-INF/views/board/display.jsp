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
		.comment .table td{
			padding: 0;
		}
	</style>
	<script>
		$(document).ready(function(){	
			//댓글 등록 클릭 시
			$('#comment-add').click(function(){
				if($('input[name=id]').val() == ""){
					location.href = '<%=request.getContextPath()%>/signin';
				}				
				var board_num = $('.comment-regiser-box input[name=board_num]').val();
				var writer = $('input[name=id]').val();				
				var contents = $('#contents').val();
				$.ajax({ 
			        async:true,	//async:true - 비동기화(동시 작업 처리)	async:false - 동기화(순차적 작업 처리) 
			        type:'POST',	//POST방식으로 전송
			        data:{"board_num": board_num, "writer": writer, "contents": contents},	//컨트롤러에게 넘겨주는 매개변수명 -> {'id':id} 형식과 같고 {}를 사용할 때는 변수를 여러 개 사용할 때
			        url:"<%=request.getContextPath()%>/board/addComment",
			        dataType:"json",
			        //contentType:"application/json; charset=UTF-8",
			        success : function(data){	//요청이 성공해서 보내준 값을 저장할 변수명
			  			
			        }
				});
			});			

			//댓글 삭제 클릭 시
			$('.comment-delete-button').click(function(){
				$(this).parents('.table-contents').remove();
				var writer = $('input[name=id]').val()
				var num = $(this).siblings('input[name=comment_num]').val();
				$.ajax({ 
			        async:true,	//async:true - 비동기화(동시 작업 처리)	async:false - 동기화(순차적 작업 처리)
			        type:'POST',	//POST방식으로 전송
			        data: {"writer": writer, "num": num},
			        url:"<%=request.getContextPath()%>/board/deleteComment",
			        dataType:"json",
			       	//contentType:"application/json; charset=UTF-8",
			        success : function(data){	//요청이 성공해서 보내준 값을 저장할 변수명
			        	if(data){
			        		alert("댓글이 삭제 되었습니다.");
			        	}else{
			        		alert("요청이 실패했습니다.");
			        	}
			        }
				});
			});
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
		<!-- 댓글 컨텐츠 시작  -->		
		<div class="comment" id="comment">
			<div class="comment-contents">
				<!-- 댓글 등록창 -->
				<div class="comment-regiser-box">					
					<input type="hidden" name="board_num" value="${board.num}">
					<input type="hidden" name="id" value="${user.id}">					
					<div class="contents-box">
						<textarea style="width: 1024px" rows="3" cols="30" id="contents" placeholder="댓글을 입력하세요"></textarea>
					</div>
					<div class="button-box clearfix">
						<button type="button" id="comment-add">
							<h4>등록하기</h4>
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
						</tr>
						<c:if test="${commentList ne null}">
							<c:forEach items="${commentList}" var="comment">
								<tr class="table-contents">
									<th>${comment.writer}</th>
									<th>${comment.contents}</th>
									<th>${comment.registered}</th>
									<th>
										<input type="hidden" value="${comment.board_num}" name="board_num">
										<c:if test="${user.id eq comment.writer}">
											<button class="comment-delete-button">삭제</button>
										</c:if>
									</th>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>				
			</div>
		</div>		
		<!-- 댓글 컨텐츠 끝 -->		
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
