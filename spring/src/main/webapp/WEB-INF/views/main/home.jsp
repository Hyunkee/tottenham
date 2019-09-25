<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<style>
		.display-none{
			display:none;
		}
		.display-block{
			display:block;
		}
		a:hover{
			text-decoration:none;
			color:#0b0e1e;
		}
		.mainbg{
			position:relative;
			overflow:hidden;
			height:700px;			
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
		.fakeimg {
		    height: 400px;
		    background: #aaa;
		    overflow: hidden;
		}
		
		.scale {
		  transform: scale(1);
		  -webkit-transform: scale(1);
		  -moz-transform: scale(1);
		  -ms-transform: scale(1);
		  -o-transform: scale(1);
		  transition: all 1s ease-in-out; 
		}
		.scale:hover {
		  transform: scale(1.2);
		  -webkit-transform: scale(1.2);
		  -moz-transform: scale(1.2);
		  -ms-transform: scale(1.2);
		  -o-transform: scale(1.2);
		  opacity:0.5;
		}
		.mc_img{
			position:relative;
			width:512px;
			height:400px;
			overflow:hidden;
			background-color:#111836;
		}
		.mc_img .mci_txt{
			position:absolute;
			top:20em;
			left:2em;
			z-index:5;
		}
		.mc_img .mci_txt>a>h4{			
			font-size:30px;
			font-weight:800;
		}
		.mc_img2{
			width:248px;
			height:200px;
			overflow:hidden;
		}		
		.fakeimg2{			
			height: 200px;
			background: #aaa;
		}
		.player_list_img>img{
			margin-top: -60px;
			margin-left: -200px;
		}
		.football_img>img{
			width:269px;
			height:200px;
		}
		.col-sm-6,.col-sm-3{
			padding-right:0;			
		}
		.col-sm-3{
			margin: 50px 0 70px 0;
		}
	</style>
	<script>
		$(document).ready(function(){
			$('.mc_img').hover(function(){
				$(this).children('.mci_txt').toggleClass('display-none','display-block');
			})			
		});		
	</script>
</head>
<div class="clearfix">
	<div class="mainbg">
		<h1 class="main_txt">토트넘 홈페이지에 오신것을 환영합니다!</h1>		
		<div class="mainbg_container">				
			<div class="main_background">
				<img src="<%=request.getContextPath()%>/resources/img/main_bg.jpg">			
			</div>		
		</div>
	</div>
	<div class="main_contents">
		<div class="container" style="margin-top:50px">
		  <div class="row">
		    <div class="col-sm-6">
		    	<div class="mc_img">
		    		<div class="mci_txt display-none">
		    			<a href="<%=request.getContextPath()%>/league/list"><h4>LEAGUE<i class="fas fa-angle-double-right" style="margin-left:20px;"></i></h4></a>
		    		</div>
			      	<div class="fakeimg scale">			      		
			      		<img src="<%=request.getContextPath()%>/resources/img/board_list.jpg" style="width: 600px; height:400px;">
			      	</div>
		      	</div>		      		      
		    </div>
		    <div class="col-sm-6">
		    	<div class="mc_img">
		    		<div class="mci_txt display-none">
		    			<a href="<%=request.getContextPath()%>/team/player"><h4>PLAYERS<i class="fas fa-angle-double-right" style="margin-left:20px;"></i></h4></a>
		    		</div>
			    	<div class="fakeimg player_list_img scale">
			    		<img src="<%=request.getContextPath()%>/resources/img/player_list.jpg">
			    	</div>
		    	</div>
		    </div>
		    <div class="col-sm-3">	      		      
		      	<div class="mc_img2">
		      		<div class="mci_txt display-none">
		    			<h4>선수 리스트</h4>
		    		</div>
			    	<div class="fakeimg2 football_img scale">
			    		<img src="<%=request.getContextPath()%>/resources/img/football.jpg">
			    	</div>
		    	</div>
		    </div>
		    <div class="col-sm-3">
		      	<div class="mc_img2">
			    	<div class="fakeimg2 football_img scale">
			    		<img src="<%=request.getContextPath()%>/resources/img/note.jpg">
			    	</div>
		    	</div>
		    </div>
		    <div class="col-sm-3">
		     	<div class="mc_img2">
			    	<div class="fakeimg2 football_img scale">
			    		<img src="<%=request.getContextPath()%>/resources/img/soccer_shoes.jpg">
			    	</div>
		    	</div>
		    </div>
		    <div class="col-sm-3">
		      	<div class="mc_img2">
			    	<div class="fakeimg2 football_img scale">
			    		<img src="<%=request.getContextPath()%>/resources/img/soccer_shoes2.jpg">
			    	</div>
		    	</div>
		    </div>
		  </div>
		</div>
	</div>
</div>

