<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<style>
		.mainbg{
			position:absolute;
			overflow:hidden;
			height:700px;
			top:38px;
			z-index:1;						
		}
		.mainbg_container{
			position:relative;
			background-color:#0b0e1e;
			
		}
		.main_txt{
			position:absolute;
			color:#fff;			
			z-index:3;
			top:10em;
			left:10em;						
		}
		.main_background{			
			background-size:cover;
			width:100%;
		}
		.main_background>img{
			width:1563px;
			opacity:0.5;
		}
	</style>
</head>
<div class="mainbg">
	<h1 class="main_txt">토트넘 홈페이지에 오신것을 환영합니다!</h1>
	<div class="mainbg_container">				
		<div class="main_background">
			<img src="<%=request.getContextPath()%>/resources/img/main_bg.jpg">			
		</div>		
	</div>
</div>

