<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<script type="text/javascript">
		$(document).ready(function(){
			$('select[name=validState]').change(function(){
				location.href = '<%=request.getContextPath()%>/admin/board/update?'+$(this).val();
			})
		})
	</script>
	<style>
		.bl_txt{
			text-align:center;
		}
		.bl_txt>h1{		
			padding-bottom:40px;
		}
		.table tr th>a{
			color:gray;
		}
	</style>
</head>	
<div class="container" style="margin-top:80px">
	<div class="bl_txt">
		<h1>Board List</h1>
	</div>
	<form class="float-right input-group w-50" method="get" action="<%=request.getContextPath()%>/admin/board/list">
		<select name="type" class="float-left form-control">
			<option value="0">선택</option>
			<option value="1" <c:if test="${pageMaker.criteria.type eq 1}">selected</c:if>>제목</option>
			<option value="2" <c:if test="${pageMaker.criteria.type eq 2}">selected</c:if>>내용</option>
			<option value="3" <c:if test="${pageMaker.criteria.type eq 3}">selected</c:if>>작성자</option>
		</select>
			<input type="text" name="search" class="float-left form-control" value="${pageMaker.criteria.search}">
		<button type="submit" class="btn btn-outline-secondary float-left">검색</button>
	</form>
	<table class="table">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일</th>
			<th>조회수</th>
			<th>상태</th>
			<th>수정</th>
		</tr>
		<c:forEach var="board" items="${list}">
			<tr>
				<th>${board.num}</th>
				<th><a href="<%=request.getContextPath()%>/board/display?num=${board.num}">${board.title}</a></th>
				<th>${board.writer}</th>
				<th>${board.registered}</th>
				<th>${board.views}</th>
				<th>${board.valid}</th>
				<th>					
					<select name="validState">
						<option  value="num=${board.num}&valid=D&page=${pageMaker.criteria.page}" <c:if test="${board.valid eq 'D'}">selected</c:if> >삭제</option>
						<option  value="num=${board.num}&valid=I&page=${pageMaker.criteria.page}"<c:if test="${board.valid eq 'I'}">selected</c:if> >게시</option>
					</select>
				</th>
			</tr>
		</c:forEach>
	</table>
	<ul class="pagination" style="justify-content: center;">
    <c:if test="${pageMaker.prev}">
       <li class="page-item">
          <a class="page-link" href="<%=request.getContextPath()%>/admin/board/list?page=${pageMaker.startPage-1}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}">Previous</a>
       </li>
    </c:if>
    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage}" var="index">
   		<c:if test="${pageMaker.criteria.page == index }">
        <li class="page-item active">
           <a class="page-link" href="<%=request.getContextPath()%>/admin/board/list?page=${index}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}">${index}</a>
        </li>
       </c:if>
       <c:if test="${pageMaker.criteria.page != index }">
        <li class="page-item ">
           <a class="page-link" href="<%=request.getContextPath()%>/admin/board/list?page=${index}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}">${index}</a>
        </li>
       </c:if>
    </c:forEach>
    <c:if test="${pageMaker.next}">
       <li class="page-item">
          <a class="page-link" href="<%=request.getContextPath()%>/admin/board/list?page=${pageMaker.endPage+1}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}">Next</a>
       </li>
    </c:if>
	</ul>	
	<a href="<%=request.getContextPath()%>/board/register">
		<button type="button" class="btn btn-outline-secondary" style="margin-bottom:40px;">등록</button>
	</a>
</div>


