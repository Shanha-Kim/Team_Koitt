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
    
	<c:if test="${empty SID and empty FID}">
		<div class="container" id="main">
			<div class="card text-white bg-primary mb-" style="max-width:40rem;">
				<div class="card-header">Find ID</div>
		
				<form method="POST" action="/www/findIdProc.mr" onsubmit="return inputCheck()">
					<div class="card-body">
						<h4 class="card-title" style="margin-bottom: 30px;">아이디를 잊어버리셨나요?</h4>
						<h5 style="margin: 8px 0px 42px 0px;" class="card-title" style="margin-bottom: 30px;">회원 정보에 등록한 이메일 주소와 전화번호를 입력해주세요.</h5>
	          
						<div class="form-group">
							<label for="m_email">가입하신 이메일 주소를 입력해주세요.</label>
							<input name="m_email" type="text" class="form-control" id="mail" placeholder="Enter Your E-mail">
							<p id="mailCheckInfo" class="text-info"></p>
						</div>
						
						<div class="form-group" style="margin-bottom: 20px;">
							<label for="m_tel">전화번호를 입력해주세요.</label>
							<input name="m_tel" type="text" class="form-control" id="tel" placeholder="Enter Your Phone Number">
							<p id="telCheckInfo" class="text-info"></p>
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
						<ol class="breadcrumb" style="padding: 12px 0px 0px 0px; margin: 0px;">
							<li class="breadcrumb-item"><a href="#" class="text-muted">비밀번호 찾기</a></li>
						</ol>
						<br>
						<c:if test="${not empty findFail}">
							<div align="center">
								<div class="card text-white bg-primary mb-3" style="max-width: 40rem; margin-top: 10px;">
									<div class="card-body">
										<h4 class="card-title" style="">입력하신 정보와 일치하는 아이디가 없습니다.</h4>
										<h4 class="card-title" style="">입력 사항을 다시 한 번 확인해주세요.</h4>
									</div>
								  </div>
							</div>
							<script>
								${findFail = ""}
							</script>
						</c:if>
						
						<button type="submit" class="btn btn-info" style="width: 49.5%; display: inline;">아이디 찾기</button>
						<button id="login" type="button" class="btn btn-info" style="width: 49.5%; display: inline;">로그인 페이지로</button>
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
	<c:if test="${not empty findFail}">
		<div align="center">
			<div class="card text-white bg-primary mb-3" style="max-width: 40rem; margin-top: 20rem;">
				<div class="card-body">
					<h4 class="card-title" style="">입력하신 정보와 일치하는 아이디가 없습니다.</h4>
					<br>
					<h4 class="card-title" style="">입력 사항을 다시 한 번 확인해주세요.</h4>
				</div>
			  </div>
		</div>
		<script>
			${findFail = ""}
		</script>
	</c:if>
	<c:if test="${not empty FID}">
		<div align="center">
			<div class="card text-white bg-primary mb-3" style="max-width: 40rem; margin-top: 20rem;">
				<div class="card-body">
					<h4 class="card-title" style="">입력하신 정보와 일치하는 아이디는</h4>
					<br>
					<h3 class="card-title" style="">${FID}</h3>
					<br>
					<h4 style="margin-bottom: 20px;" class="card-title" style="">입니다.</h4>
					<button id="login" type="button" class="btn btn-info" style="width: 100%; display: inline;">로그인 페이지로</button>
				</div>
			  </div>
		</div>
		<script>
			${FID = ""}
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
			$(location).attr('href', '/www/feed.mr');
		})
		$('#login').click(function() {
			$(location).attr('href', '/www/login.mr');
		})
		
		$('#mail').keyup(function(){
			$('#mail').attr('class', '');
			$('#mail').toggleClass('form-control');
			$('#mailCheckInfo').attr('class', '');
			$('#mailCheckInfo').toggleClass('invalid-feedback');
			$('#mailCheckInfo').html('');
		})
		
		$('#tel').keyup(function(){
			$('#tel').attr('class', '');
			$('#tel').toggleClass('form-control');
			$('#telCheckInfo').attr('class', '');
			$('#telCheckInfo').toggleClass('invalid-feedback');
			$('#telCheckInfo').html('');
		})
	}); 
		
		function inputCheck(){
			
			if($("#mail").val() == "") {
				
				
				$('#mail').attr('class', '');
				$('#mail').toggleClass('form-control is-invalid');
				$('#mailCheckInfo').attr('class', '');
				$('#mailCheckInfo').toggleClass('invalid-feedback');
				$('#mailCheckInfo').html('이메일을 입력해주세요.');
				
				return false;
			}
			if($('#tel').val() == "") {
				$('#tel').attr('class', '');
				$('#tel').toggleClass('form-control is-invalid');
				$('#telCheckInfo').attr('class', '');
				$('#telCheckInfo').toggleClass('invalid-feedback');
				$('#telCheckInfo').html('전화번호를 입력해주세요.');
				
				return false;
			}
		}
	</script>
</body>
</html>