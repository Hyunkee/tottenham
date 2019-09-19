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
		.team_players.container{
			max-width:800px;
		}
		.team_players .tp_position{
			text-align:center;
		}
		.tp_position .position_text{
			display:inline-block;
			font-size:30px;
			font-weight:500;		
		}
		.players{
			position:relative;
		}
		.players .players_text{
			display:inline-block;
			margin:20px 0 20px 0;
		}
		.players .players_text>h2{
			margin:0;
			padding:0;
		}
		.players .players_group{
		
		}		
		.players .players_group .pg_player{
			width:calc(33.333333% - 20px);
			display:inline-block;
			margin: 0 17px 14px 0;
			text-decoration:none;
		}
		.players .pg_player .player_photo{
			width:100%;
			overflow:hidden;
			cursor:pointer;
		}
		.players .pg_player .player_photo>img{
			display:block;			
			width:100%;
		}
		.players .pg_player .player_underline{
			height: 10px;
	    	border-bottom: 2px solid #3db7e4;
	    	transition: border-bottom-width .1s ease-in-out,border-bottom-color .1s ease-out;    	
	    	margin-bottom: 12px;
		}
		.pg_player:hover .player_underline{			
			border-bottom: 5px solid #e0e721;
		}
		.players .pg_player .player_info{
			width:100%;
			color:black;
		}
		.player_info .player_back_num{
			display:inline-block;
			font-size:60px;
			float:right;
			font-weight:300;
			text-align:right;
			vertical-align:top;
		}
		.player_info .player_name{
			font-size:18px;
			font-weight:500;
			margin-bottom: 12px;			
		}
		.player_info .player_country{
		
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
<div class="team_players container">
	<div>
	  	<form action="<%=request.getContextPath()%>/team/player" method="get" class="row mb-3 mt-3">
		  	<div class="form-group col-2 mb-0">	  
			  <select class="form-control" name="position">
			  	<option value="0" <c:if test="${player.position == 0 }">selected</c:if>>포지션</option>
			    <option value="0" <c:if test="${player.position == 0 }">selected</c:if>>전체</option>
			    <option value="G" <c:if test="${player.position == 'G' }">selected</c:if>>골키퍼</option>
			    <option value="D" <c:if test="${player.position == 'D' }">selected</c:if>>수비수</option>
			    <option value="M" <c:if test="${player.position == 'M' }">selected</c:if>>미드필더</option>
			    <option value="A" <c:if test="${player.position == 'A' }">selected</c:if>>공격수</option>
			  </select>
			</div>			
			<button type="submit" class="btn btn-outline-secondary">검색</button>
		</form>
 	</div>
 	<div class="tp_position">
 		<c:choose>
 			<c:when test="${pos eq '0'}">
				<div class="position_text">
					<c:out value="ALL" />					
				</div>
			</c:when>
			<c:when test="${pos eq 'G'}">
				<div class="position_text">
					<c:out value="GoalKeeper" />					
				</div>
			</c:when>
			<c:when test="${pos eq 'D'}">
				<div class="position_text">
					<c:out value="Defender" />
				</div>
			</c:when>
			<c:when test="${pos eq 'M'}">
				<div class="position_text">
					<c:out value="Midfielder" />
				</div>
			</c:when>
			<c:when test="${pos eq 'A'}">
				<div class="position_text">
					<c:out value="Attacker" />
				</div>
			</c:when>
		</c:choose>
 	</div>
	<div class="players">
		<div class="players_text">
			<h2>Player</h2>
			<div class="underline"></div>
		</div>				
		<div class="players_group">			
			<c:forEach items="${list}" var="player">
				<a class="pg_player" href="<%=request.getContextPath()%>/team/stats?num=${player.num}">
					<div class="player_photo">
						<img src="<%=request.getContextPath()%>/resources/img/players/${player.name}.png">
					</div>
					<div class="player_underline"></div>
					<div class="player_info">
						<div class="player_back_num">${player.back_num}</div>
						<div class="player_name">${player.name}</div>
						<div class="player_country">${player.country}</div>						
					</div>
				</a>
			</c:forEach>			
		</div>
	</div>	
</div>
