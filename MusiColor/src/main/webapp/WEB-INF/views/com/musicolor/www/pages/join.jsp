<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>  
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS & theme -->
<link rel="stylesheet" href="/www/css/bootstrap.custom.css" >
<link rel="stylesheet" href="/www/css/bootstrap-lux.css" >
<link rel="stylesheet" href="/www/css/random.css" >
<!-- Font Awesome 5 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<title>Sign up</title> 
</head>

<body class="bg-primary">
	<jsp:include page="nav.jsp" flush="false" />	

	<div class="container" id="main">
		<c:if test="${empty SID}">
			<div class="card text-white bg-primary mb-" style="max-width:40rem;">
				<div class="card-header">Sign Up</div>
				<div class="card-body">
					<h4 class="card-title" style="margin-bottom: 30px;">Welcome to MUSICOLOR</h4>
					<form method="POST" action="/www/joinProc.mr" onsubmit="return inputCheck()">
						
						<div class="form-group">
							<label for="m_id">ID</label>
							<input name="m_id" type="text" class="form-control" id="m_id" aria-describedby="idHelp" placeholder="Enter Your ID">
							<small id="idHelp" class="form-text text-muted">ID를 입력하시고 중복 확인을 하세요.</small>
							<button id="idCheck" type="button" class="btn btn-info" style="padding: 0px; width: 100px; height: 25px; margin-right: 4px;">중복 확인</button>
							<p style="margin-left: 4px; display: inline;" id="idCheckInfo" class="text-info"></p>
						</div>
						
						<div class="form-group">
							<label for="m_name">Name</label>
							<input name="m_name"  type="text" class="form-control" id="m_name" placeholder="Enter Your Name">
							<p id="m_nameCheckInfo" class="text-info"></p>
						</div>
						<br>
			
						<div class="form-group" style="margin-bottom: 20px;">
							<label for="m_pw">Password</label>
							<input name="m_pw" type="password" class="form-control" id="m_pw" placeholder="Password">
							<p id="m_pwCheckInfo" class="text-info"></p>
						</div>
						
						<div class="form-group" style="margin-bottom: 20px;">
							<label for="m_pw_conf">Password Confirm</label>
							<input type="password" class="form-control" id="m_pw_conf" placeholder="Password Confirm">
							<p id="m_pw_confCheckInfo" class="text-info"></p>
						</div>
						<br>
			          	
						<div class="form-group">
							<label for="m_email">E-mail</label>
							<input name="m_email" type="text" class="form-control" id="m_email" placeholder="Enter Your E-mail">
							<small id="m_emailCheckInfo" class="form-text text-muted"></small>
							<button id="mailauthbtn" type="button" class="btn btn-info" style="padding: 0px; width: 100px; height: 25px; margin-right: 4px;">인증번호 전송</button>
							<input id="authnum" type="hidden" class="form-control" style="width:30%; margin-top:4px; " placeholder="Enter Your auth-number">
							<button id="checkauth" type="button" class="btn btn-info" style="padding: 0px; width: 100px; height: 25px; margin-top:4px; margin-right: 4px; display:none;">인증번호 확인</button>
							<p style="margin-left: 4px; display: inline;" id="mailauthtext" class="text-info"></p>
						</div>
						<br>
						
						<div class="form-group">
							<label for="m_tel">Tel</label>
							<input name="m_tel" type="tel" class="form-control" id="m_tel" placeholder="Enter Your Phone Number [ex) 010-1234-1234]">
							<p id="m_telCheckInfo" class="text-info"></p>
						</div>
						<br>
						
						<button id="submit-btn" type="submit" class="btn btn-info" style="width: 100%; display: inline;">회원 가입</button>
					</form>
	        </div>
			</div>
		</c:if>
		<c:if test="${not empty SID}">
			<div align="center">
				<div class="card text-white bg-primary mb-3" style="max-width: 40rem; margin-top: 20rem;">
					<div class="card-body">
						<h4 class="card-title" style="">${SID}님은 이미 로그인하셨습니다.</h4>
						<button id="goToMain" type="button" class="btn btn-info" style="width: 100%; display: inline;">메인으로</button>
					</div>
				</div>
			</div>
		</c:if>
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>	
<script type="text/javascript">
	var ck = 0;
	var getCheckId = RegExp(/^[a-zA-Z0-9-_]{4,16}$/);
	var getCheckPw = RegExp(/^[a-zA-Z0-9`~!@#$%^&*()-_=+\|]{6,18}$/);
	var getCheckName = RegExp(/^[가-힣a-zA-Z]{1,14}$/);
	var getCheckMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	var getCheckTel = RegExp(/^[0-9_\+\-]+-[0-9\+\-]+-[0-9\+\-]+/);
	
	function ckFunc(data){	// 중복확인 하면 이 함수로 ck의 값을 바꿈
		ck = data;
	}

	$('#goToMain').click(function() {
		$(location).attr('href', '/www/feed.mr');
	})
	
	$(document).ready(function(){
		
		$('#m_id').keyup(function(){
			ck = 0;
			if(!getCheckId.test($("#m_id").val())){
				ck = 2;
				$('#idCheckInfo').attr('class', '');
				$('#idCheckInfo').toggleClass('invalid-feedback');
				$('#m_id').attr('class', '');
				$('#m_id').toggleClass('form-control is-invalid');
				$('#idCheckInfo').html("4~16자의 영문 대 소문자, 숫자와 특수기호 (_),(-)만 사용 가능합니다." + ck);
			} else{
				$('#idCheckInfo').attr('class', '');
				$('#idCheckInfo').toggleClass('invalid-feedback');
				$('#m_id').attr('class', '');
				$('#m_id').toggleClass('form-control is-invalid');
				$('#idCheckInfo').html("중복확인이 필요합니다." + ck);
			}
		})
		
		
		$('#idCheck').click(function(){
			var sid = $('#m_id').val();
			
			if(sid == ''){
				$('#idCheckInfo').attr('class', '');
				$('#idCheckInfo').toggleClass('invalid-feedback');
				$('#idCheckInfo').html("아이디를 입력해주세요." + ck);
				
				return false;
			}
			
			$.ajax({
				url : "/www/idCheck.mr",
				type : "post",
				dataType: "text",
				data : {
					"m_id" : sid
				},
				
				success : function(data){
					var idCk = data;
					if(!getCheckId.test($("#m_id").val())){
						// 아이디 형식에 맞지 않는 경우
						$('#idCheckInfo').attr('class', '');
						$('#idCheckInfo').toggleClass('invalid-feedback');
						$('#m_id').attr('class', '');
						$('#m_id').toggleClass('form-control is-invalid');
						$('#idCheckInfo').html("4~16자의 영문 대 소문자, 숫자와 특수기호 (_),(-)만 사용 가능합니다." + ck);
					} else if(idCk == 1){
						// 이미 회원가입 한 사람이 있는 경우
						$('#idCheckInfo').attr('class', '');
						$('#idCheckInfo').toggleClass('invalid-feedback');
						$('#m_id').attr('class', '');
						$('#m_id').toggleClass('form-control is-invalid');
						$('#idCheckInfo').html("이미 가입된 아이디입니다." + ck)
					} else {
						// 아직 해당 아이디로 회원가입한 사람이 없는 경우
						// 따라서 사용할 수 있는 아이디
						$('#idCheckInfo').attr('class', '');
						$('#idCheckInfo').toggleClass('valid-feedback');
						$('#m_id').attr('class', '');
						$('#m_id').toggleClass('form-control is-valid');
						ckFunc(true);
						$('#idCheckInfo').html("사용할 수 있는 아이디 입니다. " + ck);
					}
				},
				error : function(){
					alert('### 통신 에러 ###');
				}
			});
		});
		$('#m_name').change(function(){
			// change 이름 유효성 검사
			if(!getCheckName.test($("#m_name").val())){
				$('#m_name').attr('class', '');
				$('#m_name').toggleClass('form-control is-invalid');
				$('#m_nameCheckInfo').attr('class', '');
				$('#m_nameCheckInfo').toggleClass('invalid-feedback');
				$('#m_nameCheckInfo').html('이름 형식에 맞지 않습니다.');
			} else {
				$('#m_name').attr('class', '');
				$('#m_name').toggleClass('form-control is-valid');
			}
		})
		
		$('#m_pw').change(function(){
			// change 비밀번호 유효성 검사
			if(!getCheckPw.test($("#m_pw").val())){
				if($("#m_pw").val().length < 6){
					$('#m_pw').attr('class', '');
					$('#m_pw').toggleClass('form-control is-invalid');
					$('#m_pwCheckInfo').attr('class', '');
					$('#m_pwCheckInfo').toggleClass('invalid-feedback');
					$('#m_pwCheckInfo').html('너무 짧습니다. 6~18자 사이의 길이로 작성해주세요.');
				} else if($("#m_pw").val().length > 18){
					$('#m_pw').attr('class', '');
					$('#m_pw').toggleClass('form-control is-invalid');
					$('#m_pwCheckInfo').attr('class', '');
					$('#m_pwCheckInfo').toggleClass('invalid-feedback');
					$('#m_pwCheckInfo').html('너무 깁니다. 6~18자 사이의 길이로 작성해주세요.');
				} else {
					$('#m_pw').attr('class', '');
					$('#m_pw').toggleClass('form-control is-invalid');
					$('#m_pwCheckInfo').attr('class', '');
					$('#m_pwCheckInfo').toggleClass('invalid-feedback');
					$('#m_pwCheckInfo').html('사용할 수 없는 문자가 있습니다.');
				}
			} else {
				$('#m_pw').attr('class', '');
				$('#m_pw').toggleClass('form-control is-valid');
			}
			
			if($("#m_pw").val()!=($("#m_pw_conf").val())){
				$('#m_pw_conf').attr('class', '');
				$('#m_pw_conf').toggleClass('form-control is-invalid');
				$('#m_pw_confCheckInfo').attr('class', '');
				$('#m_pw_confCheckInfo').toggleClass('invalid-feedback');
				$('#m_pw_confCheckInfo').html('비밀번호란과 비밀번호 확인란의 입력 사항이 다릅니다.');
			} else {
				$('#m_pw_conf').attr('class', '');
				$('#m_pw_conf').toggleClass('form-control is-valid');
			}
		})
		$('#m_pw_conf').change(function(){
			// change 비밀번호와 비밀번호 확인이 같은지 확인
			if($("#m_pw").val()!=($("#m_pw_conf").val())){
				$('#m_pw_conf').attr('class', '');
				$('#m_pw_conf').toggleClass('form-control is-invalid');
				$('#m_pw_confCheckInfo').attr('class', '');
				$('#m_pw_confCheckInfo').toggleClass('invalid-feedback');
				$('#m_pw_confCheckInfo').html('비밀번호란과 비밀번호 확인란의 입력 사항이 다릅니다.');
			} else {
				$('#m_pw_conf').attr('class', '');
				$('#m_pw_conf').toggleClass('form-control is-valid');
			}
		})
		
		$('#m_email').change(function(){
			// change 이메일 유효성 검사
			if(!getCheckMail.test($("#m_email").val())){
				$('#m_email').attr('class', '');
				$('#m_email').toggleClass('form-control is-invalid');
				$('#m_emailCheckInfo').attr('class', '');
				$('#m_emailCheckInfo').toggleClass('invalid-feedback');
				$('#m_emailCheckInfo').html('이메일 형식에 맞지 않습니다.');
			} else {
				$('#m_email').attr('class', '');
				$('#m_email').toggleClass('form-control is-valid');
			}
		})
		
		$('#m_tel').change(function(){
			// change 전화번호 유효성 검사
			if(!getCheckTel.test($("#m_tel").val())){
				$('#m_tel').attr('class', '');
				$('#m_tel').toggleClass('form-control is-invalid');
				$('#m_telCheckInfo').attr('class', '');
				$('#m_telCheckInfo').toggleClass('invalid-feedback');
				$('#m_telCheckInfo').html('전화번호를 형식에 맞게 입력해주세요. ex) 010-1234-1234');
			} else {
				$('#m_tel').attr('class', '');
				$('#m_tel').toggleClass('form-control is-valid');
			}
		})
	})
	function inputCheck(){
		
		// 아이디 공백 확인
		if($("#m_id").val() == "") {
			alert("아이디를 입력해주세요.");
			$("#m_id").focus();
			return false;
		}
		
		// 아이디 유효성 검사
		if(!getCheckId.test($("#m_id").val())){
			alert("아이디 형식에 맞게 입력해주세요.");
			$("#m_id").focus();
			return false;
		}
		
		// 아이디 중복확인 검사
		if(ck != true){
			alert("아이디 중복확인을 해주세요.");
			return false;
		}
		
		// 이름 입력 확인
		if($("#m_name").val() == "") {
			alert("이름을 입력해주세요.");
			$("#m_name").focus();
			return false;
		}
		
		// 이름 유효성 검사
		if(!getCheckName.test($("#m_name").val())){
			alert("이름 형식에 맞게 입력해주세요.");
			$("#m_name").focus();
			return false;
		}
		
		// 비밀번호 공백 확인
		if($("#m_pw").val() == "") {
			alert("비밀번호를 입력해주세요.");
			$("#m_pw").focus();
			return false;
		}
		
		// 비밀번호 유효성 검사
		if(!getCheckPw.test($("#m_pw").val())){
			alert("비밀번호 형식에 맞게 입력해주세요.");
			$("#m_pw").focus();
			return false;
		}
		
		// 아이디와 비밀번호가 같은지 확인
		if ($("#m_id").val()==($("#m_pw").val())) {
			alert("아이디와 비밀번호는 같게 할 수 없습니다.");
			$("#m_pw").focus();
			return false;
		}
		
		// 비밀번호와 비밀번호 확인이 같은지 확인
		if ($("#m_pw").val()!=($("#m_pw_conf").val())) {
			alert("비밀번호란과 비밀번호 확인란의 입력 사항이 다릅니다.");
			$("#m_pw").focus();
			return false;
		}
		
		// 이메일 입력 확인
		if($("#m_email").val() == "") {
			alert("이메일을 입력해주세요.");
			$("#m_email").focus();
			return false;
		}
		
		// 이메일 유효성 검사
		if(!getCheckMail.test($("#m_email").val())){
			alert("이메일 형식에 맞게 입력해주세요.");
			$("#m_email").focus();
			return false;
		}
		
		// 전화번호 입력 확인
		if($("#m_tel").val() == "") {
			alert("전화번호를 입력해주세요.");
			$("#m_tel").focus();
			return false;
		}
		
		// 전화번호 유효성 검사
		if(!getCheckTel.test($("#m_tel").val())){
			alert("전화번호 형식에 맞게 입력해주세요.");
			$("#m_tel").focus();
			return false;
		}
		
		form.submit();
	}
</script>
<script type="text/javascript">
	$(function(){
		$("#mailauthbtn").click(function(){
			var mymail = $("#m_email").val();
			$.ajax({
				url : "/www/mailauth.mr",
				type : "post",
				dataType : "json",
				data : {
					mymail : mymail
				},
				success : function(num){
					$("#authnum").attr("type", "text");
					$("#checkauth").css("display", "block");
					
					$("#checkauth").off().click(function(){
						var dice = $("#authnum").val();
						if(num == dice){
							$('#mailauthtext').attr('class', '');
							$('#mailauthtext').toggleClass('valid-feedback');
							$('#mailauthtext').html("인증되었습니다.");
						}else{
							$('#mailauthtext').attr('class', '');
							$('#mailauthtext').toggleClass('invalid-feedback');
							$('#mailauthtext').html("번호가 잘못되었습니다.");
						}
						
					})
				},
				error : function(){
					alert('### 통신 에러 ###');
				}
			});
			
		})
	})
</script>
</body>
</html>