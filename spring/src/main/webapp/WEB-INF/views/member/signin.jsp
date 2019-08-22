<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<style>
		.signin_bg{
			position:relative;
			overflow:hidden;
			height:400px;			
			z-index:1;						
		}
		.sb_container{
			position:relative;
			background-color:#0b0e1e;
			
		}
		.sb_txt{
			position:absolute;
			color:#fff;			
			z-index:3;
			top:5em;
			left:18em;						
		}
		.sb_background>img{
			width:100%;			
			opacity:0.5;
		}
		.login-box{
			border: 1px solid black;
			width : 400px;			
			margin: 100px auto 0;
			padding:20px;
		}
		.register{
			margin-top:10px;
		}
		.passwordfind{
			margin-top:20px;
		}
		.passwordfind>a{
			color:black;
		}
		.pf_line{
			display:inline-block;
			background-color:black;
			width:1px;
			height:12px;
			margin:0 5px 0 5px;
		}
	</style>
	<script type="text/javascript">
		$(document).ready(function(){
			$('input[name=id]').focus();
		});
	</script>
</head>
<div class="signin_bg">
	<h1 class="sb_txt">로그인</h1>
	<div class="sb_container">				
		<div class="sb_background">
			<img src="<%=request.getContextPath()%>/resources/img/signin_bg.jpg">			
		</div>		
	</div>
</div>
<div style="height: 350px">	
	<div class="login-box">
		<form method="post" action="<%=request.getContextPath()%>/member/signin">
			<div class="form-group">		  
			  <input type="text" class="form-control" placeholder="아이디" name="id">
			</div>
			<div class="form-group">		  
			  <input type="password" class="form-control" placeholder="패스워드" name="pw">
			</div>
			<button type="submit" class="btn btn-outline-secondary col-12">로그인</button>
			<a href="<%=request.getContextPath()%>/member/register"><button type="button" class="btn btn-outline-secondary col-12 register">회원가입</button></a>
			<div class="offset-5 col-8 clearfix p-0 passwordfind">
				<a href="<%=request.getContextPath()%>/member/find">아이디 찾기</a>
				<div class="pf_line"></div>
				<a href="<%=request.getContextPath()%>/member/find">비밀번호 찾기</a>
			</div>			
		</form>		
	</div>	
</div>