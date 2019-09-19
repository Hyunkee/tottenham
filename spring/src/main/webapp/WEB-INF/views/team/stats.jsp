<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<style>
		.underline{
			width:100%;
			height:5px;
			border-bottom: 5px solid #e0e721;
		}
		.team_player_bg{
			position:relative;
			overflow:hidden;
			height:600px;			
			z-index:1;						
		}
		.tp_txt{
			position:absolute;
			color:#fff;			
			z-index:3;
			top:6em;
			left:18em;						
		}
		.tp_container{
			position:relative;
			background-color:#0b0e1e;			
		}
		.tp_background{
			background-color:black;
		}		
		.tp_background>img{
			width:100%;
			opacity:0.7;
		}
		.player .player_info{
			text-align:center;
			margin-top:30px;
		}
		.player_info .info_text{
			display:inline-block;
		}
		.info_text>h2{
			margin:0;
			padding:0;			
		}
		.player .player_info .photo_container{
			margin-left:37%;
		}
		.player .player_info .player_photo{
			width:40%;
			overflow:hidden;
			cursor:pointer;			
		}
		.player .player_info .player_photo>img{
			display:block;			
			width:100%;
		}		
		.detail_info {
			width:100%;
			margin:50px 0 50px 0;
			border-top:2px solid #252525;
			border-bottom:1px solid #ccc
		} 
				 
		.detail_info tbody th {
			text-align:left;
			background:#f7f7f7;
			color:#3b3a3a
		} 
		.detail_info tbody th.list_tit {
			font-size:13px;
			color:#000;
			letter-spacing:0.1px
		} 
		.detail_info tbody .no_line_b th, .detail_info tbody .no_line_b td {
			border-bottom:none
		} 
		.detail_info tbody th, .detail_info tbody td {
			padding:15px 0 16px 16px;
			border-bottom:1px solid #ccc
		} 
	</style>
</head>
<div class="team_player_bg">
	<h1 class="tp_txt">TEAM</h1>
	<div class="tp_container">				
		<div class="tp_background">
			<img src="<%=request.getContextPath()%>/resources/img/team_bg.jpg">			
		</div>		
	</div>	
</div>
<div class="container">
	<div class="player">
		<div class="player_info">
			<div class="info_text">
				<h2>Player INFO</h2>
				<div class="underline"></div>
			</div>			
			<div class="photo_container">							
				<div class="player_photo">
					<img src="<%=request.getContextPath()%>/resources/img/players/${player.name}.png">
				</div>
			</div>
			<table class="detail_info">
				<tbody>
					<tr>
		   				<th scope="row">선수 번호</th>
		   				<td>${player.back_num}</td>
		   				<th scope="row">이름</th>
		   				<td>${player.name}</td>
		   				<th scope="row">나이</th>
		   				<td>${player.age}</td>
		   				<th scope="row">몸무게</th>
						<td>${player.weight}</td>
					</tr>
					<tr>						
						<th scope="row">키</th>
						<td>${player.height}</td>
						<th scope="row">나라</th>
						<td>${player.country}</td>
		   				<th scope="row">상세 포지션</th>
		   				<td>${player.detail_position}</td>
					</tr>
				</tbody>
			</table>			
		</div>
	</div>
</div>