<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<style>
		a{
			text-decoration:none;
			color:white;
		}
		.container{
			max-width:1024px;
			padding:0;
		}		
		.navbar{
			position:relative;
			height:38px;
		}
		.navbar-bgcolor{
			background-color:#0b0e1e;
		}
		.logo{
			max-width:1024px;
			margin-left:auto;
			margin-right:auto;
			z-index:2;
		}
		.logo-box{
			position:relative;			
			background-color:#111836;
			display:inline-block;
			width:80px;
			height:158px;
			text-align:center;
			z-index:5;
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
		
	</style>
</head>
<nav class="navbar navbar-expand-md navbar-bgcolor navbar-dark">	
	<div class="container flex-row-reverse">				
	  	<a class="navbar-brand" href="#">Login</a>
	  	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
	    	<span class="navbar-toggler-icon"></span>
	  	</button>	  	
	</div> 
</nav>
<div class="logo">
	<div class="logo-box">
		<div class="logo_img">
			<a href="#"><img src="<%=request.getContextPath()%>/resources/img/tottenham_logo.png"></a>
		</div>
		<div class="logo_icon">
			<a href="#"><i class="fas fa-bars"></i><br><p class="icon_txt">MENU</p></a>
		</div>
	</div>
</div>