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
	
			<div class="card text-white bg-primary mb-" style="max-width:40rem;">
				<div class="card-header">MUSIC COLOR</div>
				<div class="card-body">
					<h4 class="card-title" style="margin-bottom: 30px;">아이디  & 비밀번호 찾기 </h4>
					<form method="POST" action="/www/joinProc.mr" >
S						
						<div class="form-group">
							<label for="m_name">Name</label>
							<input name="m_name"  type="text" class="form-control" id="m_name" placeholder="Enter Your Name">
							<p id="m_nameCheckInfo" class="text-info"></p>
						</div>
						<br>
						<div class="form-group">
							<label for="m_email">E-mail</label>
							<input name="m_email" type="text" class="form-control" id="m_email" placeholder="Enter Your E-mail">
							<p id="m_emailCheckInfo" class="text-info"></p>
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
	
	
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>	
<script type="text/javascript">

</script>
</body>
</html>