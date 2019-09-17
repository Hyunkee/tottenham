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
		.container.board-list{
			margin-bottom:100px;
		}
		td>a{
			color:gray;
		}		
		td>a:hover{
			color:gray;
		}
	</style>
	<script type="text/javascript">
	
	</script>
</head>
<div class="board_list_bg">
	<h1 class="blb_txt">게시판</h1>
	<div class="blb_container">				
		<div class="blb_background">
			<img src="<%=request.getContextPath()%>/resources/img/board_list_bg2.jpg">			
		</div>		
	</div>
</div>
<div class="container board-list">
	<div>
	  	<form action="<%=request.getContextPath()%>/board/list" method="get" class="row mb-3 mt-3">
		  	<div class="form-group col-2 mb-0">	  
			  <select class="form-control" name="type">
			    <option value="0" <c:if test="${pageMaker.criteria.type == 0 }">selected</c:if>>선택</option>
			    <option value="1" <c:if test="${pageMaker.criteria.type == 1 }">selected</c:if>>제목</option>
			    <option value="2" <c:if test="${pageMaker.criteria.type == 2 }">selected</c:if>>작성자</option>
			    <option value="3" <c:if test="${pageMaker.criteria.type == 3 }">selected</c:if>>내용</option>
			  </select>
			</div>
			<div class="form-group col-4 mb-0">	  
				 <input type="text" class="form-control" name="search" value="${pageMaker.criteria.search}">	  
			</div>
			<button type="submit" class="btn btn-outline-secondary">검색</button>
		</form>
 	</div>
 	<table class="table table-hover">
	    <thead>
	      <tr>
	        <th>번호</th>
	        <th>제목</th>
	        <th>작성자</th>
	        <th>작성일</th>
	        <th>조회수</th>        
	      </tr>
	    </thead>
	    <tbody>
	      <c:if test="${list.size() ne 0}">
	      	  <c:forEach items="${list}" var="board">
			      <tr>
			        <td>${board.num}</td>
			        <td>
			        	<a href="<%=request.getContextPath()%>/board/display?num=${board.num}&page=${pageMaker.criteria.page}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}">
			        		${board.title}<c:if test="${board.comment_count > 0}"><span style="color:blue;">(${board.comment_count})</span></c:if>
			        	</a>
			        </td>
			        <td>${board.writer}</td>
			        <td>${board.registeredUntilDay}</td>
			        <td>${board.views}</td>
			      </tr>
		      </c:forEach>
	      </c:if>
	      <c:if test="${list.size() eq 0}">
		      <tr>
		        <td colspan="5">게시글이 존재하지 않습니다.</td>	        
		      </tr>
	      </c:if>            
	    </tbody>
 	</table>
 	<ul class="pagination" style="justify-content: center;">
    <c:if test="${pageMaker.prev}">
        <li class="page-item">
            <a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${pageMaker.startPage-1}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}"><i class="fas fa-chevron-left"></i></a>
        </li>
    </c:if>
    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage}" var="index">
    	<c:choose>
    		<c:when test="${pageMaker.criteria.page != index}">
		        <li class="page-item">
		            <a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${index}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}">${index}</a>
		        </li>
	        </c:when>
	        <c:otherwise>
	        	<li class="page-item active">
		            <a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${index}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}">${index}</a>
		        </li>
	        </c:otherwise>
        </c:choose>        
    </c:forEach>    
    <c:if test="${pageMaker.next}">
        <li class="page-item">
            <a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${pageMaker.endPage+1}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}"><i class="fas fa-chevron-right"></i></a>
        </li>
    </c:if>
  </ul>
  <c:if test="${user ne null }">
	  <div>
	  	<a href="<%=request.getContextPath()%>/board/register"><button class="btn btn-outline-secondary float-right">등록하기</button></a>
	  </div>
  </c:if>
</div>