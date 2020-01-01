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
 
	<title>Sign up</title> 
	<script type="text/javascript">
		$(document).ready(function(){
			$('#goToMain').click(function() {
				$(location).attr('href', '/www/tempMain.mr');
			})
		});
	</script>
</head>

<body class="bg-primary">
	<jsp:include page="nav.jsp" flush="false" />	

	<div class="container" id="main">
		<c:if test="${empty SID}">
			<div class="card text-white bg-primary mb-" style="max-width:40rem;">
				<div class="card-header">Sign Up</div>
				<div class="card-body">
					<h4 class="card-title" style="margin-bottom: 30px;">Welcome to MUSICOLOR</h4>
					<form method="POST" action="/www/joinProc.mr">
						
						<div class="form-group">
							<label for="m_id">ID</label>
							<input name="m_id" type="text" class="form-control" id="m_id" aria-describedby="idHelp" placeholder="Enter Your ID">
							<small id="idHelp" class="form-text text-muted">ID를 입력하시고 중복 확인을 하세요.</small>
							<button id="idCheck" type="button" class="btn btn-info" style="padding: 0px; width: 100px; height: 25px;">중복 확인</button>
							<p id="idCheckInfo" class="text-info"></p>
						</div>
						
						<div class="form-group">
							<label for="m_name">Name</label>
							<input name="m_name"  type="text" class="form-control" id="m_name" placeholder="Enter Your Name">
						</div>
						<br>
			
						<div class="form-group" style="margin-bottom: 20px;">
							<label for="m_pw">Password</label>
							<input name="m_pw" type="password" class="form-control" id="m_pw" placeholder="Password">
						</div>
						
						<div class="form-group" style="margin-bottom: 20px;">
							<label for="pwConfirm">Password Confirm</label>
							<input type="password" class="form-control" id="pwConfirm" placeholder="Password Confirm">
						</div>
						<br>
			          
						<div class="form-group">
							<label for="m_email">E-mail</label>
							<input name="m_email" type="email" class="form-control" id="m_email" placeholder="Enter Your E-mail">
						</div>
						<br>
			
						<div class="form-group">
							<label for="m_tel">Tel</label>
							<input name="m_tel" type="tel" class="form-control" id="m_tel" placeholder="Enter Your Phone Number">
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
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  
</body>
</html>