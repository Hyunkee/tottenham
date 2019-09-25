<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<style>
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
		/* tables */
		table.tablesorter {
			font-family:arial;			
			margin:10px 0pt 15px;
			font-size: 8pt;
			width: 100%;
			text-align: left;
		}
		table.tablesorter thead tr th, table.tablesorter tfoot tr th {
			background-color: #e6EEEE;
			border: 1px solid #FFF;
			font-size: 8pt;
			padding: 4px;
		}
		table.tablesorter thead tr th {
			background-image: url("/tottenham/resources/img/bg.gif");
			background-repeat: no-repeat;
			background-position: center right;
			cursor: pointer;
		}
		table.tablesorter tbody td {
			color: #3D3D3D;
			padding: 20px;
			background-color: #FFF;
			vertical-align: top;
		}
		table.tablesorter tbody tr.odd td {
			background-color:#F0F0F6;
		}
		table.tablesorter thead tr .tablesorter-headerAsc {
			background-image: url("/tottenham/resources/img/asc.gif");
		}
		table.tablesorter thead tr .tablesorter-headerDesc {
			background-image: url("/tottenham/resources/img/desc.gif");
		}
		table.tablesorter thead tr .headerSortDown, table.tablesorter thead tr .headerSortUp {
		background-color: #8dbdd8;
		}
		.border-red{
			border : 1px solid red;
		}					
	</style>
	<script type="text/javascript">
	$(document).ready(function(){ 
		$("#gcTable").tablesorter({
			widgets:['zebra'],
			sortList: [[3,1],[9,1]] 
		});
		teamAddClass();
		rank(3);		
	});
	function teamAddClass(){
		$('.teamName2').each(function(){
			var name = "Tottenham Hotspur";			
			if($(this).val() == name){				
				$(this).parents('tr').addClass('border-red');
			}
		});
	}
	function rank(index){
		var rankNum = 0;
		var backupNum = -1;
		var backupNum2 =  -1;
		var backupNum3 = -1;
		$('#gcTable tbody>tr').each(function(){
			var num = $(this).find('td').eq(index).text(); // index가 3일때 승점
			var num2 = $(this).find('td').eq(9).text(); // 골득실
			var num3 = $(this).find('td').eq(7).text(); // 득점
			console.log(num3);
			if(num == backupNum){							
				if(num2 < backupNum2 || num2 > backupNum2){					
					$(this).find('td').eq(0).html(++rankNum);					
				}else if(num2 == backupNum2){
					if(num3 < backupNum3 || num3 > backupNum3)
						$(this).find('td').eq(0).html(++rankNum);
					else{
						$(this).find('td').eq(0).html(rankNum);
					}
				}else{
					
				}
			}else
				$(this).find('td').eq(0).html(++rankNum);
			backupNum = num;
			backupNum2 = num2;
			backupNum3 = num3;
		})		
	}
	
	
	</script>
</head>
<div class="team_player_bg">
	<h1 class="tp_txt">League</h1>
	<div class="tp_container">				
		<div class="tp_background">
			<img src="<%=request.getContextPath()%>/resources/img/team_bg.jpg">			
		</div>		
	</div>
</div>
<div class="container" style="margin-bottom:30px;">
	<h2 style="text-align:center; margin:30px;"> 19 - 20 Season</h2>
	<table id="gcTable" class="tablesorter" style="border-bottom:1px solid lightgray;">
		<thead>
			<tr>
				<th>순위</th>
				<th>팀</th>
				<th>경기수</th>
				<th>승점</th>
				<th>승</th>
				<th>무</th>
				<th>패</th>
				<th>득점</th>
				<th>실점</th>
				<th>득실차</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="team">
			    <tr>
			        <td>1</td>
			        <td class="teamName">${team.team_name}<input type="hidden" class="teamName2" value="${team.team_name}"></td>
			        <td>${team.game_num}</td>
			        <td>${team.score}</td>
			        <td>${team.win}</td>
			        <td>${team.draw}</td>
			        <td>${team.lose}</td>
			        <td>${team.point}</td>
			        <td>${team.lose_point}</td>
			        <td>${team.diff_point}</td>
			    </tr>
		    </c:forEach>	    
		</tbody>
	</table>
</div>
