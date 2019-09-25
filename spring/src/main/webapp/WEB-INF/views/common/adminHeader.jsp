<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>	
	<style>
		a{
			text-decoration:none;
			color:white;
		}
		a:hover{
			color:white;
		}
		p{
			margin:0;
			padding:0;
		}		
		.container{
			max-width:1024px;
			padding:0;
		}
		.navbar_logo{
			position:fixed;
			top:0;
			width:100%;
			z-index:20;
		}		
		.navbar{
			position:relative;
			height:38px;
		}
		.navbar-bgcolor{
			background-color:#0b0e1e;
		}
		.logo{
			position:absolute;
			max-width:1024px;
			margin-left:auto;
			margin-right:auto;
			z-index:2;
			left:17.4em;
		}
		.logo-box{
			position:relative;			
			background-color:#111836;
			display:inline-block;
			width:80px;
			height:158px;
			text-align:center;			
		}
		.logo-box>.logo_img{
			position:relative;
						
		}
		.logo_img>a>img{
			width:30px;
			height:73px;
			margin:10px 0 10px 0;	
		}
		.logo_icon>a>i{
			width:20px;
		}
		.logo_icon>a>p{
			margin:10px 0 0 0;
		}
		.logo_menu{
			display:none;
			position:fixed;
			overflow:auto;
			top:0;
			right:0;
			bottom:0;
			left:0;
			background-color:rgba(15,20,42,.95);
			color:#fff;
			z-index:30;
		}		
		.logo_menu .container{
			margin-top:40px;
		}
		.logo_menu .menu_handle{
			display:inline-block;
		}
		.logo_menu .logo_icon{
			margin-left:5px;
		}
		.logo_menu .menu_content{
			position:relative;
			width:820px;
			padding-left:250px;
			padding-bottom:40px;			
		}
		.menu_content>.content_link>.cl{
			text-transform:uppercase;
			display:block;
			color:#fff;
			font-size:36px;
			font-weight: 700;
		}
		.menu_content>.content_link>.cl.lighter{
			color:#e0e721;
			font-weight:lighter;
		}
		.menu_content>.content_link>.cl.cl_find{
			display:inline-block;
		}
		.cl_find_contents{
			display:inline-block;
			margin-left:40px;
		}		
		.display-block{
			display:block;
		}
		.display-none{
			display:none;
		}
	</style>
</head>
<div class="navbar_logo">
	<nav class="navbar navbar-expand-md navbar-bgcolor navbar-dark">	
		<div class="container flex-row-reverse" style="display:block;">
			<div class="float-left">
				<a class="navbar-brand" href="<%=request.getContextPath()%>/">Home</a>
			</div>
			<div class="float-right">
				<c:if test="${user eq null}">						
			  		<a class="navbar-brand" href="<%=request.getContextPath()%>/member/signin">Login</a>
		  		</c:if>
		  		<c:if test="${user.authority eq 'ADMIN'}">						
			  		<a class="navbar-brand" href="<%=request.getContextPath()%>/admin/board/list">BoardList</a>
		  		</c:if>
		  		<c:if test="${user.authority eq 'ADMIN'}">						
			  		<a class="navbar-brand" href="<%=request.getContextPath()%>/admin/user/list">UserList</a>
		  		</c:if>
		  		<c:if test="${user.authority eq 'ADMIN'}">	  							
		  			<a class="navbar-brand" href="#">관리자 페이지</a>
	  			</c:if>
		  		<c:if test="${user ne null}">	  							
		  			<a class="navbar-brand" href="<%=request.getContextPath()%>/member/signout">Logout</a>
	  			</c:if>
		  	</div>
		</div> 
	</nav>	
</div>

