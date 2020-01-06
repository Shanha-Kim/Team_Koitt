<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head> 
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS & theme -->
<link rel="stylesheet" href="/www/css/bootstrap-lux.css" />
<link rel="stylesheet" href="/www/css/bootstrap.custom.css" />
<!-- Font Awesome 5 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<title>Login</title>

</head>

<body class="bg-primary">
	<jsp:include page="nav.jsp" flush="false" />
    
	<c:if test="${empty SID}">
		<div class="container" id="main">
			<div class="card text-white bg-primary mb-" style="max-width:40rem;">
				<div class="card-header">Login</div>
		
				<form method="POST" action="/www/loginProc.mr" onsubmit="return inputCheck()">
					<div class="card-body">
						<h4 class="card-title" style="margin-bottom: 30px;">Welcome to MUSICOLOR</h4>
	          
						<div class="form-group">
							<label for="id">ID</label>
							<input name="m_id" type="text" class="form-control" id="id" placeholder="Enter Your ID">
							<small id="emailHelp" class="form-text text-muted">We'll never share your ID with anyone else.</small>
							<p id="idCheckInfo" class="text-info"></p>
						</div>
						
						<div class="form-group" style="margin-bottom: 20px;">
							<label for="pw">Password</label>
							<input name="m_pw" type="password" class="form-control" id="pw" placeholder="Password">
							<p id="pwCheckInfo" class="text-info"></p>
						</div>
	 <!--          <div class="form-check">
	          <div class="form-check">
	              <label class="form-check-label">
	                <input class="form-check-input" type="checkbox" value="">
	                아이디 저장
	              </label>
	            </div>
	            <div class="form-check">
	              <label class="form-check-label">
	                <input class="form-check-input" type="checkbox" value="">
	                비밀번호 저장
	              </label>
	          </div>
	          </div> -->
						<br>
						<button type="submit" class="btn btn-info" style="width: 49.5%; display: inline;">로그인</button>
						<button id="join" type="button" class="btn btn-info" style="width: 49.5%; display: inline;">회원가입</button>
						<br>	<br>
						<button id="findid" type="button" class="btn btn-info" style="width: 99.5%; display: inline;">아아디 비밀번호 찾기 </button>
					
					</div> 
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
	<c:if test="${not empty isFail}">
		<script>
			alert("로그인에 실패하였습니다. \n\n아이디 또는 비밀번호를 확인해주세요.");
			${isFail = ""}
		</script>
	</c:if>
    

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  	<script type="text/javascript">
	$(document).ready(function(){
		$('#goToMain').click(function() {
			$(location).attr('href', '/www/tempMain.mr');
		})
		$('#join').click(function() {
			$(location).attr('href', '/www/join.mr');
		})
		
		$('#id').keyup(function(){
			$('#id').attr('class', '');
			$('#id').toggleClass('form-control');
			$('#idCheckInfo').attr('class', '');
			$('#idCheckInfo').toggleClass('invalid-feedback');
			$('#idCheckInfo').html('');
		})
		
		$('#pw').keyup(function(){
			$('#pw').attr('class', '');
			$('#pw').toggleClass('form-control');
			$('#pwCheckInfo').attr('class', '');
			$('#pwCheckInfo').toggleClass('invalid-feedback');
			$('#pwCheckInfo').html('');
		})
	}); 
		
		function inputCheck(){
			
			if($("#id").val() == "") {
				
				
				$('#id').attr('class', '');
				$('#id').toggleClass('form-control is-invalid');
				$('#idCheckInfo').attr('class', '');
				$('#idCheckInfo').toggleClass('invalid-feedback');
				$('#idCheckInfo').html('아이디를 입력해주세요.');
				
				return false;
			}
			if($('#pw').val() == "") {
				$('#pw').attr('class', '');
				$('#pw').toggleClass('form-control is-invalid');
				$('#pwCheckInfo').attr('class', '');
				$('#pwCheckInfo').toggleClass('invalid-feedback');
				$('#pwCheckInfo').html('패스워드를 입력해주세요.');
				
				return false;
			}
		}
	</script>
</body>
</html>