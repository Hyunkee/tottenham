<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<style>
		.signin_bg{
			position:relative;
			overflow:hidden;
			height:400px;			
			z-index:1;						
		}
		.sb_container{
			position:relative;
			background-color:#0b0e1e;
			
		}
		.sb_txt{
			position:absolute;
			color:#fff;			
			z-index:3;
			top:5em;
			left:18em;						
		}
		.sb_background>img{
			width:100%;			
			opacity:0.5;
		}
		.find-box{
			border: 1px solid black;
			width : 400px;			
			margin: 100px auto 0;
			padding:20px;
		}
	</style>
	<script type="text/javascript">
		$(document).ready(function(){           
	        $('input[name=id]').focus();
	        $('#findBtn').click(function(){
	        	//ajax를 통해 아이디와 이메일을 서버에 전송 후 일치여부를 확인
	        	var id = $('input[name=id]').val();
	        	var email = $('input[name=email]').val();
	        	$.ajax({
			        async:true,
			        type:'POST',
			        data:{'id':id,'email':email},
			        url:"<%=request.getContextPath()%>/checkemail",
			        dataType:"json",
			        contentType:"application/json; charset=UTF-8",
			        success : function(data){
			            if(data.isOk){
			            	$('#findForm').submit();			            
			            }else{
			            	alert('일치하는 정보가 없습니다.')
			            }
			        }
			    });		
	        });
		});
	</script>
</head>
<div class="signin_bg">
	<h1 class="sb_txt">비밀번호 찾기</h1>
	<div class="sb_container">				
		<div class="sb_background">
			<img src="<%=request.getContextPath()%>/resources/img/signin_bg.jpg">			
		</div>		
	</div>
</div>
<div style="height: 350px">	
	<div class="find-box">
		<form method="post" action="<%=request.getContextPath()%>/password/send" id="findForm">
			<div class="form-group">		  
			  <input type="text" class="form-control" placeholder="아이디" name="id">
			</div>
			<div class="form-group">		  
			  <input type="email" class="form-control" placeholder="이메일" name="email">
			</div>
			<button type="button" class="btn btn-outline-secondary col-12" id="findBtn">비밀번호 찾기</button>						
		</form>		
	</div>	
</div>