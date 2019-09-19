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
			margin-bottom:10px;
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
		.player_stats{
		
		}
		.player_stats .info_text_container{
			text-align:center;
			margin:20px 0 20px 0;
		}
		.player_stats .info_text.stats{
			display:inline-block;
		}
		.player_stats .detail_info.stats{
			margin-top:0;
		}
	</style>
</head>
<div class="team_player_bg">
	<h1 class="tp_txt">STATS</h1>
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
					<h4 style="margin:10px 0 0 0">${player.name}</h4>
				</div>
			</div>
			<table class="detail_info">
				<tbody>
					<tr>
		   				<th scope="row">선수 번호</th>
		   				<td>${player.back_num}</td>		   				
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
		<div class="player_stats">
			<div class="info_text_container">
				<div class="info_text stats">
					<h2>Stats INFO</h2>
					<div class="underline"></div>
				</div>
			</div>
			<c:forEach items="${stats}" var="player">
				<c:if test="${player.position eq 'G'}">		
					<div>			
						<h2>${player.season} SEASON</h2>										
						<table class="detail_info stats">
							<tbody>
								<tr>
					   				<th scope="row">출전 시간(분)</th>
					   				<td>${player.minutes_played}</td>
					   				<th scope="row">득점</th>
					   				<td>${player.goal_scored}</td>
					   				<th scope="row">어시스트</th>
					   				<td>${player.assists}</td>				   				
								</tr>
								<tr>
									<th scope="row">클린시트</th>
									<td>${player.g_cleanseet}</td>
									<th scope="row">선방</th>
									<td>${player.g_save}</td>
									<th scope="row">PK 선방</th>
									<td>${player.g_pkclean}</td>
								</tr>
							</tbody>
						</table>
					</div>					
				</c:if>
				<c:if test="${player.position eq 'D'}">
					<div>			
						<h2>${player.season} SEASON</h2>										
						<table class="detail_info stats">
							<tbody>
								<tr>
					   				<th scope="row">출전 시간(분)</th>
					   				<td>${player.minutes_played}</td>
					   				<th scope="row">득점</th>
					   				<td>${player.goal_scored}</td>
					   				<th scope="row">어시스트</th>
					   				<td>${player.assists}</td>
					   				<th scope="row">볼 처리</th>
					   				<td>${player.clearances}</td>				   				
								</tr>
								<tr>
									<th scope="row">가로채기</th>
									<td>${player.interceptions}</td>
									<th scope="row">태클</th>
									<td>${player.tackles}</td>
									<th scope="row">패스 횟수</th>
									<td>${player.passes}</td>
									<th scope="row">성공한 패스 횟수</th>
									<td>${player.completed_passes}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</c:if>
				<c:if test="${player.position eq 'M'}">
					<div>			
						<h2>${player.season} SEASON</h2>										
						<table class="detail_info stats">
							<tbody>
								<tr>
					   				<th scope="row">출전 시간(분)</th>
					   				<td>${player.minutes_played}</td>
					   				<th scope="row">득점</th>
					   				<td>${player.goal_scored}</td>
					   				<th scope="row">어시스트</th>
					   				<td>${player.assists}</td>
					   				<th scope="row">볼 처리</th>
					   				<td>${player.clearances}</td>				   				
								</tr>
								<tr>
									<th scope="row">가로채기</th>
									<td>${player.interceptions}</td>
									<th scope="row">태클</th>
									<td>${player.tackles}</td>
									<th scope="row">패스 횟수</th>
									<td>${player.passes}</td>
									<th scope="row">성공한 패스 횟수</th>
									<td>${player.completed_passes}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</c:if>
				<c:if test="${player.position eq 'A'}">
					<div>			
						<h2>${player.season} SEASON</h2>										
						<table class="detail_info stats">
							<tbody>
								<tr>
					   				<th scope="row">출전 시간(분)</th>
					   				<td>${player.minutes_played}</td>
					   				<th scope="row">득점</th>
					   				<td>${player.goal_scored}</td>
					   				<th scope="row">어시스트</th>
					   				<td>${player.assists}</td>
					   				<th scope="row">볼 처리</th>
					   				<td>${player.clearances}</td>				   				
								</tr>
								<tr>
									<th scope="row">가로채기</th>
									<td>${player.interceptions}</td>
									<th scope="row">태클</th>
									<td>${player.tackles}</td>
									<th scope="row">패스 횟수</th>
									<td>${player.passes}</td>
									<th scope="row">성공한 패스 횟수</th>
									<td>${player.completed_passes}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>
	<div style="margin-bottom:30px;">
		<a href="<%=request.getContextPath()%>/team/player"><button class="btn btn-outline-secondary">선수 리스트 목록</button></a>
	</div>
</div>