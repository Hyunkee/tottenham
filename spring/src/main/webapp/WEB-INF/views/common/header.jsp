<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<script>		
		$(document).ready(function(){
			$('.logo').click(function(){				
				$('.navbar_logo').addClass('display-none');
				$('.logo_menu').toggleClass('display-block');				
			});
			$('.menu_handle').click(function(){				
				$('.navbar_logo').removeClass('display-none');
				$('.logo_menu').toggleClass('display-block');				
			});
		});
	</script>
	<style>
		a{
			text-decoration:none;
			color:white;
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
		<div class="container flex-row-reverse">							
		  	<a class="navbar-brand" href="<%=request.getContextPath()%>/member/signin">Login</a>
		  	<a class="navbar-brand" href="<%=request.getContextPath()%>/">Home</a>		  		  	
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
</div>
<div class="logo_menu">
	<div class="container">
		<div class="menu_handle">
			<div class="logo_img">
				<a href="#"><img src="<%=request.getContextPath()%>/resources/img/tottenham_logo.png"></a>
			</div>
			<div class="logo_icon">
				<a href="#"><i class="fas fa-times"></i></a>
			</div>
		</div>
		<div class="menu_content">
			<div class="content_link">
				<a class="cl cl_team" href="#">Team</a>
			</div>
			<div class="content_link">
				<a class="cl cl_team" href="#">Player</a>
			</div>
			<div class="content_link">
				<a class="cl cl_board" href="#">Board</a>
			</div>
			<div class="content_link">
				<a class="cl cl_mypage" href="#">My Page</a>
			</div>
		</div>
	</div>
</div>
