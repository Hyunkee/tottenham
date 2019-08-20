<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<style>
		.container.register{
			padding: 60px 0 80px 0;
		}
		.row{
			margin: 10px 0px;
		}
		.logo_img{
			text-align:center;
		}
		.logo_img>img{			
			width:30px;
			height:73px;
			margin:10px 0 10px 0;	
		}
		label{
			margin:0;
		}
	</style>
	<script type="text/javascript">
		function checkSame(sel1, sel2){
			var val1 = $(sel1).val();
			var val2 = $(sel2).val();
			if(val1 == val2){
				return true;
			}
			return false;			
		}
		function checkLength(sel,min,max){
			var val = $(sel).val();
			if(val.length >= min && val.length <= max){
				return true;
			}
			return false;
		}		
		var overLap = 0;				
		$(document).ready(function(){
			$('#register').submit(function(){							
				if(!checkLength('#register input[name=pw]',8,13)){
					alert('비밀번호는 8~13자리 입니다.');
					return false;
				}
				if($('#register input[type=email]').val().length == 0){
					alert('이메일을 입력해주세요.');
					return false;
				}
				if(!checkSame('#register input[name=pw]','#register input[name=pw2]')){
					alert('비밀번호와 일치하지 않습니다.');
					return false;
				}
				if(!checkLength('#register input[name=name]',1,25)){
					alert('이름은 1~13자리 입니다.');
					return false;
				}
				if(overLap==0){
					alert('회원수정에 실패했습니다.');
					return false;
				}else if(overLap==1){
					alert('회원수정에 성공했습니다.');
					return true;	
				}
			});			
			$('input[name=id]').change(function(){
				overLap = 0;
			});
			$("form").validate({
		        rules: {		        	
		            pw: {
		                required : true,
		                minlength : 8,
		                maxlength : 13,
		                regex: /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,13}$/
		            },
		            pw2: {
		                required : true,		                
		                equalTo : pw
		            },
		            name: {
		            	required : true		            	
		            },
		            email: {
		                required : true,		                
		                email : true
		            }		            
		        },
		        //규칙체크 실패시 출력될 메시지
		        messages : {		        	
		            pw: {
		                required : "필수로 입력하세요",
		                minlength : "최소 {0}글자이상이어야 합니다",
	                	maxlength : "최대 {0}글자이하이어야 합니다",
		                regex : "영문자, 숫자, 특수문자로 이루어져있으며 최소 하나이상 포함"
		            },
		            pw2: {
		                required : "필수로 입력하세요",		                
		                equalTo : "비밀번호가 일치하지 않습니다."
		            },
		            name: {
		            	required : "필수로 입력하세요"
		            },
		            email: {
		                required : "필수로 입력하세요",		                
		                email : "메일규칙에 어긋납니다"
		            }
		        }
		    });
		});
		$.validator.addMethod(
		    "regex",
		    function(value, element, regexp) {
		        var re = new RegExp(regexp);
		        return this.optional(element) || re.test(value);
		    },
		    "Please check your input."
		);
	</script>
</head>
<div class="container register">
	<div class="col-6 border border-dark mt-5" style="margin:0 auto;">
		<div class="logo_img">
			<img src="<%=request.getContextPath()%>/resources/img/tottenham_logo_c.png">
		</div>
		<form method="post" action="" id="modify">
			<div class="row">
				<label class="col-4">아이디</label>
				<input type="text"class="form-control col-7" placeholder="아이디" name="id" value="${user.id}" readonly>					
			</div>			
			<div class="row">
				<label class="col-4">기존 비밀번호</label>
				<input type="password"class="form-control col-7" placeholder="기존비밀번호" name="oldPw">
			</div>				
			<div class="row">
				<label class="col-4">새 비밀번호</label>
				<input type="password"class="form-control col-7" placeholder="새 비밀번호" name="pw" id="pw">
			</div>
			<div class="row">
				<label id="pw-error" class="text-danger offset-4 col-7 error p-0" for="pw"></label>
			</div>	
			<div class="row">
				<label class="col-4">새 비밀번호확인</label>
				<input type="password"class="form-control col-7" placeholder="새 비밀번호확인" name="pw2">
			</div>
			<div class="row">
				<label id="pw2-error" class="text-danger offset-4 col-7 error p-0" for="pw2"></label>
			</div>	
			<div class="row">
				<label class="col-4">이름</label>
				<input type="text"class="form-control col-7" placeholder="이름" name="name">					
			</div>
			<div class="row">
				<label id="name-error" class="text-danger offset-4 col-7 error p-0" for="name"></label>
			</div>		
			<div class="row">
				<label class="col-4">성별</label>
				<div class="col-8" >
					<label class="form-check-label col-5">
						<input type="radio" class="form-check-input"  name="gender" value="M" checked>남성
					</label>
					<label class="form-check-label">
						<input type="radio" class="form-check-input"  name="gender" value="W">여성
					</label>					
				</div>
			</div>
			<div class="row">
				<label class="col-4">이메일</label>
				<input type="email"class="form-control col-7" placeholder="이메일" name="email">
			</div>
			<div class="row">
				<label id="email-error" class="text-danger offset-4 col-7 error p-0" for="email"></label>
			</div>	
			<div class="offset-8 col-3 clearfix p-0">
				<button class="btn btn-secondary float-right" id="join">수정하기</button>
			</div>
		</form>
	</div>
</div>	