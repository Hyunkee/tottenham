<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<style>
		.container.register{
			padding: 60px 0 80px 0;
		}
		.row{
			margin: 10px 0px;
		}
		.logo_img{
			text-align:center;
		}
		.logo_img>img{			
			width:30px;
			height:73px;
			margin:10px 0 10px 0;	
		}
	</style>
</head>
<div class="container register">
	<div class="offset-4 col-5 border border-dark mt-5">
		<div class="logo_img">
			<img src="<%=request.getContextPath()%>/resources/img/tottenham_logo_c.png">
		</div>
		<form method="post" action="" id="register">
			<div class="row">
				<label class="col-4">아이디</label>
				<input type="text"class="form-control col-7" placeholder="아이디" name="id">					
			</div>						
			<div>
				<button type="button" class="btn btn-secondary offset-4 col-7" id="dup">아이디 중복확인</button>
			</div>				
			<div class="row">
				<label class="col-4">비밀번호</label>
				<input type="password"class="form-control col-7" placeholder="비밀번호" name="pw" id="pw">
			</div>
			<div class="row">
				<label class="col-4">비밀번호확인</label>
				<input type="password"class="form-control col-7" placeholder="비밀번호확인" name="pw2">
			</div>
			<div class="row">
				<label class="col-4">이름</label>
				<input type="text"class="form-control col-7" placeholder="이름" name="name">					
			</div>	
			<div class="row">
				<label class="col-4">성별</label>
				<div class="col-8" >
					<label class="form-check-label col-5">
						<input type="radio" class="form-check-input"  name="gender" value="M" checked>남성
					</label>
					<label class="form-check-label">
						<input type="radio" class="form-check-input"  name="gender" value="W">여성
					</label>					
				</div>
			</div>
			<div class="row">
				<label class="col-4">이메일</label>
				<input type="email"class="form-control col-7" placeholder="이메일" name="email">
			</div>
			<div class="offset-8 col-3 clearfix p-0">
				<button class="btn btn-secondary float-right" id="join">가입</button>
			</div>
		</form>
	</div>
</div>	