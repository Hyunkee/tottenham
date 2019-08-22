<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<style>
		.find_bg{
			position:relative;
			overflow:hidden;
			height:400px;			
			z-index:1;						
		}
		.findbg_container{
			position:relative;
			background-color:#0b0e1e;
			
		}
		.findbg_txt{
			position:absolute;
			color:#fff;			
			z-index:3;
			top:5em;
			left:15em;						
		}
		.findbg_background>img{
			width:100%;			
			opacity:0.5;
		}
		.container.find{
			text-align:center;
		}
		.container>.find{
			display:inline-block;
			height:350px;
			margin-top:100px;
		}
		.find_line_wrap{
			position:relative;
			display:inline-block;
		}
		.find_h_line{
			position:relative;
			top:3.2em;			
			display:inline-block;
			width:1px;
			height:250px;
			margin:0 40px;			
			background-color:black;
		}
		.find.pw_box{
			
		}
		.find-box{
			border: 1px solid black;
			width : 400px;
			padding:20px;
		}
	</style>
	<script type="text/javascript">
		$(document).ready(function(){           
	        $('input[name=name]').focus();
	        $('#findIdBtn').click(function(){
	        	//ajax를 통해 아이디와 이메일을 서버에 전송 후 일치여부를 확인
	        	var name = $('input[name=name]').val();
	        	var email = $('#idemail').val();
	        	$.ajax({
			        async:true,	
			        type:'POST',
			        data:{'name':name,'email':email},
			        url:"<%=request.getContextPath()%>/checkid",
			        dataType:"json",
			        contentType:"application/json; charset=UTF-8",
			        success : function(data){
			            if(data.isOk != null){			            	
			            	alert("검색된 아이디 = "+data.isOk)
			            }else{
			            	alert('일치하는 정보가 없습니다.')
			            }			            
			        }
			    });		
	        });
	        $('#findPwBtn').click(function(){
	        	//ajax를 통해 아이디와 이메일을 서버에 전송 후 일치여부를 확인
	        	var id = $('input[name=id]').val();
	        	var email = $('#pwemail').val();
	        	$.ajax({
			        async:true,
			        type:'POST',
			        data:{'id':id,'email':email},
			        url:"<%=request.getContextPath()%>/checkpw",
			        dataType:"json",
			        contentType:"application/json; charset=UTF-8",
			        success : function(data){
			            if(data.isOk){
			            	$('#findPwForm').submit();
			            	alert('임시 비밀번호를 발송하였습니다.')
			            }else{
			            	alert('일치하는 정보가 없습니다.')
			            }
			        }			        
			    });		
	        });
		});
	</script>
</head>
<div class="find_bg">
	<h1 class="findbg_txt">아이디/비밀번호 찾기</h1>
	<div class="findbg_container">				
		<div class="findbg_background">
			<img src="<%=request.getContextPath()%>/resources/img/signin_bg.jpg">			
		</div>		
	</div>
</div>
<div class="container find">
	<div class="find id_box">	
		<h2>아이디 찾기</h2>	
		<div class="find-box">
			<form method="post" action="<%=request.getContextPath()%>/id/send" id="findIdForm">
				<div class="form-group">		  
				  <input type="text" class="form-control" placeholder="이름" name="name">
				</div>
				<div class="form-group">		  
				  <input type="email" class="form-control" placeholder="이메일" id="idemail">
				</div>
				<button type="button" class="btn btn-outline-secondary col-12" id="findIdBtn">아이디 찾기</button>						
			</form>		
		</div>	
	</div>
	<div class="find_line_wrap">
		<div class="find_h_line"></div>
	</div>
	<div class="find pw_box">
		<h2>비밀번호 찾기</h2>	
		<div class="find-box">
			<form method="post" action="<%=request.getContextPath()%>/password/send" id="findPwForm">
				<div class="form-group">		  
				  <input type="text" class="form-control" placeholder="아이디" name="id">
				</div>
				<div class="form-group">		  
				  <input type="email" class="form-control" placeholder="이메일" id="pwemail">
				</div>
				<button type="button" class="btn btn-outline-secondary col-12" id="findPwBtn">비밀번호 찾기</button>						
			</form>		
		</div>	
	</div>	
</div>